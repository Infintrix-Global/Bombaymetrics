using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bombaymetrics
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSeries_click(object sender, EventArgs e)
        {
            Response.Redirect("FileUpload.aspx");
        }
        protected void btnFolio_click(object sender, EventArgs e)
        {
            Response.Redirect("FolioUpload.aspx");
        }
    }
}