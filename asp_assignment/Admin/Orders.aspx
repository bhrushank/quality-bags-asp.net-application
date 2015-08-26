<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true"
    CodeFile="Orders.aspx.cs" Inherits="Admin_Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceholder" runat="Server">
    Orders
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" runat="Server">
    <asp:Literal ID="ltlOrders" runat="server"></asp:Literal>
    <br />
    <br />
    <asp:Label ID="lblOrderID" runat="server" Text="OrderID:   "></asp:Label>
    <asp:TextBox ID="txtOrderID" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="lblOrderStatus" runat="server" Text="Order Status: "></asp:Label>
    <asp:DropDownList ID="ddlOrderStatus" runat="server">
        <asp:ListItem>Waiting</asp:ListItem>
        <asp:ListItem>Shipped</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <asp:Button ID="btnCS" runat="server" OnClick="btnCS_Click" Text="Change Order Status" />
    <br />
    <br />
    <br />
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
    <br />
</asp:Content>
