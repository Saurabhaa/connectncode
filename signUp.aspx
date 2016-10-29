<%@ Page Title="Sign Up" Language="C#" AutoEventWireup="true" CodeBehind="signUp.aspx.cs"
    Inherits="MyBlog.signUp" MasterPageFile="~/Master.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .abc
        {
            -webkit-border-radius: 0x;
            -moz-border-radius: 0px;
            border-radius: 5px;
            width: 200px;
            padding-left: 5px;
            border: 1px solid #C8C8C8;
            border-radius: none;
            height: 30px;
        }
        .bs-example
        {
            margin: 0px;
        }
    </style>
    <script type="text/javascript">
        function myfunction() {
            var x = document.getElementById('<%=txtEmail.ClientID%>').value;
            document.getElementById('<%=txtUserName.ClientID%>').value = x;
        }
    </script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container" style="margin-top: 2em;">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="container" style="width:70%">
                    <div class="row centered-form">
                        <div class="col-md-12 content">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <b style="color: green">Sign Up to start working together<small> &nbsp; Hurry Up!</small></b>
                                    </h3>
                                </div>
                                <div class="panel-body">
                                    <form role="form">
                                    <div class="row">
                                        <div class="col-xs-6 col-sm-6 col-md-6">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtName" runat="server" MaxLength="20" class="form-control input"
                                                    placeholder="Name"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="reqName" ControlToValidate="txtName"
                                                    ErrorMessage="Enter your Name" ValidationGroup="userEntry" ForeColor="red" Display="None">
                                                </asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="REtxtSchoolName" runat="server" ControlToValidate="txtName"
                                                    ErrorMessage="Check your Name" ValidationExpression="[a-zA-Z ]*$" ForeColor="red"
                                                    ValidationGroup="schoolEntry" Display="None"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <div class="col-xs-6 col-sm-6 col-md-6">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtMobileNumber" runat="server" MaxLength="11" class="form-control input"
                                                    placeholder="Mobile Number"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="reqMobile" ControlToValidate="txtMobileNumber"
                                                    ErrorMessage="Enter a Mobile Number" ValidationGroup="userEntry" ForeColor="red"
                                                    Display="None">
                                                </asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="REtxtMobileNumber" runat="server" ControlToValidate="txtMobileNumber"
                                                    ErrorMessage="Check Your Mobile Number" ValidationExpression="^[-+]?\d+(\.\d+)?$"
                                                    ValidationGroup="userEntry" ForeColor="red" Display="None">
                                                </asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtEmail" runat="server" class="form-control input" placeholder="Email Id"
                                            onblur="myfunction()"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="reqemail" ControlToValidate="txtEmail"
                                            ErrorMessage="Enter Your Email" ValidationGroup="userEntry" ForeColor="red" Display="None"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="REtxtEmail" runat="server" ErrorMessage="Please Enter Valid Email ID"
                                            ValidationGroup="userEntry" ControlToValidate="txtEmail" ForeColor="red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                            Display="None">
                                        </asp:RegularExpressionValidator>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtUserName" runat="server" class="form-control input" placeholder="Username"
                                            ReadOnly="true"></asp:TextBox>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-6 col-sm-6 col-md-6">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtPassword" runat="server" class="form-control input" placeholder="Password"
                                                    TextMode="Password" MaxLength="20"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="reqPassword" ControlToValidate="txtPassword"
                                                    ErrorMessage="Enter a Password" ValidationGroup="userEntry" ForeColor="red" Display="None">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="col-xs-6 col-sm-6 col-md-6">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtConfirmPass" runat="server" class="form-control input" placeholder="Confirm Password"
                                                    TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="reqConfirmPass" ControlToValidate="txtConfirmPass"
                                                    ErrorMessage="Conform your Password" ValidationGroup="userEntry" ForeColor="red"
                                                    Display="None">
                                                </asp:RequiredFieldValidator>
                                                <asp:CompareValidator ID="comparePass" runat="server" ControlToCompare="txtPassword"
                                                    ControlToValidate="txtConfirmPass" ErrorMessage="Password doesn't Match" ValidationGroup="userEntry"
                                                    ForeColor="red" Display="None"></asp:CompareValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <asp:ImageButton ID="btnSignup" runat="server" CssClass="btn btn-success" ValidationGroup="userEntry"
                                        OnClick="btnSignup_Click" />
                                    </form>
                                    <div style="padding-top: 1em; font-family: Verdana;" class="container">
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="userEntry"
                                            HeaderText="Following error occured !! Please Check" ShowMessageBox="false" ShowSummary="true"
                                            ForeColor="red" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
