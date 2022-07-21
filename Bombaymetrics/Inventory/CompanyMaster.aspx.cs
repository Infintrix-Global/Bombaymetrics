using Bombaymetrics.BAL;
using System;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Bombaymetrics.Inventory
{
    public partial class CompanyMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDropdowns();
                if (!string.IsNullOrEmpty(Request["CompanyID"]))
                {
                    header.InnerHtml = "Update Company";
                    btnAdd.Text = "Update Company";
                    GetCompanyData();
                }
            }
        }

        private void BindDropdowns()
        {
            General objGeneral = new General();
            DataSet ds = objGeneral.GetDataSet("GetStates");

            if (ds != null && ds.Tables.Count > 0)
            {
                ddlState.DataSource = ds.Tables[0];
                ddlState.DataBind();
                ddlState.Items.Insert(0, new ListItem("Select State", "0"));
            }           
        }

        private void GetCompanyData()
        {
            General objGeneral = new General();
            NameValueCollection nv = new NameValueCollection();
            nv.Add("CompanyID", Request["CompanyID"]);
            DataSet ds = objGeneral.GetDataSet("GetCompany", nv);

            if (ds != null && ds.Tables.Count > 0)
            {
                DataTable dt = ds.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    txtLegalName.Text = dr["LegalName"].ToString();
                    txtGSTIN.Text = dr["GSTIN"].ToString();
                    txtAddress.Text = dr["Address"].ToString();
                    txtPlace.Text = dr["Place"].ToString();
                    ddlState.SelectedValue = dr["StateCode"].ToString();
                    txtPinCode.Text = dr["PinCode"].ToString();
                    txtCIN.Text = dr["CIN"].ToString();
                }
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request["CompanyID"]))
            {
                General objGeneral = new General();

                SqlParameter[] SQLcmdParameters = new SqlParameter[8];
                SqlParameter Param = new SqlParameter("@CompanyID", SqlDbType.VarChar);
                Param.Value = Request["CompanyID"];
                SQLcmdParameters[0] = Param;
                Param = new SqlParameter("@LegalName", SqlDbType.VarChar);
                Param.Value = txtLegalName.Text;
                SQLcmdParameters[1] = Param;
                Param = new SqlParameter("@GSTIN", SqlDbType.VarChar);
                Param.Value = txtGSTIN.Text;
                SQLcmdParameters[2] = Param;
                Param = new SqlParameter("@Address", SqlDbType.VarChar);
                Param.Value = txtAddress.Text;
                SQLcmdParameters[3] = Param;
                Param = new SqlParameter("@Place", SqlDbType.VarChar);
                Param.Value = txtPlace.Text;
                SQLcmdParameters[4] = Param;
                Param = new SqlParameter("@StateCode", SqlDbType.VarChar);
                Param.Value = ddlState.SelectedValue;
                SQLcmdParameters[5] = Param;
                Param = new SqlParameter("@PinCode", SqlDbType.VarChar);
                Param.Value = txtPinCode.Text;
                SQLcmdParameters[6] = Param;
                Param = new SqlParameter("@CIN", SqlDbType.VarChar);
                Param.Value = txtCIN.Text;
                SQLcmdParameters[7] = Param;
                objGeneral.GetDataInsertORUpdate("UpdateCompany", SQLcmdParameters);
            }
            else
            {
                General objGeneral = new General();

                SqlParameter[] SQLcmdParameters = new SqlParameter[7];
                SqlParameter Param = new SqlParameter("@LegalName", SqlDbType.VarChar);
                Param.Value = txtLegalName.Text;
                SQLcmdParameters[0] = Param;
                Param = new SqlParameter("@GSTIN", SqlDbType.VarChar);
                Param.Value = txtGSTIN.Text;
                SQLcmdParameters[1] = Param;
                Param = new SqlParameter("@Address", SqlDbType.VarChar);
                Param.Value = txtAddress.Text;
                SQLcmdParameters[2] = Param;
                Param = new SqlParameter("@Place", SqlDbType.VarChar);
                Param.Value = txtPlace.Text;
                SQLcmdParameters[3] = Param;
                Param = new SqlParameter("@StateCode", SqlDbType.VarChar);
                Param.Value = ddlState.SelectedValue;
                SQLcmdParameters[4] = Param;
                Param = new SqlParameter("@PinCode", SqlDbType.VarChar);
                Param.Value = txtPinCode.Text;
                SQLcmdParameters[5] = Param;
                Param = new SqlParameter("@CIN", SqlDbType.VarChar);
                Param.Value = txtCIN.Text;
                SQLcmdParameters[6] = Param;

                objGeneral.GetDataInsertORUpdate("InsertCompany", SQLcmdParameters);
            }
            Response.Redirect("~/Inventory/Companies.aspx");
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Inventory/Companies.aspx");
        }
    }
}