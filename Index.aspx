<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs"
    Inherits="MyBlog.Index" MasterPageFile="~/Master.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <link href="Style/slider.css" rel="stylesheet" type="text/css" />
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.0/css/font-awesome.css" rel="stylesheet">
    <style>
        .social-google
        {
            background-color: #da573b;
            border-color: #be5238;
        }
        .social-google:hover
        {
            background-color: #be5238;
            border-color: #9b4631;
        }
        
        .social-twitter
        {
            background-color: #1daee3;
            border-color: #3997ba;
        }
        .social-twitter:hover
        {
            background-color: #3997ba;
            border-color: #347b95;
        }
        
        .social-facebook
        {
            background-color: #4c699e;
            border-color: #47618d;
        }
        .social-facebook:hover
        {
            background-color: #47618d;
            border-color: #3c5173;
        }
        
        .social-linkedin
        {
            background-color: #4875B4;
            border-color: #466b99;
        }
        .social-linkedin:hover
        {
            background-color: #466b99;
            border-color: #3b5a7c;
        }
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-8">
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <img src="Images/abc.png" class="img-rounded" alt="Chania" height="300px">
                        </div>
                        <div class="item">
                            <img src="Images/Coding.jpg" class="img-rounded" alt="Chania" height="300px">
                        </div>
                        <div class="item">
                            <img src="Images/apple.jpg" class="img-rounded" alt="Flower" height="300px">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <ul class="nav nav-pills nav-stacked">
                    <li class="active" style="margin-bottom: 1.4em; background: #000; font-weight: bold;
                        color: white; padding: 0.4em; border-radius: 3px; text-align: center">User Login</li>
                    <li style="margin-bottom: 0.2em">
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Email address"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername"
                            ValidationGroup="userLogin" ErrorMessage="Username Required">&nbsp;</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="REtxtEmail" runat="server" ErrorMessage="Please Enter Valid Email ID"
                            ValidationGroup="userLogin" ControlToValidate="txtUsername" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            Display="None">
                        </asp:RegularExpressionValidator>
                    </li>
                    <li style="margin-bottom: 0.5em">
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Password"
                            TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
                            ValidationGroup="userLogin" ErrorMessage="Password Required"> &nbsp;</asp:RequiredFieldValidator></li>
                    <li style="margin-bottom: 0.5em">&nbsp;
                        <asp:CheckBox ID="chkRemember" runat="server" />&nbsp;&nbsp;<b> Keep me logged In</b>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button CssClass="btn btn-success" ID="btnLogin" Text="Login" runat="server"
                            ToolTip="Login" ValidationGroup="userLogin" OnCommand="LoginButton_OnCommand"
                            CommandName="Login" />
                    </li>
                    <li>
                        <hr />
                    </li>
                </ul>
                <div align="center">
                    <a class="btn btn-primary social-login-btn social-facebook" href="http://fb.com"
                        target="_blank"><i class="fa fa-facebook"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
                            class="btn btn-primary social-login-btn social-twitter" href="https://twitter.com"
                            target="_blank"><i class="fa fa-twitter"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
                                class="btn btn-primary social-login-btn social-linkedin" href="https://linkedin.com"
                                target="_blank"><i class="fa fa-linkedin"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
                                    class="btn btn-primary social-login-btn social-google" href="https://plus.google.com"
                                    target="_blank"><i class="fa fa-google-plus"></i></a>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="userLogin"
                        HeaderText="!!! Validations !!!" ShowMessageBox="true" DisplayMode="BulletList"
                        ShowSummary="false" BackColor="green" ForeColor="red" />
                    <hr class="colorgraph">
                </div>
                <div style="font-weight: bold; text-align: center; font-size: 15px">
                    " There are 10 types of people in this world, those who understand binary and those
                    who don't. "
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <hr class="colorgraph">
    </div>
    <div class="container-fluid" style="background: #fff">
        <div class="notice notice-success">
            <h3 style="color: #19acca; text-align: center" style="margin: 0">
                Connect N Code Overview
            </h3>
            <h3>
                CnC Description .....</h3>
            <p>
                Connect N Code was created as a platform to help programmers make it big in the
                world of algorithms, computer programming and programming contests. We host three
                featured contests every month and give away prizes and goodies to the winners as
                encouragement. Apart from this, the platform is open to the entire programming community
                to host their own contests. Major institutions and organizations across the globe
                use our platform to host their contests. On an average, 30+ external contests are
                hosted on our platform every month.</p>
            <h3>
                Brief About CnC</h3>
            <p>
                CodeChef is a not-for-profit educational initiative by Directi, an Indian software
                company. It is a global programming community that fosters learning and friendly
                competition, built on top of the world’s largest competitive programming platform.
                We have also built a large community of problem curators.</p>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                <div class="offer offer-info">
                    <div class="shape">
                        <div class="shape-text">
                            CnC
                        </div>
                    </div>
                    <div class="offer-content">
                        <h3 class="lead">
                            Open Source
                        </h3>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                <div class="offer offer-success">
                    <div class="shape">
                        <div class="shape-text">
                            CnC
                        </div>
                    </div>
                    <div class="offer-content">
                        <h3 class="lead">
                            Android Projects
                        </h3>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                <div class="offer offer-warning">
                    <div class="shape">
                        <div class="shape-text">
                            CnC
                        </div>
                    </div>
                    <div class="offer-content">
                        <h3 class="lead">
                            iOS Projects
                        </h3>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                <div class="offer offer-primary">
                    <div class="shape">
                        <div class="shape-text">
                            CnC
                        </div>
                    </div>
                    <div class="offer-content">
                        <h3 class="lead">
                            Web Projects
                        </h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="notice notice-info">
            <strong>
                <h3>
                    Features Of Connect N Code
                </h3>
            </strong>Code search<br />
            Markdown support<br />
            Organization Collaboration
            <br />
            Open Source Projects
        </div>
    </div>
</asp:Content>
