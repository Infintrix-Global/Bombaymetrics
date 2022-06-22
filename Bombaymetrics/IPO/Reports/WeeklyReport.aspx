<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WeeklyReport.aspx.cs" MasterPageFile="~/Main.Master" Inherits="Bombaymetrics.WeeklyReport" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="containerfluid py-3">
        <h2 class="text-center heading text-uppercase">Report</h2>
        <div class="card" style="margin: 0em 2em  0em 2em">
            <div class="card-header text-uppercase text-white">
                <h5>Weekly Holding Report</h5>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <ul class="nav nav-stacked">
                        <li><strong>From Date:  </strong></li>
                        <li>
                            <input type="date" class="form-control" runat="server" id="FromDate" />
                        </li>
                    </ul>
                </div>
                <div class="col-md-2">
                    <ul class="nav nav-stacked">
                        <li><strong>To Date:  </strong></li>
                        <li>
                            <input type="date" class="form-control" runat="server" id="ToDate" />
                        </li>
                    </ul>
                </div>
                <div class="col-md-2">
                    <ul class="nav nav-stacked">
                        <li>&nbsp;</li>
                        <li>
                            <asp:Button runat="server" OnClick="btnSearch_Click" class="btn btn-primary" Text="Search" type="button" ID="btnSearch"></asp:Button>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="card-body table-responsive">
                <asp:GridView ID="GridView1" ClientIDMode="Static" HeaderStyle-CssClass="tableheader text-white" ShowHeaderWhenEmpty="true" runat="server" AutoGenerateColumns="true" CssClass="table  table-hover">
                    <EmptyDataTemplate>
                        <div class="text-center">No record found</div>
                    </EmptyDataTemplate>

                </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>
