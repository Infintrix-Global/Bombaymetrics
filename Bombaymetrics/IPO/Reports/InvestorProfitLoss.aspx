<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="InvestorProfitLoss.aspx.cs" Inherits="Bombaymetrics.IPO.Reports.InvestorProfitLoss" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="containerfluid py-3">
        <h2 class="text-center text-uppercase">Report</h2>
        <div class="card" style="margin: 0em 2em  0em 2em">
            <div class="card-header text-uppercase text-white">
                <h5>Investor Profit Loss Report</h5>
            </div>

            <div class="card-body table-responsive">
                <div class="row">
                    <div class="col-md-3">
                        <ul class="nav nav-stacked">
                            <li><strong>Investor Name:  </strong></li>
                            <li>
                                <asp:Label class="form-control" runat="server" ID="lblInvestorName" />
                            </li>
                        </ul>
                        <ul class="nav nav-stacked">
                            <li><strong>Investor PAN:  </strong></li>
                            <li>
                                <asp:Label class="form-control" runat="server" ID="lblPAN" />
                            </li>

                        </ul>
                    </div>

                </div>

                <asp:GridView ID="GridView1" ClientIDMode="Static" HeaderStyle-CssClass="tableheader text-white" ShowHeaderWhenEmpty="true" runat="server" AutoGenerateColumns="false" CssClass="table  table-hover">
                    <EmptyDataTemplate>
                        <div class="text-center">No record found</div>
                    </EmptyDataTemplate>
                    <Columns>
                        <asp:BoundField DataField="Investment Date" HeaderText="Investment Date" />
                        <asp:BoundField DataField="Qty" HeaderText="Qty" />
                        <asp:BoundField DataField="Apox VWP price" HeaderText="Apox VWP price" />
                        <asp:BoundField DataField="Holding" HeaderText="Holding" />
                        <asp:BoundField DataField="Investment" DataFormatString="{0:N2}" HeaderText="Investment Value" />
                        <asp:BoundField DataField="ProfitLoss" DataFormatString="{0:N2}" HeaderText="Profit Loss" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
