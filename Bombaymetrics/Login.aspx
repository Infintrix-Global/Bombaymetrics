<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Bombaymetrics.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" />
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="CSS/style.css" />
</head>
<body>
    <%--<form id="form1" runat="server">--%>
    <div class="margin">
    </div>

    <!-- BEGIN LOGIN -->
    <div class="row h-100 d-flex align-items-center justify-content-center">
        <div class="col-md-8">
            <div class="row" style="padding-top: 10em">
                <div class="col-md-6" style="border: solid #F8F8F8; box-shadow: 0px 5px 5px #aaaaaa; height: 70vh">
                    <img src="Images/manufacturing.png" class="card1-img" />
                </div>
                <div class="col-md-6" style="border: solid #F8F8F8; box-shadow: 0px 5px 5px #aaaaaa">
                    <div class="text-center" style="padding-top: 4em">
                        <img src="Images/BM-Supply-Chain-logo.png" width="180" height="110" alt="" class="text-center" /></div>
                    <form class="login-form" runat="server" method="post">
                        <div class="form-group" style="padding-top: 3.5em">
                            <asp:Label runat="server" Visible="false" ID="lblError" Style="color: red; font-weight: bolder">Invalid Username or Password</asp:Label>
                            <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                            <br />
                            <label class="control-label visible-ie8 visible-ie9">Enter Username</label>

                            <asp:TextBox ID="txtusername" class="form-control form-control-solid placeholder-no-fix" BorderColor="Orange" BorderStyle="Solid" placeholder="username" runat="server"></asp:TextBox>
                            <span class="help-block">
                                <asp:RequiredFieldValidator ID="requiredfieldvalidator1" runat="server" ControlToValidate="txtusername"
                                    SetFocusOnError="true" ErrorMessage="Please enter user name" ForeColor="red"></asp:RequiredFieldValidator>
                            </span>
                        </div>
                        <div class="form-group">
                            <label class="control-label visible-ie8 visible-ie9">Enter Password</label>


                            <asp:TextBox ID="txtpassword" class="form-control form-control-solid placeholder-no-fix" BorderColor="Orange" placeholder="password" runat="server" TextMode="password"></asp:TextBox>

                            <span class="help-block">
                                <asp:RequiredFieldValidator ID="requiredfieldvalidator2" runat="server" ControlToValidate="txtpassword"
                                    SetFocusOnError="true" ErrorMessage="Please enter password" ForeColor="red"></asp:RequiredFieldValidator>
                            </span>

                            <%-- <a href=""><p class="text-right" style="text-align:right;">Forgot Password?</p></a>--%>
                        </div>

                        <div class="form-actions  d-flex align-items-center justify-content-center">
                            <asp:Button ID="btnlogin" class="btn-primary btn-lg" runat="server" Width="315px" Text="Login" OnClick="btnlogin_click" />
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
