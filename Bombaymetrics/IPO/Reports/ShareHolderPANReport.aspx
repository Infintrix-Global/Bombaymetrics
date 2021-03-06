<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShareHolderPANReport.aspx.cs" MasterPageFile="~/Main.Master" Inherits="Bombaymetrics.ShareHolderPANReport" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="containerfluid py-3">
        <h2 class="text-center text-uppercase">Report</h2>
        <div class="card" style="margin:0em 2em  0em 2em">
            <div class="card-header  text-uppercase text-white">
                <h5>Shareholder PAN Report</h5>
            </div> 
            <div class="card-body table-responsive">              
                <asp:GridView ID="GridView1" ClientIDMode="Static" HeaderStyle-CssClass="tableheader text-white" ShowHeaderWhenEmpty="true" runat="server" AutoGenerateColumns="true" CssClass="table table-hover">
                    <EmptyDataTemplate>
                        <div class="text-center">No record found</div>
                    </EmptyDataTemplate>

                </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>
