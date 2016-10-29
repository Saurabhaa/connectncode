<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="MyBlog.Welcome" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome User</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link href="Style/slider.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container-fluid" style="padding-top: 1em">
        <div class="row">
            <div class="col-sm-4">
                <asp:Label ID="Label2" Visible="true" Text="CONNECT N CODE" runat="server" CssClass="btn btn-default" />
            </div>
            <div class="col-sm-4" align="center">
                <asp:Label ID="Label1" Visible="true" Text="Welcome" runat="server" CssClass="btn btn-success" />
                <asp:Label ID="HeadLoginName" Visible="true" runat="server" CssClass="btn btn-success"
                    Text="user Name" />
            </div>
            <div class="col-sm-4" align="right">
                <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-danger"
                    OnClick="HeadLogout_Click" />
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <hr class="colorgraph" />
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3" style="font-weight: bold; font-size: larger; text-align: right">
                Select Your Projects
            </div>
            <div class="col-sm-3">
                <asp:DropDownList ID="ddlproject" runat="server" CssClass="form-control" Width="300px">
                </asp:DropDownList>

                </div>
                <div class="col-sm-6">
                <asp:ImageButton ID="btnSignup" runat="server" CssClass="btn btn-success" ValidationGroup="userEntry"
                    OnClick="btnSignup_Click" />
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <hr class="colorgraph" />
    </div>
    <div class="container-fluid" style="padding-top: 1em; max-height: 500px; overflow: auto">
        <h2>
            ALL PROJECTS</h2>
        <hr />
        <asp:GridView ID="gd_projects" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" CssClass="table table-hover table-bordered">
            <Columns>
                <asp:BoundField DataField="ProjectTitle" HeaderText="Project Title" ItemStyle-Font-Bold="true"
                    ItemStyle-Width="100px" ItemStyle-VerticalAlign="Top" />
                <asp:BoundField DataField="ProjectDesc" HeaderText="Project Description" ItemStyle-Font-Bold="true"
                    ItemStyle-VerticalAlign="Top" />
                <asp:BoundField DataField="ProjectStartingDate" HeaderText="Project Starting Date"
                    ItemStyle-Font-Bold="true" ItemStyle-Width="130px" ItemStyle-VerticalAlign="Top" />
            </Columns>
        </asp:GridView>
    </div>
    <div class="container-fluid" style="padding-top: 1em; max-height: 500px; overflow: auto">
        <h2>
            MY PROJECTS</h2>
        <hr />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" CssClass="table table-hover table-bordered">
            <Columns>
                <asp:BoundField DataField="ProjectTitle" HeaderText="Project Title" ItemStyle-Font-Bold="true"
                    ItemStyle-Width="100px" ItemStyle-VerticalAlign="Top" />
                <asp:BoundField DataField="ProjectDesc" HeaderText="Project Description" ItemStyle-Font-Bold="true"
                    ItemStyle-VerticalAlign="Top" />
               
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
