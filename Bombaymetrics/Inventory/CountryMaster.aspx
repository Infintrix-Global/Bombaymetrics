<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="CountryMaster.aspx.cs" Inherits="Bombaymetrics.Inventory.CountryMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function showHideDiv(ele) {
            var srcElement = document.getElementById(ele);
            if (srcElement != null) {
                if (srcElement.style.display == "block") {
                    srcElement.style.display = 'none';
                }
                else {
                    srcElement.style.display = 'block';
                }
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid py-3">
        <h4 class="text-center text-uppercase">Country Master</h4>
        <div class="card">
            <div class="card-header text-uppercase">
                <h5>Country List</h5>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-2">

                        <button style="" type="button" class="btn btn-primaryseries" onclick="showHideDiv('divAdd')">
                            <i class="fa fa-plus-circle"></i>Add Country
                        </button>
                    </div>
                    <div class="col-md-12 pt-3" id="divAdd" style="display: none">
                        Country Code 
                        <asp:TextBox runat="server" ID="txtCountryCode" />
                        Country Name
                        <asp:TextBox runat="server" ID="txtCountryName" />
                        <asp:Button runat="server" ID="btnAdd" OnClick="btnAdd_Click" Text="Submit" CssClass="btn btn-primaryseries" />
                    </div>

                </div>
                <div class="table-responsive">                   
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:GridView ID="GridView1" ClientIDMode="Static" HeaderStyle-CssClass="tableheader text-white" ShowHeaderWhenEmpty="false" DataKeyNames="CountryID"
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
