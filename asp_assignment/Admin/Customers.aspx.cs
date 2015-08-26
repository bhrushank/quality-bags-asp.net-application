using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PracticalBusinessLayer;
using System.Data.OleDb;

public partial class Admin_Customers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PracticalBusiness business = new PracticalBusiness();
            business.DisplayCustomers(dlstDataList, ddlRegID);
        }
    }
    protected void btnCCS_Click(object sender, EventArgs e)
    {
        try
        {

            // OleDbConnection conn = new OledbConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            OleDbConnectionStringBuilder sb = new OleDbConnectionStringBuilder();
            sb.Provider = "Microsoft.ACE.OLEDB.12.0";
            sb.DataSource = Server.MapPath("/vedb01/uploads/db1.accdb");
            OleDbConnection conn = new OleDbConnection(sb.ConnectionString);
            conn.Open();
            string updateQuery = "UPDATE UserData SET Status=@status WHERE ID= @ID";
            OleDbCommand com = new OleDbCommand(updateQuery, conn);
            //com.Parameters.AddWithValue("@ID", newGUID.ToString());
            com.Parameters.AddWithValue("@status", ddlStatus.SelectedValue.ToString());
            com.Parameters.AddWithValue("@ID", ddlRegID.SelectedValue.ToString());




            com.ExecuteNonQuery();

            lblMessage.Text = "The Customer No " + ddlRegID.SelectedValue.ToString() + " was updated successfully !";

            conn.Close();
            Response.AppendHeader("Refresh", "2;url=Customers.aspx");
        }
        catch (Exception ex)
        {
            Response.Write("Error: " + ex.ToString());
            lblMessage.Text = "Error !";
        }
    }
}