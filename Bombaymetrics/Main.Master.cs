using Bombaymetrics.BAL;
using System;
using System.Collections.Specialized;
using System.Data;
using System.Linq;
using System.Web.UI;

namespace Bombaymetrics
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Session.RemoveAll();
                Response.Redirect("~/Login.aspx");
            }

            BindMenu();
        }
        private void BindMenu()
        {
            General objGeneral = new General();
            NameValueCollection nv = new NameValueCollection();
            nv.Add("UserID", Session["UserID"].ToString());
            DataSet ds = objGeneral.GetDataSet("GetMenu", nv);
            if (ds != null && ds.Tables.Count > 0)
            {
                DataTable AllMenu = ds.Tables[0];

                var MenuParent = (from DataRow dr in AllMenu.Rows
                                  where dr["ParentID"].ToString() == "0"
                                  select dr
                               );
                DataTable dtMenu = MenuParent != null ? MenuParent.CopyToDataTable() : null;

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
