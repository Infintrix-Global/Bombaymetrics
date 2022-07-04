using Bombaymetrics.BAL;
using System;
using System.Collections.Specialized;
using System.Data;

namespace Bombaymetrics
{
    public partial class ShareHolderPANReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridview();
            }
        }

        private void BindGridview()
        {
            General objGeneral = new General();
            NameValueCollection nv = new NameValueCollection();
            DataSet ds = objGeneral.GetDataSet("GetShareHolderPANReport", nv);

            if (ds != null && ds.Tables.Count > 0)
            {
                GridView1.DataSource = ds.Tables[0];               
                GridView1.DataBind();
            }
        }

    }
}


