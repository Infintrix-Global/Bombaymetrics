<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="Bombaymetrics.Inventory.Customers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid py-3">
        <h4 class="text-center text-uppercase">Customer Master</h4>
        <div class="card">
            <div class="card-header text-uppercase">
                <h5>Customer List</h5>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-2">                       
                        <a href="CustomerMaster.aspx" class="pl-2">
                            <button style="" type="button" class="btn btn-primaryseries">
                                <i class="fa fa-plus-circle"></i>Add Customer
                            </button>
                        </a>
                    </div>                    
                </div>
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" ClientIDMode="Static" HeaderStyle-CssClass="tableheader text-white" ShowHeaderWhenEmpty="false" DataKeyNames="CustomerID"
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
