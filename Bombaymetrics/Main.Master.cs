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
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Session.RemoveAll();
                Response.Redirect("Login.aspx");
            }

            BindMenu();
        }
        private void BindMenu()
        {

            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                if (con.State == ConnectionState.Closed)
                    con.Open();

                SqlCommand cmd = new SqlCommand("GetMenu", con);
                cmd.Parameters.Add(new SqlParameter("@UserID", Session["UserID"]));
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds, "Menu");

                DataTable AllMenu = ds.Tables[0];

                var MenuParent = (from DataRow dr in AllMenu.Rows
                                  where dr["ParentID"].ToString() == "0"
                                  select dr
                               );
                DataTable dtMenu = MenuParent != null ? MenuParent.CopyToDataTable() : null;

                //DataTable dtMenu = MenuParent;

                foreach (DataRow row in dtMenu.Rows)
                {
                    DataRow[] dtSubMenu = AllMenu.Select("ParentID=" + row["MenuID"].ToString());

                    if (dtSubMenu.Count() != 0)
                    {
                        var literalMenu = new LiteralControl("<li class='nav-item active dropdown'><a  href='#' data-bs-toggle='dropdown' class='nav-link dropdown-toggle'>" + row["MenuName"].ToString() + "<span class='sr-only'>(current)</span></a>");
                        PlhldrMenu.Controls.Add(literalMenu);
                    }
                    else
                    {
                        var literalMenu = new LiteralControl("<li class='nav-item active'><a class='nav-link' href='" + ResolveClientUrl(row["Path"].ToString()) + "'>" + row["MenuName"].ToString() + "<span class='sr-only'>(current)</span>" + "</a>");
                        PlhldrMenu.Controls.Add(literalMenu);
                    }

                    var literalSubMenuolds = new LiteralControl("<div class='dropdown-menu'>");
                    PlhldrMenu.Controls.Add(literalSubMenuolds);
                    foreach (DataRow rowSubMenu in dtSubMenu)
                    {
                        var literalSubMenu = new LiteralControl("<a  class='dropdown-item' href=" + ResolveClientUrl(rowSubMenu["Path"].ToString()) + "> " + rowSubMenu["MenuName"].ToString() + " <span class='sr-only'>(current)</span></a>");
                        PlhldrMenu.Controls.Add(literalSubMenu);
                    }
                    var literalSubMenuoldclose = new LiteralControl("</div>");
                    PlhldrMenu.Controls.Add(literalSubMenuoldclose);
                    var literalMenu1 = new LiteralControl("</li>");
                    PlhldrMenu.Controls.Add(literalMenu1);
                }
            }
        }
    }
}