using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("GetLogin", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    cmd.Parameters.Add(new SqlParameter("@UserName", UserName));
                    cmd.Parameters.Add(new SqlParameter("@Password", Password));
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Login");

                    DataTable dt = ds.Tables[0];
                    if (dt == null || dt.Rows.Count == 0)
                        return 0;
                    DataRow dr = dt.Rows[0];
                    Session["UserID"] = (int)dr[0];
                    Session["UserName"] = (string)dr[1];
                    Session["RoleID"] = (int)dr[3];
                    return (int)dr[0];
                }

            }
            catch (Exception ex)
            {


            }

            return output;

        }
    }
}