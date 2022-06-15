<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SeriesUpload.aspx.cs" MasterPageFile="~/IPOMaster.Master" Inherits="Bombaymetrics.SeriesUpload" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container-fluid py-3">
        <h4 class="text-center text-uppercase heading" style="padding-bottom:2em">Upload excel file</h4>
        <div class="card">
            <div class="card-header  text-uppercase">
                <h5>Import Series Excel File</h5>
            </div>
            <div class="card-body">
                <div style="padding-top:1em;padding-bottom:1.2em">
                <button style="margin-bottom: 10px;" type="button" class="btn btn-primaryseries" data-toggle="modal" data-target="#myModal">
                    <i class="fa fa-plus-circle"></i> Import Excel
                </button>
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
                                                    <asp:Button ID="btnUpload" runat="server" CssClass="btn btn-outline-primary" Text="Upload" OnClick="btnUpload_Click" />
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
                </div></div>
                <asp:GridView ID="GridView1" ClientIDMode="Static" HeaderStyle-CssClass="tableheader text-white" ShowHeaderWhenEmpty="true" runat="server" AutoGenerateColumns="true" CssClass="table table-responsive-xl table-hover">
                    <EmptyDataTemplate>
                        <div class="text-center">No record found</div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>
