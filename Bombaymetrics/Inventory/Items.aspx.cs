using Bombaymetrics.BAL;
using System;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bombaymetrics.Inventory
{
    public partial class Items : System.Web.UI.Page
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
            DataSet ds = objGeneral.GetDataSet("GetItems");

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
                        string sheetName = "Item$";
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
                            SqlParameter[] SQLcmdParameters = new SqlParameter[7];
                            SqlParameter Param = new SqlParameter("@ItemNo", SqlDbType.VarChar);
                            Param.Value = dr[0];
                            SQLcmdParameters[0] = Param;
                            Param = new SqlParameter("@ItemDescription", SqlDbType.VarChar);
                            Param.Value = dr[1];
                            SQLcmdParameters[1] = Param;
                            Param = new SqlParameter("@GoodsService", SqlDbType.VarChar);
                            Param.Value = dr[2];
                            SQLcmdParameters[2] = Param;
                            Param = new SqlParameter("@UOM", SqlDbType.VarChar);
                            Param.Value = dr[3];
                            SQLcmdParameters[3] = Param;
                            Param = new SqlParameter("@GSTRate", SqlDbType.VarChar);
                            Param.Value = dr[4];
                            SQLcmdParameters[4] = Param;
                            Param = new SqlParameter("@HTSCode", SqlDbType.VarChar);
                            Param.Value = dr[5];
                            SQLcmdParameters[5] = Param;
                            Param = new SqlParameter("@HsnCode", SqlDbType.VarChar);
                            Param.Value = dr[6];
                            SQLcmdParameters[6] = Param;

                            objGeneral.GetDataInsertORUpdate("InsertItem", SQLcmdParameters);
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
        protected void GridView1_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {              
                foreach (Button button in e.Row.Cells[1].Controls.OfType<Button>())
                {
                    if (button.CommandName == "Delete")
                    {
                        button.Attributes["onclick"] = "if(!confirm('Do you want to delete this record?')){ return false; };";
                    }
                }
            }
        }

        protected void GridView1_OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(e.Keys[0]);
            General objGeneral = new General();

            SqlParameter[] SQLcmdParameters = new SqlParameter[1];
            SqlParameter Param = new SqlParameter("@ItemID", SqlDbType.Int);
            Param.Value = id;
            SQLcmdParameters[0] = Param;
            objGeneral.GetDataInsertORUpdate("DeleteItem", SQLcmdParameters);

            BindGridview();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Response.Redirect("~/Inventory/ItemMaster.aspx?ItemID=" + GridView1.DataKeys[e.NewEditIndex].Value.ToString());
        }

    }
}