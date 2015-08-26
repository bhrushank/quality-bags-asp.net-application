<%@ Page Title="" Language="C#" MasterPageFile="~/WASite.master" AutoEventWireup="true"
    CodeFile="ShowBags.aspx.cs" Inherits="ShowBags" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceholder" runat="Server">
    All Bags
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" runat="Server">
    <div class="box">
        <br />
        <br />
        <table>
            <tr valign="top">
                <td>
                    <!-- datalist -->
                    <asp:DataList ID="dlstDataList" runat="server" RepeatDirection="Horizontal" RepeatColumns="5"
                        DataKeyField="BagID">
                        <ItemTemplate>
                            <div align="left" style="padding: 15; font-size: 8pt; font-family: Verdana">
                                <div >
                                    <i><b>
                                        <%#(Container.DataItem  as System.Data.Common.DbDataRecord)["BagID"]%>
                                    </b></i>
                                </div>
                                <br />
                                <b>Bag ID: </b>
                                <%#(Container.DataItem as System.Data.Common.DbDataRecord)["BagID"]%>
                                <br />
                                <b>Supplier: </b>
                                <%#(Container.DataItem as System.Data.Common.DbDataRecord)["Supplier"]%>
                                <br />
                                <br />
                                <b>Bag Name: </b>
                                <asp:Label ID="PName" Text='<%#(Container.DataItem  as System.Data.Common.DbDataRecord)["BagName"]%>'
                                    runat="server"></asp:Label>
                                <br />
                                <b>Category: </b>
                                <%#(Container.DataItem as System.Data.Common.DbDataRecord)["Category"]%>
                                <b>Price: $</b>
                                <asp:Label ID="PPrice" Text='<%#(Container.DataItem as System.Data.Common.DbDataRecord)["Price"]%>'
                                    runat="server"></asp:Label>
                                <br />
                                 <b>Color: </b>
                                <asp:DropDownList ID="ddlColor" runat="server">
                                    <asp:ListItem>Black</asp:ListItem>
                                    <asp:ListItem>Blue</asp:ListItem>
                                    <asp:ListItem>Green</asp:ListItem>
                               </asp:DropDownList>
                                <br />
                                <b>Photo: </b>
                                <br />
                                <asp:ImageButton ID="ProductPic" ImageUrl='<%# (Container.DataItem as System.Data.Common.DbDataRecord)["Path"] %>'
                                    runat="server" CommandName="Add" Height="100" Width="100" border="1" />
                                <br />
                            </div>
                        </ItemTemplate>
                    </asp:DataList><br />
                </td>
                <!-- Item List -->
                <td>
                    <table cellspacing="40px">
                        <tr>
                            <th align="center" colspan="2">
                                Order Item List
                            </th>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <asp:GridView ID="gvItems" runat="server" BackColor="White" BorderColor="#DEDFDE"
                                    BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical"
                                    ShowHeaderWhenEmpty="true" CssClass="shopping-cart">
                                    <RowStyle BackColor="#CCCC99" />
                                    <FooterStyle BackColor="#CCCC99" />
                                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                                <asp:Label ID="lblGSTLabel" runat="server" Text="GST(15%):"></asp:Label>
                                <asp:Label ID="lblGST" runat="server" Text=""></asp:Label>
                                <br />
                                <asp:Label ID="lblTotalLabel" runat="server" Text="Total:"></asp:Label>
                                <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label>
                                <br />
                            </td>
                        </tr>
                        <tr align="center">
                            <td>
                                <asp:Button ID="Clear" Text="Clear Cart" runat="server" />
                            </td>
                            <td>
                                <asp:Button ID="Save" Text="Check Out" runat="server" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
