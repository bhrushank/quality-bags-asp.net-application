<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Intro.aspx.cs" Inherits="Admin_Intro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceholder" Runat="Server">
Administrator Page
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" Runat="Server">
<h2>HELLO!&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblSession" runat="server"></asp:Label>
    </h2>

</asp:Content>

