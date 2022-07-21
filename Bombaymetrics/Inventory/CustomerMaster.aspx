<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="CustomerMaster.aspx.cs" Inherits="Bombaymetrics.Inventory.CustomerMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row justify-content-center mt-5  pt-5 pb-5">
            <div class="col-md-8 pb-5" style="border: solid #F8F8F8; box-shadow: 0px 5px 5px #aaaaaa;">
                <h5 style="text-align: center; background-color: #304480; color: white; padding: 0.6em" runat="server" id="header">ADD CUSTOMER DETAILS</h5>
                <div class="row pt-2">
                    <div class="col-md-6 p-2">
                        <div class="form-group" style="">
                            <label class="control-label visible-ie8 visible-ie9">Enter Legal Name</label>
                            <asp:TextBox ID="txtLegalName" class="form-control form-control-solid placeholder-no-fix" BorderColor="Orange" BorderStyle="Solid" placeholder="Legal Name" runat="server"></asp:TextBox>
                            <span class="help-block">
                                <asp:RequiredFieldValidator ID="requiredfieldvalidator1" runat="server" ControlToValidate="txtLegalName"
                                    SetFocusOnError="true" ErrorMessage="Please enter Legal Name" ForeColor="red">
                                </asp:RequiredFieldValidator>
                            </span>
                        </div>
                    </div>
                    <div class="col-md-6 p-2">
                        <div class="form-group" style="">
                            <label class="control-label visible-ie8 visible-ie9">Enter Phone</label>
                            <asp:TextBox ID="txtPhone" class="form-control form-control-solid placeholder-no-fix" BorderColor="Orange" BorderStyle="Solid" placeholder="Phone" runat="server"></asp:TextBox>
                            <span class="help-block">
                                <asp:RequiredFieldValidator ID="requiredfieldvalidator7" runat="server" ControlToValidate="txtPhone"
                                    SetFocusOnError="true" ErrorMessage="Please enter Phone" ForeColor="red">
                                </asp:RequiredFieldValidator>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 p-2 ">
                        <div class="form-group" style="">
                            <label class="control-label visible-ie8 visible-ie9">Enter Address</label>
                            <asp:TextBox ID="txtAddress" TextMode="Multiline" class="form-control form-control-solid placeholder-no-fix" BorderColor="Orange" BorderStyle="Solid" placeholder="Address" runat="server"></asp:TextBox>
                            <span class="help-block">
                                <asp:RequiredFieldValidator ID="requiredfieldvalidator2" runat="server" ControlToValidate="txtAddress"
                                    SetFocusOnError="true" ErrorMessage="Please enter Address" ForeColor="red">
                                </asp:RequiredFieldValidator>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="row pt-2">
                    <div class="col-md-6 p-2">
                        <div class="form-group" style="">
                            <label class="control-label visible-ie8 visible-ie9">Enter Place</label>
                            <asp:TextBox ID="txtPlace" class="form-control form-control-solid placeholder-no-fix" BorderColor="Orange" BorderStyle="Solid" placeholder="Place" runat="server"></asp:TextBox>
                            <span class="help-block">
                                <asp:RequiredFieldValidator ID="requiredfieldvalidator4" runat="server" ControlToValidate="txtPlace"
                                    SetFocusOnError="true" ErrorMessage="Please enter Place" ForeColor="red">
                                </asp:RequiredFieldValidator>
                            </span>
                        </div>
                    </div>
                    <div class="col-md-6 p-2">
                        <div class="form-group" style="">
                            <label class="control-label visible-ie8 visible-ie9">Enter State Code</label>
                            <asp:DropDownList ID="ddlState" DataTextField="State Name" DataValueField="State Code"
                                class="form-control form-control-solid placeholder-no-fix" BorderColor="Orange" BorderStyle="Solid"
                                placeholder="State" runat="server" />
                            <span class="help-block">
                                <asp:RequiredFieldValidator ID="requiredfieldvalidator5" runat="server" ControlToValidate="ddlState"
                                    SetFocusOnError="true" ErrorMessage="Please enter State Code" ForeColor="red">
                                </asp:RequiredFieldValidator>
                            </span>

                        </div>
                    </div>
                </div>
                <div class="row">
                   
                    <div class="col-md-6 p-2">
                        <div class="form-group" style="">
                            <label class="control-label visible-ie8 visible-ie9">Enter PIN Code</label>
                            <asp:TextBox ID="txtPinCode" class="form-control form-control-solid placeholder-no-fix" BorderColor="Orange" BorderStyle="Solid" placeholder="PIN Code" runat="server"></asp:TextBox>
                            <span class="help-block">
                                <asp:RequiredFieldValidator ID="requiredfieldvalidator3" runat="server" ControlToValidate="txtPinCode"
                                    SetFocusOnError="true" ErrorMessage="Please enter PIN Code" ForeColor="red">
                                </asp:RequiredFieldValidator>
                            </span>
                        </div>
                    </div>
                     <div class="col-md-6 p-2">
                        <div class="form-group" style="">
                             <label class="control-label visible-ie8 visible-ie9">Enter Fax</label>
                            <asp:TextBox ID="txtFax" class="form-control form-control-solid placeholder-no-fix" BorderColor="Orange" BorderStyle="Solid" placeholder="Fax" runat="server"></asp:TextBox>
                            <span class="help-block">
                                <asp:RequiredFieldValidator ID="requiredfieldvalidator6" runat="server" ControlToValidate="txtFax"
                                    SetFocusOnError="true" ErrorMessage="Please enter Fax" ForeColor="red"></asp:RequiredFieldValidator>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="form-actions  d-flex align-items-center justify-content-center pt-4">
                    <asp:Button ID="btnAdd" class="btn btnadd" runat="server" Text="Add Detail" onClick="btnAdd_Click" />
                    &nbsp;
                    <asp:Button ID="btnCancel" class="btn btncancel" CausesValidation="false" runat="server" Text="Cancel" onClick="btnCancel_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
