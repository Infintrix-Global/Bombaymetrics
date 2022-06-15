﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WeeklyReport.aspx.cs" MasterPageFile="~/IPOMaster.Master" Inherits="Bombaymetrics.WeeklyReport" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="containerfluid py-3">
        <h2  class="text-center heading text-uppercase" style="padding-bottom:1em">Report</h2>
        <div class="card" style="margin:0em 2em  0em 2em">
            <div class="card-header text-uppercase text-white">
                <h5>Weekly Holding Report</h5>
            </div>
            <div class="card-body">              
                <asp:GridView ID="GridView1" ClientIDMode="Static" HeaderStyle-CssClass="tableheader text-white" ShowHeaderWhenEmpty="true" runat="server" AutoGenerateColumns="true" CssClass="table table-responsive-xl table-hover">
                    <EmptyDataTemplate>
                        <div class="text-center">No record found</div>
                    </EmptyDataTemplate>

                </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>
