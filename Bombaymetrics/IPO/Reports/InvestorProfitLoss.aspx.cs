using System;
using System.Collections.Generic;
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
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("GetInvestorProfitLossReport", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.Parameters.Add(new SqlParameter("UserID", Convert.ToInt16(Request.QueryString["InvestorID"])));
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
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
}