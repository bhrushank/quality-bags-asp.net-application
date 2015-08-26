<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegistrationClientForm.aspx.cs" Inherits="RegistrationClientForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #txtPhone
        {
            width: 121px;
        }
    </style>
</head>
<body bgcolor="#99CCFF">
    <form id="frmReg" name="frmReg" action="Submit.aspx" method="post">
    <h1 style="text-align:center">Customer Online Registration Form</h1>
    <table>
    <tr><td>Name:</td><td><input type="text" name="txtName" size="20" id="txtName"/></td></tr>
    <tr><td>E-Mail:</td><td><input type="text" name="txtEMail" size="20" id="txtEMail"/></td></tr>
    <tr><td>Phone:</td><td><input type="text" name="txtPhone" size="20" id="txtPhone"/></td></tr>
    <tr><td>Address:</td><td><input type="text" name="txtAddress" size="40" id="txtAddress"/></td></tr>
    <tr><td>Password:</td><td><input type="text" name="txtPass" size="20" id="txtPass"/></td></tr>
    <tr><td>Confirm Password:</td><td><input type="text" name="txtConPass" size="20" id="txtConPass"/></td></tr>
    </table>
    <br/>
 <table style="margin-left:auto; margin-right:auto; border-spacing:10px;">
 <tr>
 <td><input type="reset"  value="Reset Form" id="btnReset" name="btnReset"/></td>
 <td><input type="submit"  value="Submit Form" id="btnSubmit" name="btnSubmit"/></td>
 </tr>
 </table>
 </form>

    </body>
</html>
