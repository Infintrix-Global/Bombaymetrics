using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.OleDb;
using System.Data.Common;
using Bombaymetrics.BAL;
using System.Collections.Specialized;

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
            General objGeneral = new General();
            NameValueCollection nv = new NameValueCollection();
            nv.Add("FromDate", FromDate.Value);
            nv.Add("ToDate", ToDate.Value);           
            DataSet ds = objGeneral.GetDataSet("GetWeekAverageDateWiseReport", nv);

            if (ds != null && ds.Tables.Count > 0)
            {
                GridView1.DataSource = ds.Tables[0];
                GridView1.DataBind();
            }           
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGridview();
        }
    }
}


