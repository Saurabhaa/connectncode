<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminArea.aspx.cs" Inherits="MyBlog.BlogPost" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <style type="text/css">
        .styleTextbox
        {
            width: 50%;
            min-height: 10em;
            border-radius: 0.2em;
            vertical-align: bottom;
            background: #393939;
            padding: 0.2em .5em;
            color: #fff;
            border: 1px solid #00BFFf;
            margin: 1em 0em;
        }
        
        .styleText
        {
            color: #fff;
            font-family: Verdana;
            font-size: small;
        }
        body
        {
            width: 100%;
            margin: 0em;
            padding: 0em;
            background: #fff; /*#4c4c4c*/
        }
        .GridPager a, .GridPager span
        {
            display: block;
            height: 30px;
            width: 40px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
            padding-top: 5px;
        }
        .GridPager a
        {
            background-color: #5cb85c;
        }
        .GridPager span
        {
            background-color: #f0ad4e;
            color: black;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="Updatepanel1" runat="server">
        <ContentTemplate>
            <div class="container-fluid" style="margin-top: 1em">
                <div class="panel panel-default panel-table">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col col-xs-6">
                                <b style="color: green; font-size: x-large">Admin Panel</b>
                            </div>
                            <div class="col col-xs-6 text-right">
                                <asp:Button ID="AbtnLogout" runat="server" Text="Logout" CssClass="btn btn-success"
                                    OnClick="HeadLogout_Click" />
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <b style="color: red; font-size: large">Project Area</b>
                        <br />
                        <br />
                        <asp:TextBox ID="txtprojecttitle" runat="server" CssClass="form-control input-lg"
                            placeholder="Project Title">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtprojecttitle"
                            ForeColor="red" ValidationGroup="Post" ErrorMessage="Cannot be empty">
                        </asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtPost" runat="server" CssClass="form-control input-lg" TextMode="MultiLine"
                            placeholder="Project Description" Height="100px">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqPost" runat="server" ControlToValidate="txtPost"
                            ForeColor="red" ValidationGroup="Post" ErrorMessage="Cannot be empty">
                        </asp:RequiredFieldValidator>
                        <br />
                        <asp:Button ID="btnPost" runat="server" Text="Post" ValidationGroup="Post" OnClick="btnPost_Click"
                            CssClass="btn btn-success" />
                    </div>
                    <div class="panel-body" style="max-height: 300px; overflow: auto">
                        <hr />
                        <br />
                        <asp:Button ID="btnGetRegistrations" runat="server" Text="Get Registrations" OnClick="getRegistrations"
                            CssClass="btn btn-success" />
                        <br />
                        <br />
                        <asp:GridView ID="gd_registered" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" GridLines="None" CssClass="table table-hover table-bordered">
                            <Columns>
                                <asp:BoundField DataField="UID" HeaderText="UID" />
                                <asp:BoundField DataField="Name" HeaderText="Name" />
                                <asp:BoundField DataField="MobileNumber" HeaderText="Mobile Number" />
                                <asp:BoundField DataField="Email" HeaderText="Email" />
                               
                            </Columns>
                            <PagerStyle HorizontalAlign="Left" CssClass="GridPager" />
                        </asp:GridView>
                    </div>
                    <hr />
                    <div class="panel-body" style="max-height: 400px; overflow: auto">
                        <asp:Button ID="btnGetPost" runat="server" Text="Get Posts" OnClick="getprojects"
                            CssClass="btn btn-success" />
                        <br />
                        <br />
                        <asp:GridView ID="gd_projects" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" GridLines="None" CssClass="table table-hover table-bordered">
                            <Columns>
                                <asp:BoundField DataField="ProjectTitle" HeaderText="Project Title" />
                                <asp:BoundField DataField="ProjectDesc" HeaderText="Project Description" />
                                <asp:BoundField DataField="ProjectStartingDate" HeaderText="Project Starting Date" />
                            </Columns>
                        </asp:GridView>
                    </div>
                    <hr />
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
