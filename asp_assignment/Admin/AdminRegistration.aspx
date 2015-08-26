<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true"
    CodeFile="AdminRegistration.aspx.cs" Inherits="Admin_AdminRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceholder" runat="Server">
    Admin Registration
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" runat="Server">
    <div class="login">
        <table class="style1">
            <tr>
                <td class="style2">
                    &nbsp;
                </td>
                <td class="style6">
                    <h1>
                        <strong>Register</strong></h1>
                </td>
                <td class="style5">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style13">
                    User Name:
                </td>
                <td class="style14">
                    <asp:TextBox ID="txtUserName" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td class="style15">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName"
                        CssClass="style4" ErrorMessage="User Name is required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style13">
                    E-Mail:
                </td>
                <td class="style14">
                    <asp:TextBox ID="txtEmail" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td class="style15">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail"
                        CssClass="style4" ErrorMessage="E-Mail is required"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="Please enter a valid E-Mail Address" Style="color: #FF0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style13">
                    Password:
                </td>
                <td class="style14">
                    <asp:TextBox ID="txtPass" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                </td>
                <td class="style15">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPass"
                        CssClass="style4" ErrorMessage="Password is required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style13">
                    Confirm Password:
                </td>
                <td class="style14">
                    <asp:TextBox ID="txtCPass" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                </td>
                <td class="style15">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCPass"
                        CssClass="style4" ErrorMessage="Confirm Password is required"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPass"
                        ControlToValidate="txtCPass" ErrorMessage="Password must be the same" Style="color: #FF0000"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="style13">
                    Phone Number:
                </td>
                <td class="style14">
                    <asp:TextBox ID="txtPhone" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td class="style15">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPhone"
                        CssClass="style4" ErrorMessage="Phone Number is Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style13">
                    City:
                </td>
                <td class="style14">
                    <asp:DropDownList ID="dlCity" runat="server" Width="200px">
                        <asp:ListItem>Auckland</asp:ListItem>                        
                        <asp:ListItem>Christchurch</asp:ListItem>
                        <asp:ListItem>Hamilton</asp:ListItem>
                        <asp:ListItem>Tauranga</asp:ListItem>
                        <asp:ListItem>Dunedin</asp:ListItem>
                        <asp:ListItem>Palmerston North</asp:ListItem>
                        <asp:ListItem>Nelson</asp:ListItem>
                        <asp:ListItem>Rotorua</asp:ListItem>
                        <asp:ListItem>Wanganui</asp:ListItem>
                        <asp:ListItem>Gisborne</asp:ListItem>
                        <asp:ListItem>Taupo</asp:ListItem>
                        <asp:ListItem>Napier-Hasting</asp:ListItem>
                        <asp:ListItem>New Plymouth</asp:ListItem>
                        <asp:ListItem>Wellington</asp:ListItem>
                        <asp:ListItem>Whangarei</asp:ListItem>
                       
                        <asp:ListItem Selected="True">Select a City</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="style15">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="dlCity"
                        CssClass="style4" ErrorMessage="City is required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style13">
                    Country:
                </td>
                <td class="style14">
                    <asp:DropDownList ID="dlCountry" runat="server" Width="200px">
                        <asp:ListItem Selected="True">New Zealand</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="style15">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="dlCountry"
                        CssClass="style4" ErrorMessage="Country is required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style13">
                    PostCode:
                </td>
                <td class="style14">
                    <asp:TextBox ID="txtPostCode" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td class="style15">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtPostCode"
                        CssClass="style4" ErrorMessage="Post Code is required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style13">
                    UserGroup:
                </td>
                <td class="style14">
                    <asp:DropDownList ID="ddlUserGroup" runat="server">
                        <asp:ListItem Value="1">Administrator</asp:ListItem>
                        <asp:ListItem Value="0">Customer</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="style15">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style13">
                </td>
                <td class="style14">
                    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit"
                        Width="85px" />
                </td>
                <td class="style15">
                    <input id="Reset1" type="reset" value="Reset" />
                </td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;
                </td>
                <td class="style14">
                    <asp:Label ID="lblWelcome" runat="server"></asp:Label>
                </td>
                <td class="style15">
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
