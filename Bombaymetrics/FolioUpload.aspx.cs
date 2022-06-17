using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.OleDb;
using System.Data.Common;

namespace Bombaymetrics
{
    public partial class FolioUpload : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("GetFolio", con);
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
                        string sheetName = "Folio$";
                        con.Close();

                        DataTable dt = new DataTable();
                        OleDbCommand cmd = new OleDbCommand("select * from [" + sheetName + "]", con);
                        con.Open();
                        // Create DbDataReader to Data Worksheet
                        OleDbDataAdapter adapter = new OleDbDataAdapter(cmd);
                        adapter.Fill(dt);
                        // SQL Server Connection String
                        string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                       
                      
                            //call SP
                            using (SqlConnection SQLcon = new SqlConnection(CS))
                            {
                                using (SqlCommand SQLcmd = new SqlCommand("InsertFolio", SQLcon))
                                {
                                SQLcon.Open();
                                foreach (DataRow dr in dt.Rows)
                                {
                                    SQLcmd.CommandType = CommandType.StoredProcedure;

                                    SQLcmd.Parameters.Add("@AsOnDate", SqlDbType.Date).Value = dr[0];
                                    SQLcmd.Parameters.Add("@FolioNo", SqlDbType.VarChar).Value = dr[1];
                                    SQLcmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = dr[2];
                                    SQLcmd.Parameters.Add("@Holding", SqlDbType.Decimal).Value = dr[3];
                                    SQLcmd.Parameters.Add("@Category", SqlDbType.VarChar).Value = dr[4];
                                    SQLcmd.Parameters.Add("@LockingHolding", SqlDbType.Decimal).Value = dr[5];
                                    SQLcmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = dr[6];
                                    SQLcmd.Parameters.Add("@PanNo", SqlDbType.VarChar).Value = dr[7];
                                    SQLcmd.Parameters.Add("@PhoneNo", SqlDbType.VarChar).Value = dr[8];
                                    SQLcmd.Parameters.Add("@PledgeQty", SqlDbType.Decimal).Value = dr[9];

                                    SQLcmd.ExecuteNonQuery();
                                }
                                SQLcon.Close();
                            }
                        }
                       
                        BindGridview();
                        lblMessage.Text = "Your file uploaded successfully";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Your file not uploaded" + ex.Message;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}


