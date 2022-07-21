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
    public partial class Customers : System.Web.UI.Page
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
            DataSet ds = objGeneral.GetDataSet("GetCustomers");

            if (ds != null && ds.Tables.Count > 0)
            {
                GridView1.DataSource = ds.Tables[0];
                GridView1.DataBind();
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
            SqlParameter Param = new SqlParameter("@CustomerID", SqlDbType.Int);
            Param.Value = id;
            SQLcmdParameters[0] = Param;
            objGeneral.GetDataInsertORUpdate("DeleteCustomer", SQLcmdParameters);

            BindGridview();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Response.Redirect("~/Inventory/CustomerMaster.aspx?CustomerID=" + GridView1.DataKeys[e.NewEditIndex].Value.ToString());
        }

    }
}