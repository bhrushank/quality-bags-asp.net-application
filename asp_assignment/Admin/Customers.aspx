<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Customers.aspx.cs" Inherits="Admin_Customers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceholder" Runat="Server">
Edit Cusomers
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" Runat="Server">
    <br />
    <asp:DropDownList ID="ddlRegID" DataValueField="ID" runat="server">
    </asp:DropDownList>

    <br />
<asp:DropDownList ID="ddlStatus" runat="server">
    <asp:ListItem>Enabled</asp:ListItem>
    <asp:ListItem>Disabled</asp:ListItem>
</asp:DropDownList>

    <div style="margin-top: 20px;">
        <br />
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
        <br />
    </div>
    <asp:DataList ID="dlstDataList" runat="server" RepeatDirection="Horizontal" RepeatColumns="6">
        <ItemTemplate>
            <div align="left" style="padding: 15; font-size: 8pt; font-family: Verdana" >
                <div style="font: 12pt verdana; color: darkred">
                    <i><b>
                        <%#(Container.DataItem as System.Data.Common.DbDataRecord)["ID"]%>
                    </b></i>
                </div>
                <br />
                <b>User Name: </b>
                <%#(Container.DataItem as System.Data.Common.DbDataRecord)["UserName"]%>
                <br />
                <b>Email: </b>
                <%#(Container.DataItem as System.Data.Common.DbDataRecord)["Email"]%>
                <br />
                <b>Password: </b>
                <%#(Container.DataItem as System.Data.Common.DbDataRecord)["Password"]%>
                <br />
                <b>Phone: </b>
                <%#(Container.DataItem as System.Data.Common.DbDataRecord)["Phone"]%>
                <br />
                <b>City: </b>
                <%#(Container.DataItem as System.Data.Common.DbDataRecord)["City"]%>
                <br />
                <b>Country: </b>
                <%#(Container.DataItem as System.Data.Common.DbDataRecord)["Country"]%>
                <br />
                <b>Postcode: </b>
                <%#(Container.DataItem as System.Data.Common.DbDataRecord)["PostCode"]%>
                <br />
                <b>UserGroup: </b>
                <%#(Container.DataItem as System.Data.Common.DbDataRecord)["UserGroup"]%>
                <br />
                <b>Status: </b>
                <%#(Container.DataItem as System.Data.Common.DbDataRecord)["Status"]%>
                <br />

                <br />
            </div>
        </ItemTemplate>
    </asp:DataList>
<asp:Button ID="btnCCS" runat="server" onclick="btnCCS_Click" 
    Text="Change Customer Status" />
<br />
</asp:Content>

