using Bombaymetrics.BAL;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bombaymetrics.IPO.Reports
{
    public partial class InvestorProfitLoss : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["InvestorID"]))
                    BindGridview();
                else
                    lblInvestorName.Text = "User Not Found";
            }
        }
        private void BindGridview()
        {
            General objGeneral = new General();
            NameValueCollection nv = new NameValueCollection();
            nv.Add("UserID", Request.QueryString["InvestorID"]);
            DataSet ds = objGeneral.GetDataSet("GetInvestorProfitLossReport", nv);
            if (ds != null && ds.Tables.Count > 0)
            {
                DataTable dt = ds.Tables[0];
                if (dt != null && dt.Rows.Count > 0)
                {
                    lblInvestorName.Text = dt.Rows[0]["UserName"].ToString();
                    lblPAN.Text = dt.Rows[0]["PanNo"].ToString();
                }
                GridView1.DataSource = ds.Tables[1];
                GridView1.DataBind();
            }           
        }
    }
}