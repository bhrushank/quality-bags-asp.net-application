<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Adminlogin.aspx.cs" Inherits="Admin_Adminlogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Administrator</title>
    <style type="text/css">
        .style1
        {
            font-family: Cambria;
            font-size: 30px;
            text-align: center;
            font-weight: bold;
        }
        .style2
        {
            width: 100%;
        }
        .style3
        {
            width: 341px;
        }
        .style4
        {
            width: 341px;
            text-align: center;
            font-size: medium;
            
        }
        .style5
        {
            text-align: center;
            width: 231px;
        }
        .style6
        {
            text-align: center;
            font-size: medium;
        }
        .style7
        {
            text-align: center;
            font-size: medium;
            font-family: Calibri;
        }
        .style8
        {
            text-align: center;
            color: #FF0000;
        }
        .style9
        {
            text-align: center;
            font-size: medium;
            color: #FF0000;
        }
        body
        {
            background-color: #EBEBEB;
            font-size: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="style1">
        Administrator<table class="style2">
            <tr>
                <td class="style4">
                    username:
                </td>
                <td class="style5">
                    <asp:TextBox ID="txtUserName" runat="server" CssClass="style7" Width="200px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName"
                        CssClass="style9" ErrorMessage="Please enter valid user name"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    password:
                </td>
                <td class="style5">
                    <asp:TextBox ID="txtPass" runat="server" CssClass="style7" TextMode="Password" Width="200px"></asp:TextBox>
                </td>
                <td class="style6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPass"
                        CssClass="style8" ErrorMessage="Please enter valid password"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr class="style6">
                <td class="style3">
                    &nbsp;
                </td>
                <td class="style5">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr class="style6">
                <td class="style3">
                    &nbsp;
                </td>
                <td class="style5">
                    <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" Width="87px" />
                </td>
                <td>
                    <asp:Label ID="lblAdmin" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
