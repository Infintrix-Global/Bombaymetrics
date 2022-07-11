<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ItemMaster.aspx.cs" Inherits="Bombaymetrics.Inventory.ItemMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row justify-content-center mt-5  pt-5 pb-5">
            <div class="col-md-8 pb-5" style="border: solid #F8F8F8; box-shadow: 0px 5px 5px #aaaaaa;">
                <h5 style="text-align: center; background-color: #304480; color: white; padding: 0.6em" runat="server" id="header">ADD ITEM</h5>
                <div class="row pt-2">
                    <div class="col-md-6 p-2">
                        <div class="form-group" style="">
                            <label class="control-label visible-ie8 visible-ie9">Enter Item No.</label>
                            <asp:TextBox ID="txtItemNo" class="form-control form-control-solid placeholder-no-fix" BorderColor="Orange" BorderStyle="Solid" placeholder="Item No" runat="server"></asp:TextBox>
                            <span class="help-block">
                                <asp:RequiredFieldValidator ID="requiredfieldvalidator1" runat="server" ControlToValidate="txtItemNo"
                                    SetFocusOnError="true" ErrorMessage="Please enter ItemNo" ForeColor="red"></asp:RequiredFieldValidator>
                            </span>
                        </div>
                    </div>
                    <div class="col-md-6 p-2">
                        <div class="form-group" style="">
                            <label class="control-label visible-ie8 visible-ie9">Enter Good/Services</label>
                            <select id="ddlGoodsService" class="custom-select form-control form-control-solid placeholder-no-fix" bordercolor="Orange" borderstyle="Solid" placeholder="Good/Services" runat="server">
                                <option value="">Select Goods/Services</option>
                                <option value="G">Goods</option>
                                <option value="S">Services</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 p-2 ">
                        <div class="form-group" style="">
                            <label class="control-label visible-ie8 visible-ie9">Enter Item Description</label>
                            <asp:TextBox ID="txtItemDescription" class="form-control form-control-solid placeholder-no-fix" BorderColor="Orange" BorderStyle="Solid" placeholder="Item Description" runat="server"></asp:TextBox>
                            <span class="help-block">
                                <asp:RequiredFieldValidator ID="requiredfieldvalidator2" runat="server" ControlToValidate="txtItemDescription"
                                    SetFocusOnError="true" ErrorMessage="Please enter ItemDescription" ForeColor="red"></asp:RequiredFieldValidator>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 p-2">
                        <div class="form-group" style="">
                            <label class="control-label visible-ie8 visible-ie9">Enter UOM</label>
                            <select id="ddlUOM" class="custom-select form-control form-control-solid placeholder-no-fix" bordercolor="Orange" borderstyle="Solid" placeholder="ddlUOM" runat="server">
                                <option value="">Select UOM</option>
                                <option value="PCS">PCS</option>
                                <option value="QTY">QTY</option>
                                <option value="NOS">NOS</option>
                            </select>
                            <span class="help-block">
                                <asp:RequiredFieldValidator ID="requiredfieldvalidator3" runat="server" ControlToValidate="ddlUOM"
                                    SetFocusOnError="true" ErrorMessage="Please enter UOM" ForeColor="red"></asp:RequiredFieldValidator>
                            </span>
                        </div>
                    </div>
                    <div class="col-md-6 p-2">
                        <div class="form-group" style="">
                            <label class="control-label visible-ie8 visible-ie9">Enter GST Rate</label>
                            <asp:DropDownList ID="ddlGSTRate" DataTextField="TaxRate" DataValueField="TaxRate"
                                class="form-control form-control-solid placeholder-no-fix" BorderColor="Orange" BorderStyle="Solid"
                                placeholder="GST Rate" runat="server">
                            </asp:DropDownList>
                            <span class="help-block">
                                <asp:RequiredFieldValidator ID="requiredfieldvalidator4" runat="server" ControlToValidate="ddlGSTRate"
                                    SetFocusOnError="true" ErrorMessage="Please enter GST Rate" ForeColor="red"></asp:RequiredFieldValidator>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 p-2">
                        <div class="form-group" style="">
                            <label class="control-label visible-ie8 visible-ie9">Enter HTS Code</label>
                            <asp:TextBox ID="txtHTSCode" class="form-control form-control-solid placeholder-no-fix" BorderColor="Orange" BorderStyle="Solid" placeholder="HTS Code" runat="server"></asp:TextBox>
                            <span class="help-block">
                                <asp:RequiredFieldValidator ID="requiredfieldvalidator5" runat="server" ControlToValidate="txtHTSCode"
                                    SetFocusOnError="true" ErrorMessage="Please enter HTS Code" ForeColor="red"></asp:RequiredFieldValidator>
                            </span>
                        </div>
                    </div>
                    <div class="col-md-6 p-2">
                        <div class="form-group" style="">
                            <label class="control-label visible-ie8 visible-ie9">Enter HSN Code</label>
                            <asp:DropDownList ID="ddlHSNCode" DataTextField="HSNCode" DataValueField="HSNCode"
                                class="form-control form-control-solid placeholder-no-fix" BorderColor="Orange" BorderStyle="Solid"
                                placeholder="HSN Code" runat="server">
                            </asp:DropDownList>
                            <span class="help-block">
                                <asp:RequiredFieldValidator ID="requiredfieldvalidator6" runat="server" ControlToValidate="ddlHSNCode"
                                    SetFocusOnError="true" ErrorMessage="Please enter HSN Code" ForeColor="red"></asp:RequiredFieldValidator>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="form-actions  d-flex align-items-center justify-content-center pt-4">
                    <asp:Button ID="btnAdd" class="btn-primary btn-lg" runat="server" Text="Add Item" OnClick="btnAdd_Click" />
                    <asp:Button ID="btnCancel" class="btn-outline-primary btn-lg" CausesValidation="false" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
