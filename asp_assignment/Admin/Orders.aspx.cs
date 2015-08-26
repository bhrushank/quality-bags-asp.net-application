using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PracticalBusinessLayer;
using WAHelpers;
using System.Data.SqlClient;
using System.Data.OleDb;

public partial class Admin_Orders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        showOrders();   
    }

    protected void showOrders()
    {
        OleDbConnectionStringBuilder sb = new OleDbConnectionStringBuilder();
        sb.Provider = "Microsoft.ACE.OLEDB.12.0";
        sb.DataSource = Server.MapPath("/vedb01/uploads/db1.accdb");
        OleDbConnection conn = new OleDbConnection(sb.ConnectionString);
        string str = "SELECT * FROM Orders";
        conn.Open();
        OleDbCommand com = new OleDbCommand("", conn);
        com.CommandText = str;
        OleDbDataReader data = com.ExecuteReader();

        string stre = "";

        stre += "<table cellpadding='0' cellspacing='0' border='1'>";
        stre += "<tr><td>OrderID</td><td>BagID</td><td>BagName</td><td>Quantity</td><td>UserName</td><td>Color</td><td>Cost</td><td>Status</td></tr>";
        while (data.Read())
        {
            stre += "<tr>";
            for (int i = 0; i < data.FieldCount; i++)
            {
                stre += "<td>" + data[i].ToString() + "</td>";
            }
            stre +="<tr/>";
        }
        stre += "</table>";
        ltlOrders.Text = stre;
    }
    protected void btnCS_Click(object sender, EventArgs e)
    {
        try
        {

           
            OleDbConnectionStringBuilder sb = new OleDbConnectionStringBuilder();
            sb.Provider = "Microsoft.ACE.OLEDB.12.0";
            sb.DataSource = Server.MapPath("/vedb01/uploads/db1.accdb");
            OleDbConnection conn = new OleDbConnection(sb.ConnectionString);
            conn.Open();
            string updateQuery = "UPDATE Orders SET Status=@status WHERE ID= @ID";
            OleDbCommand com = new OleDbCommand(updateQuery, conn);
            
            com.Parameters.AddWithValue("@status", ddlOrderStatus.SelectedValue.ToString());
            com.Parameters.AddWithValue("@ID", txtOrderID.Text);




            com.ExecuteNonQuery();

            lblMessage.Text = "The Order No " + txtOrderID.Text + " was updated successfully !";

            conn.Close();
            Response.AppendHeader("Refresh", "2;url=Orders.aspx");
        }
        catch (Exception ex)
        {
            Response.Write("Error: " + ex.ToString());
            lblMessage.Text = "Error !";
        }
    }
}