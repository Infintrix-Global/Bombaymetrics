<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="UserAccess.aspx.cs" Inherits="Bombaymetrics.UserManagement.UserAccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<div class="table-scrollable">
        <asp:Panel ID="PanelMenu" runat="server" Visible="false">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" HeaderStyle-CssClass="tableheader text-white" 
                Width="200px" onrowdatabound="GridView1_RowDataBound">
                <columns>
                    <asp:TemplateField>
                        <headertemplate>
                            <asp:CheckBox ID="chkSelectAll" runat="server" onclick="javascript:SelectAllCheckboxes11(this);" />
                        </headertemplate>
                        <itemtemplate>
                            <asp:CheckBox ID="chkSelectMenuId" runat="server" />
                            
                            <asp:Label ID="LabelParentMenuID" runat="server" Visible="false" Text='<%# Bind("MenuID") %>'></asp:Label>
                         
                        </itemtemplate>
                    </asp:TemplateField>
                </columns>
                <columns>
                    <asp:TemplateField>
                        <headertemplate>
                            Menu Name:
                                    <asp:DropDownList ID="ddlParent" runat="server" OnSelectedIndexChanged="MenuChanged"
                                        AutoPostBack="true"
                                        AppendDataBoundItems="true">
                                        <asp:ListItem Text="ALL" Value="ParentId"></asp:ListItem>

                                    </asp:DropDownList>
                        </headertemplate>
                        <itemtemplate>
                            <%# Eval("MenuName")%>
                        </itemtemplate>
                    </asp:TemplateField>
                 
                </columns>
            </asp:GridView>
        </asp:Panel>
    </div>--%>
</asp:Content>
