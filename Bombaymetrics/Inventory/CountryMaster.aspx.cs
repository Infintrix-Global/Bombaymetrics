using Bombaymetrics.BAL;
using System;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bombaymetrics.Inventory
{
    public partial class CountryMaster : System.Web.UI.Page
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

            DataSet ds = objGeneral.GetDataSet("GetCountries");

            if (ds != null && ds.Tables.Count > 0)
            {
                DataTable dt = ds.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

            General objGeneral = new General();

            SqlParameter[] SQLcmdParameters = new SqlParameter[2];
            SqlParameter Param = new SqlParameter("@CountryCode", SqlDbType.VarChar);
            Param.Value = txtCountryCode.Text;
            SQLcmdParameters[0] = Param;
            Param = new SqlParameter("@CountryName", SqlDbType.VarChar);
            Param.Value = txtCountryName.Text;
            SQLcmdParameters[1] = Param;

            objGeneral.GetDataInsertORUpdate("InsertCountry", SQLcmdParameters);

            BindGridview();
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
            SqlParameter Param = new SqlParameter("@CountryID", SqlDbType.Int);
            Param.Value = id;
            SQLcmdParameters[0] = Param;
            objGeneral.GetDataInsertORUpdate("DeleteCountry", SQLcmdParameters);

            BindGridview();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGridview();
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {            
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            int id = Convert.ToInt32(e.Keys[0]);
            TextBox txtCode = (TextBox)row.Cells[3].Controls[0];
            TextBox txtName = (TextBox)row.Cells[4].Controls[0];
            General objGeneral = new General();

            SqlParameter[] SQLcmdParameters = new SqlParameter[3];
            SqlParameter Param = new SqlParameter("@CountryID", SqlDbType.Int);
            Param.Value = id;
            SQLcmdParameters[0] = Param;
            Param = new SqlParameter("@CountryCode", SqlDbType.VarChar);
            Param.Value = txtCode.Text;
            SQLcmdParameters[1] = Param;
            Param = new SqlParameter("@CountryName", SqlDbType.VarChar);
            Param.Value = txtName.Text;
            SQLcmdParameters[2] = Param;

            objGeneral.GetDataInsertORUpdate("UpdateCountry", SQLcmdParameters);
            GridView1.EditIndex = -1;
            BindGridview();
        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGridview();
        }

    }
}