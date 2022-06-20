using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.OleDb;
using System.Data.Common;
using System.Web.UI;

namespace Bombaymetrics
{
    public partial class SeriesUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridview();
            }
        }



        private void BindGridview()
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("GetSeries", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
            }
        }
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.PostedFile != null)
            {
                try
                {
                    string path = string.Concat(Server.MapPath("~/UploadFile/" + FileUpload1.FileName));
                    FileUpload1.SaveAs(path);
                    // Connection String to Excel Workbook
                    //string excelCS = string.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=Excel 8.0", path);
                    string excelCS = string.Format(ConfigurationManager.ConnectionStrings["ExcelConn"].ConnectionString, path);
                    using (OleDbConnection con = new OleDbConnection(excelCS))
                    {
                        //Get the name of First Sheet.  
                        con.Open();
                        DataTable dtExcelSchema;
                        dtExcelSchema = con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
                        string sheetName = "Series$";
                        con.Close();

                        OleDbCommand cmd = new OleDbCommand("select * from [" + sheetName + "]", con);
                        con.Open();
                        // Create DbDataReader to Data Worksheet
                        DbDataReader dr = cmd.ExecuteReader();
                        // SQL Server Connection String
                        string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                        // Bulk Copy to SQL Server 
                        SqlBulkCopy bulkInsert = new SqlBulkCopy(CS);
                        bulkInsert.DestinationTableName = "Series";
                        bulkInsert.WriteToServer(dr);
                        BindGridview();
                        lblMessage.Text = "Your file uploaded successfully";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);

                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Your file not uploaded" + ex.StackTrace;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
                }
            }
        }
    }
}


