<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true"
    CodeFile="AddBags.aspx.cs" Inherits="Admin_AddBags" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceholder" runat="Server">
    Add Bags
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" runat="Server">
    <table>
        <tr>
            <td>
                ID:
            </td>
            <td>
                <asp:TextBox ID="txtBagId" Width="200" runat="server"></asp:TextBox>
                <asp:Label ID="lblOnly" runat="server"></asp:Label>
            </td>
        </tr>
        
        <tr>
            <td>
                Manufacturer:
            </td>
            <td>
                <asp:TextBox ID="txtSupplier" Width="200" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>
                Name:
            </td>
            <td>
                <asp:TextBox ID="txtBagName" Width="200" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>
                Category:
            </td>
            <td>
                <asp:TextBox ID="txtCategory" Width="200" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>
                Color:
            </td>
            <td>
                <asp:TextBox ID="txtColor" Width="200" runat="server"></asp:TextBox>
            </td>
        </tr>
        
        <tr>
            <td>
                Price:
            </td>
            <td>
                <asp:TextBox ID="txtPrice" Width="200" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Information:
            </td>
            <td>
                <asp:TextBox ID="txtDescription" Width="400px" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
    <br />
    <asp:Button ID="btnAddBag" runat="server" OnClick="btnAddBag_Click" Text="Add Bag" />
    <asp:Button ID="btnUpdatebag" runat="server" Text="Update" OnClick="Button1_Click" />
    <br />
</asp:Content>
