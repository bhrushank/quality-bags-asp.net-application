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

public partial class UserLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        OleDbConnectionStringBuilder sb = new OleDbConnectionStringBuilder();
        sb.Provider = "Microsoft.ACE.OLEDB.12.0";
        sb.DataSource = Server.MapPath("/vedb01/uploads/db1.accdb");
        OleDbConnection conn = new OleDbConnection(sb.ConnectionString);
        conn.Open();
        string checkUser = "select count(*) from UserData where UserName='" + txtUserName.Text + "'";
        OleDbCommand com = new OleDbCommand(checkUser, conn);
        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
        conn.Close();
        if (temp == 1)
        {
            conn.Open();
            string checkPassword = "select password from UserData where UserName='" + txtUserName.Text + "'";
            string str = "SELECT status from UserData where UserName='" + txtUserName.Text + "'";
            OleDbCommand passcom = new OleDbCommand(checkPassword, conn);
            OleDbCommand cs = new OleDbCommand(str, conn);
            string password = passcom.ExecuteScalar().ToString().Replace(" ", "");
            string strcs = cs.ExecuteReader().ToString();
            if (password == txtPass.Text && strcs!="Disabled")
            {
                Session["UserName"] = txtUserName.Text;
                lblWelcome.Text="Welcome " + Session["UserName"] +" !";

                Response.AppendHeader("Refresh", "3;url=Introduction.aspx");

            }
            else
            {
                lblWelcome.Text = "Password is incorrect";
            }
        }
        else
        {
            lblWelcome.Text = "User Name is incorrect";
        }


    }
}