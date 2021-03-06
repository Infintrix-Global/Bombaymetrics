using Bombaymetrics.BAL;
using System;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Web.UI;

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
            General objGeneral = new General();
            DataSet ds = objGeneral.GetDataSet("GetFolio");

            if (ds != null && ds.Tables.Count > 0)
            {
                GridView1.DataSource = ds.Tables[0];
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

                        General objGeneral = new General();
                        foreach (DataRow dr in dt.Rows)
                        {
                            SqlParameter[] SQLcmdParameters = new SqlParameter[10];
                            SqlParameter Param = new SqlParameter("@AsOnDate", SqlDbType.Date);
                            Param.Value = dr[0];
                            SQLcmdParameters[0] = Param;                            
                            Param = new SqlParameter("@FolioNo", SqlDbType.VarChar);
                            Param.Value = dr[1];
                            SQLcmdParameters[1] = Param;
                            Param = new SqlParameter("@Name", SqlDbType.VarChar);
                            Param.Value = dr[2];
                            SQLcmdParameters[2] = Param;
                            Param = new SqlParameter("@Holding", SqlDbType.Decimal);
                            Param.Value = dr[3];
                            SQLcmdParameters[3] = Param;
                            Param = new SqlParameter("@Category", SqlDbType.VarChar);
                            Param.Value = dr[4];
                            SQLcmdParameters[4] = Param;
                            Param = new SqlParameter("@LockingHolding", SqlDbType.Decimal);
                            Param.Value = dr[5];
                            SQLcmdParameters[5] = Param;
                            Param = new SqlParameter("@Email", SqlDbType.VarChar);
                            Param.Value = dr[6];
                            SQLcmdParameters[6] = Param;
                            Param = new SqlParameter("@PanNo", SqlDbType.VarChar);
                            Param.Value = dr[7];
                            SQLcmdParameters[7] = Param;
                            Param = new SqlParameter("@PhoneNo", SqlDbType.VarChar);
                            Param.Value = dr[8];
                            SQLcmdParameters[8] = Param;
                            Param = new SqlParameter("@PledgeQty", SqlDbType.Decimal);
                            Param.Value = dr[9];
                            SQLcmdParameters[9] = Param;

                            objGeneral.GetDataInsertORUpdate("InsertFolio", SQLcmdParameters);
                        }
                    }

                    BindGridview();
                    lblMessage.Text = "Your file uploaded successfully.";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);

                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Your file not uploaded. " + ex.Message;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
                }
            }
        }
    }
}


