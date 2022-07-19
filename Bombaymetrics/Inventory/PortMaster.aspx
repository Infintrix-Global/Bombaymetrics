<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="PortMaster.aspx.cs" Inherits="Bombaymetrics.Inventory.PortMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function showHideDivPort(ele) {
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
        <h4 class="text-center text-uppercase">Port Master</h4>
        <div class="card">
            <div class="card-header text-uppercase">
                <h5>Port List</h5>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12">
                        <button style="" type="button" class="btn btn-primaryseries" onclick="showHideDivPort('divAddPort')">
                            <i class="fa fa-plus-circle"></i>Add Port
                        </button>
                    </div>
                    <div class="col-lg-12 pt-3" id="divAddPort" style="display: none">
                        Port Code 
                        <asp:TextBox runat="server" ID="txtPortCode" />
                        <asp:RequiredFieldValidator ID="requiredfieldvalidator1" runat="server" ControlToValidate="txtPortCode"
                            SetFocusOnError="true" ErrorMessage="Please enter Port Code" ForeColor="red"></asp:RequiredFieldValidator>
                        Port Name
                        <asp:TextBox runat="server" ID="txtPortName" />
                        <asp:RequiredFieldValidator ID="requiredfieldvalidator2" runat="server" ControlToValidate="txtPortName"
                            SetFocusOnError="true" ErrorMessage="Please enter Port Name" ForeColor="red"></asp:RequiredFieldValidator>
                        <asp:Button runat="server" ID="btnAddPort" OnClick="btnAdd_Click" Text="Submit" CssClass="btn btn-primaryseries" />
                    </div>
                </div>
                <div class="table-responsive mt-lg-5 mt-xl-0">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:GridView ID="GridView1" ClientIDMode="Static" HeaderStyle-CssClass="tableheader text-white" ShowHeaderWhenEmpty="false" DataKeyNames="PortID"
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

