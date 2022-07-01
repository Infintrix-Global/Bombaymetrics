<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvestorHoldingReport.aspx.cs" MasterPageFile="~/Main.Master" Inherits="Bombaymetrics.InvestorHoldingReport" %>

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
                <div class="row">
                    <div class="col-md-3">
                        <ul class="nav nav-stacked">
                            <li><strong>As On Date:  </strong></li>
                            <li>
                                <input type="date" class="form-control" runat="server" id="AsOnDate" />
                            </li>
                            <%--<asp:Label runat="server" ID="lblDate" />--%>
                        </ul>
                    </div>
                    <div class="col-md-3">
                        <ul class="nav nav-stacked">
                            <li>&nbsp;</li>
                            <li>
                                <asp:Button runat="server" OnClick="btnSearch_Click" class="btn btn-primary" Text="Search" type="button" ID="btnSearch"></asp:Button>
                            </li>
                        </ul>
                    </div>
                </div>

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
                        
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>
