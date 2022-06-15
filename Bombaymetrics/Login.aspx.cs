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
            Response.Redirect("Dashboard.aspx");
        }
        public int getLoginDetails(string UserName, string Password)
        {

            int output = 0;
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("GeLogin", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    cmd.Parameters.Add(new SqlParameter( "@UserName", UserName));
                    cmd.Parameters.Add(new SqlParameter("@Password", Password));
                    //output = cmd.ExecuteReader("SP_login");
                }

            }
            catch (Exception ex)
            {


            }

            return output;

        }
    }
}