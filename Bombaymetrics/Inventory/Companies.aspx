<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Companies.aspx.cs" Inherits="Bombaymetrics.Inventory.Companies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid py-3">
        <h4 class="text-center text-uppercase">Company Master</h4>
        <div class="card">
            <div class="card-header text-uppercase">
                <h5>Company List</h5>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-2">                       
                        <a href="CompanyMaster.aspx" class="pl-2">
                            <button style="" type="button" class="btn btn-primaryseries">
                                <i class="fa fa-plus-circle"></i>Add Company
                            </button>
                        </a>
                    </div>                    
                </div>
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" ClientIDMode="Static" HeaderStyle-CssClass="tableheader text-white" ShowHeaderWhenEmpty="false" DataKeyNames="CompanyID"
                        runat="server" AutoGenerateColumns="true" CssClass="table  table-hover" OnRowDeleting="GridView1_OnRowDeleting"
                        OnRowEditing="GridView1_RowEditing" OnRowDataBound="GridView1_OnRowDataBound" >
                        <Columns>                           
                            <asp:CommandField ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="edit-button" />
                            <asp:CommandField ShowDeleteButton="True" ButtonType="Button" ControlStyle-CssClass="delete-button" />
                        </Columns>
                        <EmptyDataTemplate>
                            <div class="text-center">No record found</div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
