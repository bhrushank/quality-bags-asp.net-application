<%@ Page Title="" Language="C#" MasterPageFile="~/WASite.master" AutoEventWireup="true"
    CodeFile="UserLogin.aspx.cs" Inherits="UserLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceholder" runat="Server">
    User Login
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" runat="Server">
    <div class="box">
        <div class="login">
            <h1>
                Login Page</h1>
            <table class="style2">
                <tr>
                    <td class="style4">
                        User Name:
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
                        Password:
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
                        <asp:Label ID="lblWelcome" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
