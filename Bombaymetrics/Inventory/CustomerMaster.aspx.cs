using Bombaymetrics.BAL;
using System;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Bombaymetrics.Inventory
{
    public partial class CustomerMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDropdowns();
                if (!string.IsNullOrEmpty(Request["CustomerID"]))
                {
                    header.InnerHtml = "Update Customer";
                    btnAdd.Text = "Update Customer";
                    GetCustomerData();
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

        private void GetCustomerData()
        {
            General objGeneral = new General();
            NameValueCollection nv = new NameValueCollection();
            nv.Add("CustomerID", Request["CustomerID"]);
            DataSet ds = objGeneral.GetDataSet("GetCustomer", nv);

            if (ds != null && ds.Tables.Count > 0)
            {
                DataTable dt = ds.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    txtLegalName.Text = dr["LegalName"].ToString();
                    txtPhone.Text = dr["Phone"].ToString();
                    txtAddress.Text = dr["Address"].ToString();
                    txtPlace.Text = dr["Place"].ToString();
                    ddlState.SelectedValue = dr["StateCode"].ToString();
                    txtPinCode.Text = dr["PinCode"].ToString();
                    txtFax.Text = dr["Fax"].ToString();
                }
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request["CustomerID"]))
            {
                General objGeneral = new General();

                SqlParameter[] SQLcmdParameters = new SqlParameter[8];
                SqlParameter Param = new SqlParameter("@CustomerID", SqlDbType.VarChar);
                Param.Value = Request["CustomerID"];
                SQLcmdParameters[0] = Param;
                Param = new SqlParameter("@LegalName", SqlDbType.VarChar);
                Param.Value = txtLegalName.Text;
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
                Param = new SqlParameter("@Phone", SqlDbType.VarChar);
                Param.Value = txtPhone.Text;
                SQLcmdParameters[6] = Param;
                Param = new SqlParameter("@Fax", SqlDbType.VarChar);
                Param.Value = txtFax.Text;
                SQLcmdParameters[7] = Param;
                objGeneral.GetDataInsertORUpdate("UpdateCustomer", SQLcmdParameters);
            }
            else
            {
                General objGeneral = new General();

                SqlParameter[] SQLcmdParameters = new SqlParameter[7];
                SqlParameter Param = new SqlParameter("@LegalName", SqlDbType.VarChar);
                Param.Value = txtLegalName.Text;
                SQLcmdParameters[0] = Param;
                Param = new SqlParameter("@Address", SqlDbType.VarChar);
                Param.Value = txtAddress.Text;
                SQLcmdParameters[1] = Param;
                Param = new SqlParameter("@Place", SqlDbType.VarChar);
                Param.Value = txtPlace.Text;
                SQLcmdParameters[2] = Param;
                Param = new SqlParameter("@StateCode", SqlDbType.VarChar);
                Param.Value = ddlState.SelectedValue;
                SQLcmdParameters[3] = Param;
                Param = new SqlParameter("@PinCode", SqlDbType.VarChar);
                Param.Value = txtPinCode.Text;
                SQLcmdParameters[4] = Param; 
                Param = new SqlParameter("@Phone", SqlDbType.VarChar);
                Param.Value = txtPhone.Text;
                SQLcmdParameters[5] = Param;
                Param = new SqlParameter("@Fax", SqlDbType.VarChar);
                Param.Value = txtFax.Text;
                SQLcmdParameters[6] = Param;

                objGeneral.GetDataInsertORUpdate("InsertCustomer", SQLcmdParameters);
            }
            Response.Redirect("~/Inventory/Customers.aspx");
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Inventory/Customers.aspx");
        }
    }
}