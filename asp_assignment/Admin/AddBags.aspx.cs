using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.OleDb;


public partial class Admin_AddBags : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btnAddBag_Click(object sender, EventArgs e)
    {
        try
        {

            OleDbConnectionStringBuilder sb = new OleDbConnectionStringBuilder();
            sb.Provider = "Microsoft.ACE.OLEDB.12.0";
            sb.DataSource = Server.MapPath("/vedb01/uploads/db1.accdb");
            OleDbConnection conn = new OleDbConnection(sb.ConnectionString);
            conn.Open();
            string insertQuery = "insert into Bag ( [BagName], [Supplier], [Color], [Category], [Price], [Description]) values (@name ,@supplier ,@color ,@category ,@price ,@description)";
            OleDbCommand com = new OleDbCommand(insertQuery, conn);
            com.Parameters.AddWithValue("@name", txtBagName.Text);
            com.Parameters.AddWithValue("@supplier", txtSupplier.Text);
            com.Parameters.AddWithValue("@color", txtColor.Text);
            com.Parameters.AddWithValue("@category", txtCategory.Text);
            com.Parameters.AddWithValue("@price", txtPrice.Text);
            com.Parameters.AddWithValue("@description", txtDescription.Text);

            com.ExecuteNonQuery();

            lblMessage.Text = "The bag was added successfully " + txtBagName.Text + " !";

            conn.Close();
        }
        catch (Exception ex)
        {
            Response.Write("Error: " + ex.ToString());
            lblMessage.Text = "Error" + txtBagName.Text + " !";
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            OleDbConnectionStringBuilder sb = new OleDbConnectionStringBuilder();
            sb.Provider = "Microsoft.ACE.OLEDB.12.0";
            sb.DataSource = Server.MapPath("/vedb01/uploads/db1.accdb");
            OleDbConnection conn = new OleDbConnection(sb.ConnectionString);
            conn.Open();
            string updateQuery = "UPDATE Bag SET BagName=@name, Supplier=@supplier, Color=@color, Category=@category, Price=@price, Description=@description WHERE BagID= @ID";
            OleDbCommand com = new OleDbCommand(updateQuery, conn);

            com.Parameters.AddWithValue("@ID", txtBagId.Text);
            com.Parameters.AddWithValue("@name", txtBagName.Text);
            com.Parameters.AddWithValue("@supplier", txtSupplier.Text);
            com.Parameters.AddWithValue("@color", txtColor.Text);
            com.Parameters.AddWithValue("@category", txtCategory.Text);
            com.Parameters.AddWithValue("@price", txtPrice.Text);
            com.Parameters.AddWithValue("@description", txtDescription.Text);
            

            com.ExecuteNonQuery();

            lblMessage.Text = "The bag No " + txtBagId.Text +" was updated successfully " + txtBagName.Text + " !";

            conn.Close();
        }
        catch (Exception ex)
        {
            Response.Write("Error: " + ex.ToString());
            lblMessage.Text = "Error !";
        }
    }
}