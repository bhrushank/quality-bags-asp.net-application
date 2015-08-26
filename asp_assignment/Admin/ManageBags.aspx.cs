using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WAHelpers;
using System.IO;
using PracticalBusinessLayer;


public partial class Admin_ManageBags : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            PracticalBusiness business = new PracticalBusiness();
            business.DisplayDelegates(dlstDataList, ddlRegID);
        }
    }
    protected void btnCSV_Click(object sender, EventArgs e)
    {
        Practical.GenerateCSVFile();
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (filMyFile.HasFile &&
        (
        filMyFile.PostedFile.ContentType == "text/plain" ||
        filMyFile.PostedFile.ContentType == "application/pdf" ||
        filMyFile.PostedFile.ContentType == "application/msword" ||
        filMyFile.PostedFile.ContentType == "image/gif" ||
        filMyFile.PostedFile.ContentType == "image/jpeg" ||
        filMyFile.PostedFile.ContentType == "image/bmp"
        )
        )
        {
            try
            {
                string fileName = filMyFile.FileName;

                //Create a Business Object
                PracticalBusiness business = new PracticalBusiness();

                //Check the file type first
                if (filMyFile.PostedFile.ContentType.Contains("image/")) //images
                {
                    //Put a link to the paper you've just uploaded
                    lblFileLink.Text = "<a href='../uploads/Images/" + fileName + "'>" + fileName + "</a>";

                    //Save the file to the web server and the name to the database
                    lblMessage.Text = business.SaveFile(filMyFile, "../uploads/Images/" + fileName, "[Path]", Convert.ToInt32(ddlRegID.SelectedValue));
                    //business.SaveFile(filMyFile, "~/../uploads/UploadImages/" + fileName, "[Path]", Convert.ToInt32(ddlRegID.SelectedValue));

                    filMyFile.SaveAs(Server.MapPath("~/../uploads/Images/") + fileName);
                    

                }
                else //documents
                {
                    //Put a link to the paper you've just uploaded
                    lblFileLink.Text = "<a href='../uploads/UploadFiles/" + fileName + "'>" + fileName + "</a>";

                    //Save the file to the web server and the name to the database
                    lblMessage.Text = business.SaveFile(filMyFile, "../uploads/UploadFiles/" + fileName, "[Path]",
                                                        Convert.ToInt32(ddlRegID.SelectedValue));
                }

                //Process log file, 
                business.SaveLog(lblMessage.Text);

                //Update display information
                business.DisplayDelegates(dlstDataList, ddlRegID);

            }
            catch (Exception ex)
            {
                lblMessage.Text = "ERROR: " + ex.Message.ToString();
            }
        }
        else
        {
            lblMessage.Text = "You have not specified a file.";
        }
    }



    
}