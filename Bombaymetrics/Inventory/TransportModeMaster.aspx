<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="TransportModeMaster.aspx.cs" Inherits="Bombaymetrics.Inventory.TransportModeMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid py-3">
        <h4 class="text-center text-uppercase">Transport Mode Master</h4>
        <div class="card">
            <div class="card-header text-uppercase">
                <h5>Transport Mode List</h5>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-2">

                        <button style="" type="button" class="btn btn-primaryseries" onclick="showHideDiv('divAddSupply')">
                            <i class="fa fa-plus-circle"></i>Add Transport Mode
                        </button>
                    </div>
                    <div class="col-md-12 pt-3" id="divAddSupply" style="display: none">
                        Transport Mode
                        <asp:TextBox runat="server" ID="txtTransModeCode" />
                        <asp:RequiredFieldValidator ID="requiredfieldvalidator1" runat="server" ControlToValidate="txtTransModeCode"
                            SetFocusOnError="true" ErrorMessage="Please enter Transport Mode" ForeColor="red"></asp:RequiredFieldValidator>
                        <asp:Button runat="server" ID="btnAdd" OnClick="btnAdd_Click" Text="Submit" CssClass="btn btn-primaryseries" />
                    </div>

                </div>
                <div class="table-responsive mt-lg-5 mt-xl-0">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:GridView ID="GridView1" ClientIDMode="Static" HeaderStyle-CssClass="tableheader text-white" ShowHeaderWhenEmpty="false" DataKeyNames="TransModeID"
                                runat="server" AutoGenerateColumns="true" CssClass="table  table-hover" OnRowDeleting="GridView1_OnRowDeleting"
                                OnRowEditing="GridView1_RowEditing" OnRowDataBound="GridView1_OnRowDataBound" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit">
                                <Columns>
                                    <asp:CommandField ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="edit-button btnedit" />
                                    <asp:CommandField ShowDeleteButton="True" ButtonType="Button" ControlStyle-CssClass="delete-button btndelete" />
                                </Columns>
                                <EmptyDataTemplate>
                                    <div class="text-center">No record found</div>
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
