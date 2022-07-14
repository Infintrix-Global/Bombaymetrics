using Bombaymetrics.BAL;
using System;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Bombaymetrics.Inventory
{
    public partial class CountryMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetData();
            }
        }


        private void GetData()
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

            GetData();
        }

    }
}