<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvestorSummaryReport.aspx.cs" MasterPageFile="~/Main.Master" Inherits="Bombaymetrics.InvestorSummaryReport" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="containerfluid py-3">
        <h2 class="text-center text-uppercase">Report</h2>
        <div class="card" style="margin: 0em 2em  0em 2em">
            <div class="card-header text-uppercase text-white">
                <h5>Investor Holding Report</h5>
            </div>

            <div class="card-body table-responsive">                

                <asp:GridView ID="GridView1" ClientIDMode="Static" HeaderStyle-CssClass="tableheader text-white" ShowHeaderWhenEmpty="true" runat="server" AutoGenerateColumns="false" CssClass="table  table-hover">
                    <EmptyDataTemplate>
                        <div class="text-center">No record found</div>
                    </EmptyDataTemplate>
                    <Columns>
                        <asp:TemplateField HeaderText="Investor Name">
                            <ItemTemplate>
                                <asp:HyperLink runat="server" Text='<%#Eval("UserName")%>' Target="_blank" NavigateUrl='<%# Eval("ID","~/IPO/Reports/InvestorProfitLoss.aspx?InvestorID={0}") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="AsOnDate" HeaderText="As On Date" />
                         <asp:BoundField DataField="TotalShares" HeaderText="Total Shares" />
                         <asp:BoundField DataField="HoldingPercentage" HeaderText="Holding Percentage" />
                         <asp:BoundField DataField="Investment" HeaderText="Investment Value" />
                         <asp:BoundField DataField="ProfitLoss" HeaderText="Profit Loss" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>
