<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true"
    CodeFile="ManageBags.aspx.cs" Inherits="Admin_ManageBags" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceholder" runat="Server">
    Manage Bags
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" runat="Server">
    <a href="../uploads/cultures.csv"></a>
    <asp:Button ID="btnCSV" runat="server" Text="Generate CSV file" OnClick="btnCSV_Click"
        Visible="False"></asp:Button>
    <br />
    <asp:DropDownList ID="ddlRegID" DataValueField="BagID" runat="server">
    </asp:DropDownList>
    <div style="margin-top: 20px;">
        <asp:FileUpload ID="filMyFile" runat="server" /><br />
        <asp:Button ID="btnUpload" runat="server" Text="Upload File" OnClick="btnUpload_Click" />
        <br />
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
        <br />
        <asp:Label ID="lblFileLink" runat="server"></asp:Label><br />
    </div>
    <asp:DataList ID="dlstDataList" runat="server" RepeatDirection="Horizontal" RepeatColumns="6">
        <ItemTemplate>
            <div align="left" style="padding: 15; font-size: 8pt; font-family: Verdana">
                <div style="font: 12pt verdana; color: darkred">
                    <i><b>
                        <%#(Container.DataItem as System.Data.Common.DbDataRecord)["BagID"]%>
                    </b></i>
                </div>
                <br />
                <b>Bag Name: </b>
                <%#(Container.DataItem as System.Data.Common.DbDataRecord)["BagName"]%>
                <br />
                <b>Supplier: </b>
                <%#(Container.DataItem as System.Data.Common.DbDataRecord)["Supplier"]%>
                <br />
                <b>Color: </b>
                <%#(Container.DataItem as System.Data.Common.DbDataRecord)["Color"]%>
                <br />
                <b>Category: </b>
                <%#(Container.DataItem as System.Data.Common.DbDataRecord)["Category"]%>
                <br />
                <b>Price: $</b>
                <%#(Container.DataItem as System.Data.Common.DbDataRecord)["Price"]%>
                <br />
                <b>Description: </b>
                <%#(Container.DataItem as System.Data.Common.DbDataRecord)["Description"]%>
                <br />
                <b>Photo: </b>
                <br />
                <img src='<%# (Container.DataItem as System.Data.Common.DbDataRecord)["Path"] %>'
                    align="middle" id='<%# (Container.DataItem as System.Data.Common.DbDataRecord)["BagID"] %>'
                    height="120" width="120" border="1" />
                <br />
            </div>
        </ItemTemplate>
    </asp:DataList><br />
</asp:Content>
