using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.OleDb;
using System.Data.Common;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                        // SQL Server Connection String
                        string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

                        //call SP
                        using (SqlConnection SQLcon = new SqlConnection(CS))
                        {
                            using (SqlCommand SQLcmd = new SqlCommand("InsertSeries", SQLcon))
                            {
                                SQLcon.Open();
                                foreach (DataRow dr in dt.Rows)
                                {
                                    SQLcmd.CommandType = CommandType.StoredProcedure;
                                    SQLcmd.Parameters.Clear();
                                    if (dr[0] != null)
                                    {
                                        SQLcmd.Parameters.Add("@AsOnDate", SqlDbType.Date).Value = dr[0];
                                        SQLcmd.Parameters.Add("@Series", SqlDbType.VarChar).Value = dr[1];
                                        SQLcmd.Parameters.Add("@Open", SqlDbType.Decimal).Value = dr[2];
                                        SQLcmd.Parameters.Add("@High", SqlDbType.Decimal).Value = dr[3];
                                        SQLcmd.Parameters.Add("@Low", SqlDbType.Decimal).Value = dr[4];
                                        SQLcmd.Parameters.Add("@PrevClose", SqlDbType.Decimal).Value = dr[5];
                                        SQLcmd.Parameters.Add("@Ltp", SqlDbType.Decimal).Value = dr[6];
                                        SQLcmd.Parameters.Add("@Close", SqlDbType.Decimal).Value = dr[7];
                                        SQLcmd.Parameters.Add("@vwap", SqlDbType.Decimal).Value = dr[8];
                                        SQLcmd.Parameters.Add("@52WH", SqlDbType.Decimal).Value = dr[9];
                                        SQLcmd.Parameters.Add("@52WL", SqlDbType.Decimal).Value = dr[10];
                                        SQLcmd.Parameters.Add("@Volume", SqlDbType.Decimal).Value = dr[11];
                                        SQLcmd.Parameters.Add("@Value", SqlDbType.Decimal).Value = dr[12];
                                        SQLcmd.Parameters.Add("@NoofTrades", SqlDbType.Int).Value = dr[13];
                                        SQLcmd.Parameters.Add("@PriceBand", SqlDbType.VarChar).Value = dr[14];

                                        SQLcmd.ExecuteNonQuery();
                                    }
                                }
                                SQLcon.Close();
                            }
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


