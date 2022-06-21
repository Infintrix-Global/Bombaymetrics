using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.OleDb;
using System.Data.Common;
using System.Globalization;

namespace Bombaymetrics
{
    public partial class InvestorHoldingReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AsOnDate.Value = getMaxDate().ToString("yyyy-MM-dd");
                BindGridview();
            }
        }

        public DateTime getMaxDate()
        {

            DateTime output = DateTime.Now;
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("GetMaxFolioDate", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    output = (DateTime)cmd.ExecuteScalar();
                }

            }
            catch (Exception ex)
            {


            }

            return output;

        }
        private void BindGridview()
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("GetInvestorShareHoldingDatewiseReport", con);
                string d = AsOnDate.Value;
                DateTime dt = DateTime.ParseExact(d, "yyyy-MM-dd", CultureInfo.InvariantCulture);
                string newString = dt.ToString("MM/dd/yy");
                cmd.Parameters.Add(new SqlParameter("AsOnDate", newString));
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGridview();
        }
    }
}


