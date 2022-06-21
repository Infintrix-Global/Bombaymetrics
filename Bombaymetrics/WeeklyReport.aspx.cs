using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.OleDb;
using System.Data.Common;

namespace Bombaymetrics
{
    public partial class WeeklyReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FromDate.Value = GetStartOfFinancialYear().ToString("yyyy-MM-dd");
                ToDate.Value = GetEndOfFinancialYear().ToString("yyyy-MM-dd");
                BindGridview();
            }
        }
        public DateTime GetStartOfFinancialYear()
        {

            DateTime startOfYear = new DateTime(DateTime.UtcNow.Year, 4, 1);
            return
                DateTime.UtcNow < startOfYear ?
                    startOfYear.AddYears(-1) : startOfYear;

        }
        public DateTime GetEndOfFinancialYear()
        {

            DateTime startOfYear = new DateTime(DateTime.UtcNow.Year, 3, 31);
            return
                DateTime.UtcNow > startOfYear ?
                    startOfYear.AddYears(1) : startOfYear;

        }

        private void BindGridview()
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("GetWeekAverageDateWiseReport", con);
                cmd.Parameters.Add(new SqlParameter("FromDate", FromDate.Value));
                cmd.Parameters.Add(new SqlParameter("ToDate", ToDate.Value));
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
                con.Close();
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGridview();
        }
    }
}


