using Bombaymetrics.BAL;
using System;
using System.Collections.Specialized;
using System.Data;

namespace Bombaymetrics
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnlogin_click(object sender, EventArgs e)
        {
            int UserID = getLoginDetails(txtusername.Text, txtpassword.Text);
            if (UserID > 0)
            {
                Session["UserID"] = UserID;
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                lblError.Visible = true;
            }
        }
        public int getLoginDetails(string UserName, string Password)
        {
            int output = 0;
            General objGeneral = new General();
            NameValueCollection nv = new NameValueCollection();
            nv.Add("UserName", UserName);
            nv.Add("Password", Password);
            DataSet ds = objGeneral.GetDataSet("GetLogin", nv);
            if (ds != null && ds.Tables.Count > 0)
            {
                DataTable dt = ds.Tables[0];
                if (dt == null || dt.Rows.Count == 0)
                    return 0;
                DataRow dr = dt.Rows[0];
                Session["UserID"] = (int)dr[0];
                Session["UserName"] = (string)dr[1];
                Session["RoleID"] = (int)dr[3];
                return (int)dr[0];
            }
            return output;
        }
    }
}