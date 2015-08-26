using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RegistrationSeverForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        btnSubmit.Click += new EventHandler(btnSubmit_Click);
        lblWelcome.Text = "Welcome " + txtName.Text + "!";
        Response.Write("<div class=content>Current Server Time is " + DateTime.Now.ToLongTimeString() + "<br></div>");

        string strWelcome = "";

        if (DateTime.Now.Hour >= 0 && DateTime.Now.Hour <= 11)
        {
            strWelcome = "Good morning";
        }
        else if (DateTime.Now.Hour >= 12 && DateTime.Now.Hour <= 17)
        {
            strWelcome = "Good afternoon";
        }
        else if (DateTime.Now.Hour >= 18 && DateTime.Now.Hour <= 23)
        {
            strWelcome = "Good evening";
        }
        else
        {
            strWelcome = "Time error";
        }

        Response.Write("<div class=content>" + strWelcome + "<br/></div>");


    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //output text input
        lblOutput.Text = "<br/>Your name is " + txtName.Text + "<br/>";
        lblOutput.Text += "Your email is " + txtEMail.Text + "<br/>";
        lblOutput.Text += "Your phone number is " + txtPhone.Text + "<br/><br/>";
        lblOutput.Text += "Your address is " + txtAddress.Text + "<br/><br/>";
        lblOutput.Text += "Your password is " + txtPass.Text + "<br/><br/>";
        
    }


}