<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Items.aspx.cs" Inherits="Bombaymetrics.Inventory.Items" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid py-3">
        <h4 class="text-center text-uppercase">Upload Item List file</h4>
        <div class="card">
            <div class="card-header text-uppercase">
                <h5>Import Item List Excel File</h5>
            </div>
            <div class="card-body">
                <div class="row">
                <div class="col-md-2">
                 <button style="" type="button" class="btn btn-primaryseries" data-toggle="modal" data-target="#myModal">
                 <i class="fa fa-plus-circle"></i> Import Excel
                 </button>
                 <a href="ItemMaster.aspx" class="pl-2">
                 <button style="" type="button" class="btn btn-primaryseries">
                 <i class="fa fa-plus-circle"></i> Add Item
                 </button></a></div>
                    <div class="modal fade" id="myModal">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Import Excel File</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Choose excel file</label>
                                                <div class="input-group">
                                                    <div class="custom-file">
                                                        <asp:FileUpload ID="FileUpload1" CssClass="custom-file-input" runat="server" />
                                                        <label class="custom-file-label"></label>
                                                    </div>
                                                    <label id="filename"></label>
                                                    <div class="input-group-append">
                                                        <asp:Button ID="btnUpload" runat="server" CssClass="btn btn-outline-primary" Text="Upload" OnClick="btnUpload_Click"  />
                                                    </div>
                                                </div>
                                                <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" ClientIDMode="Static" HeaderStyle-CssClass="tableheader text-white" ShowHeaderWhenEmpty="false" runat="server" AutoGenerateColumns="true" CssClass="table  table-hover" >  
                        <Columns>
<%--                          <asp:BoundField DataField="As On Date" HeaderText="As On Date" />--%>           
                            <asp:TemplateField>
                                <ItemTemplate>             
                                    <asp:Button ID="btnedit" Text="Edit" runat="server" BackColor="#176737" BorderColor="White" ForeColor="White" Width="80px"/>
                                </ItemTemplate>
                            </asp:TemplateField><asp:TemplateField>
                                <ItemTemplate>         
<%--                                <a href="delete_methode_link" onclick="return confirm('Are you sure you want to Remove?');">Remove</a>--%>
                                <asp:Button ID="btndel" Text="Delete" runat="server" BackColor="#880808" BorderColor="White" ForeColor="White" Width="80px" OnClientClick="confirmation()"/>
                                </ItemTemplate>
                            </asp:TemplateField>
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