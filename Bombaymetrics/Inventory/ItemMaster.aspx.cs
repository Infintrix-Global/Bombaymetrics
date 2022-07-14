using Bombaymetrics.BAL;
using System;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Bombaymetrics.Inventory
{
    public partial class ItemMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDropdowns();
                if (!string.IsNullOrEmpty(Request["ItemID"]))
                {
                    header.InnerHtml = "Update Item";
                    btnAdd.Text = "Update Item";
                    GetItemData();
                }
            }
        }

        private void BindDropdowns()
        {
            General objGeneral = new General();
            DataSet ds = objGeneral.GetDataSet("GetTaxRateMaster");

            if (ds != null && ds.Tables.Count > 0)
            {
                ddlGSTRate.DataSource = ds.Tables[0];
                ddlGSTRate.DataBind();
                ddlGSTRate.Items.Insert(0, new ListItem("Select GST Rate", "0"));
            }
            ds = objGeneral.GetDataSet("GetHSNMaster");

            if (ds != null && ds.Tables.Count > 0)
            {
                ddlHSNCode.DataSource = ds.Tables[0];
                ddlHSNCode.DataBind();
                ddlHSNCode.Items.Insert(0, new ListItem("Select HSN Code", "0"));
            }
        }

        private void GetItemData()
        {
            General objGeneral = new General();
            NameValueCollection nv = new NameValueCollection();
            nv.Add("ItemID", Request["ItemID"]);
            DataSet ds = objGeneral.GetDataSet("GetItem", nv);

            if (ds != null && ds.Tables.Count > 0)
            {
                DataTable dt = ds.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    txtItemNo.Text = dr["ItemNo"].ToString();
                    txtItemDescription.Text = dr["ItemDescription"].ToString();
                    txtHTSCode.Text = dr["HTSCode"].ToString();
                    ddlGoodsService.Value = dr["GoodsService"].ToString();
                    ddlUOM.Value = dr["UOM"].ToString();
                    
                    ddlGSTRate.SelectedValue = dr["GSTRate"].ToString();
                    ddlHSNCode.SelectedValue = dr["HSNCode"].ToString();
                }
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request["ItemID"]))
            {
                General objGeneral = new General();

                SqlParameter[] SQLcmdParameters = new SqlParameter[8];
                SqlParameter Param = new SqlParameter("@ItemID", SqlDbType.VarChar);
                Param.Value = Request["ItemID"];
                SQLcmdParameters[0] = Param;
                Param = new SqlParameter("@ItemNo", SqlDbType.VarChar);
                Param.Value = txtItemNo.Text;
                SQLcmdParameters[1] = Param;
                Param = new SqlParameter("@ItemDescription", SqlDbType.VarChar);
                Param.Value = txtItemDescription.Text;
                SQLcmdParameters[2] = Param;
                Param = new SqlParameter("@GoodsService", SqlDbType.VarChar);
                Param.Value = ddlGoodsService.Value;
                SQLcmdParameters[3] = Param;
                Param = new SqlParameter("@UOM", SqlDbType.VarChar);
                Param.Value = ddlUOM.Value;
                SQLcmdParameters[4] = Param;
                Param = new SqlParameter("@GSTRate", SqlDbType.VarChar);
                Param.Value = ddlGSTRate.SelectedValue;
                SQLcmdParameters[5] = Param;
                Param = new SqlParameter("@HTSCode", SqlDbType.VarChar);
                Param.Value = txtHTSCode.Text;
                SQLcmdParameters[6] = Param;
                Param = new SqlParameter("@HsnCode", SqlDbType.VarChar);
                Param.Value = ddlHSNCode.SelectedValue;
                SQLcmdParameters[7] = Param;

                objGeneral.GetDataInsertORUpdate("UpdateItem", SQLcmdParameters);
            }
            else
            {
                General objGeneral = new General();

                SqlParameter[] SQLcmdParameters = new SqlParameter[7];
                SqlParameter Param = new SqlParameter("@ItemNo", SqlDbType.VarChar);
                Param.Value = txtItemNo.Text;
                SQLcmdParameters[0] = Param;
                Param = new SqlParameter("@ItemDescription", SqlDbType.VarChar);
                Param.Value = txtItemDescription.Text;
                SQLcmdParameters[1] = Param;
                Param = new SqlParameter("@GoodsService", SqlDbType.VarChar);
                Param.Value = ddlGoodsService.Value;
                SQLcmdParameters[2] = Param;
                Param = new SqlParameter("@UOM", SqlDbType.VarChar);
                Param.Value = ddlUOM.Value;
                SQLcmdParameters[3] = Param;
                Param = new SqlParameter("@GSTRate", SqlDbType.VarChar);
                Param.Value = ddlGSTRate.SelectedValue;
                SQLcmdParameters[4] = Param;
                Param = new SqlParameter("@HTSCode", SqlDbType.VarChar);
                Param.Value = txtHTSCode.Text;
                SQLcmdParameters[5] = Param;
                Param = new SqlParameter("@HsnCode", SqlDbType.VarChar);
                Param.Value = ddlHSNCode.SelectedValue;
                SQLcmdParameters[6] = Param;

                objGeneral.GetDataInsertORUpdate("InsertItem", SQLcmdParameters);
            }
            Response.Redirect("~/Inventory/Items.aspx");
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Inventory/Items.aspx");
        }
    }
}