using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.OleDb;
using System.Text;

public partial class Admin_AdminRegistration : System.Web.UI.Page
{
    int temp = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
           
            OleDbConnectionStringBuilder sb = new OleDbConnectionStringBuilder();
            sb.Provider = "Microsoft.ACE.OLEDB.12.0";
            sb.DataSource = Server.MapPath("/vedb01/uploads/db1.accdb");


            OleDbConnection conn = new OleDbConnection(sb.ConnectionString);


            conn.Open();
            string checkUser = "select count(*) from UserData where UserName='" + txtUserName.Text + "'";
            OleDbCommand com = new OleDbCommand(checkUser, conn);
            temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            if (temp != 0)
            {
                Response.Write("User Already Exists !");
            }

            conn.Close();
        }

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        try
        {
           
            OleDbConnectionStringBuilder sb = new OleDbConnectionStringBuilder();
            sb.Provider = "Microsoft.ACE.OLEDB.12.0";
            sb.DataSource = Server.MapPath("/vedb01/uploads/db1.accdb");
            OleDbConnection conn = new OleDbConnection(sb.ConnectionString);
            conn.Open();
            string insertQuery = "insert into UserData ( [UserName], [Email], [Password], [Phone], [City], [Country], [PostCode], [UserGroup], [Status]) values (@Uname ,@email ,@password ,@phone ,@city ,@country ,@postcode ,@usergroup ,@status)";
            OleDbCommand com = new OleDbCommand(insertQuery, conn);
            
            com.Parameters.AddWithValue("@Uname", txtUserName.Text);
            com.Parameters.AddWithValue("@email", txtEmail.Text);
            com.Parameters.AddWithValue("@password", txtPass.Text);
            com.Parameters.AddWithValue("@phone", txtPhone.Text);
            com.Parameters.AddWithValue("@city", dlCity.SelectedItem.ToString());
            com.Parameters.AddWithValue("@country", dlCountry.SelectedItem.ToString());
            com.Parameters.AddWithValue("@postcode", txtPostCode.Text);
            com.Parameters.AddWithValue("@usergroup", ddlUserGroup.SelectedValue.ToString());
            com.Parameters.AddWithValue("@status","Enable");


            com.ExecuteNonQuery();

            lblWelcome.Text = "Registration for "+ txtUserName.Text +" is Successful !";

            conn.Close();
        }
        catch (Exception ex)
        {
            Response.Write("Error: " + ex.ToString());
        }

    }
}