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
            General objGeneral = new General();
            NameValueCollection nv = new NameValueCollection();
            DataSet ds = objGeneral.GetDataSet("GetSeries", nv);

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
                        string sheetName = "Series$";
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
                            SqlParameter[] SQLcmdParameters = new SqlParameter[15];
                            SqlParameter Param = new SqlParameter("@AsOnDate", SqlDbType.Date);
                            Param.Value = dr[0];
                            SQLcmdParameters[0] = Param;
                            Param = new SqlParameter("@Series", SqlDbType.VarChar);
                            Param.Value = dr[1];
                            SQLcmdParameters[1] = Param;
                            Param = new SqlParameter("@Open", SqlDbType.Decimal);
                            Param.Value = dr[2];
                            SQLcmdParameters[2] = Param;
                            Param = new SqlParameter("@High", SqlDbType.Decimal);
                            Param.Value = dr[3];
                            SQLcmdParameters[3] = Param;
                            Param = new SqlParameter("@Low", SqlDbType.Decimal);
                            Param.Value = dr[4];
                            SQLcmdParameters[4] = Param;
                            Param = new SqlParameter("@PrevClose", SqlDbType.Decimal);
                            Param.Value = dr[5];
                            SQLcmdParameters[5] = Param;
                            Param = new SqlParameter("@Ltp", SqlDbType.Decimal);
                            Param.Value = dr[6];
                            SQLcmdParameters[6] = Param;
                            Param = new SqlParameter("@Close", SqlDbType.Decimal);
                            Param.Value = dr[7];
                            SQLcmdParameters[7] = Param;
                            Param = new SqlParameter("@vwap", SqlDbType.Decimal);
                            Param.Value = dr[8];
                            SQLcmdParameters[8] = Param;
                            Param = new SqlParameter("@52WH", SqlDbType.Decimal);
                            Param.Value = dr[9];
                            SQLcmdParameters[9] = Param;
                            Param = new SqlParameter("@52WL", SqlDbType.Decimal);
                            Param.Value = dr[10];
                            SQLcmdParameters[10] = Param;
                            Param = new SqlParameter("@Volume", SqlDbType.Decimal);
                            Param.Value = dr[11];
                            SQLcmdParameters[11] = Param;
                            Param = new SqlParameter("@Value", SqlDbType.Decimal);
                            Param.Value = dr[12];
                            SQLcmdParameters[12] = Param;
                            Param = new SqlParameter("@NoofTrades", SqlDbType.Int);
                            Param.Value = dr[13];
                            SQLcmdParameters[13] = Param;
                            Param = new SqlParameter("@PriceBand", SqlDbType.VarChar);
                            Param.Value = dr[14];
                            SQLcmdParameters[14] = Param;

                            objGeneral.GetDataInsertORUpdate("InsertSeries", SQLcmdParameters);
                        }
                        
                        BindGridview();
                        lblMessage.Text = "Your file uploaded successfully.";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);

                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Your file not uploaded. " + ex.StackTrace;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
                }
            }
        }

    }
}


