<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegistrationServerForm.aspx.cs" Inherits="RegistrationSeverForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="WAStyleSheet/StyleSheet.css"/>
    <script type="text/javascript">
        function current_time() {
            var currentTime = new Date();
            var month = currentTime.getMonth() + 1;
            var day = currentTime.getDate();
            var year = currentTime.getFullYear();
            document.write(day + "/" + month + "/" + year);
        }
    </script>
    <script type="text/javascript">
        function IsInteger(input) {
            var regEx = /^\+{0,1}\d+\d*$/;
            return regEx.test(input);
        }

        function btnTotal_OnClick() {
            var txtName = document.getElementById('txtName');
            if (txtName.value.length == 0) {
                alert("You must enter all the required information before submitting");
                return;
            }
            var txtAdd = document.getElementById('txtAddress');
            if (txtAdd.value.length == 0) {
                alert("You must enter all the required information before submitting");
                return;
            }
            var txtEMail = document.getElementById('txtEMail');
            if (txtEMail.value.indexOf('@') == -1) {
                alert("You must enter an @ for your email address.");
                return;
            }
            var txtPhone = document.getElementById('txtPhone');
        if (!IsInteger(txtPhone.value)) {
            alert('You must enter a number for your phone number.');
            return;
        }
        if (txtPhone.value < 10000000 || txtPhone.value > 99999999) {
            alert('The phone number you entered is invalid.');
            return;
        }
        document.getElementById('frmReg').submit();
     //   var txtPass = document.getElementById('txtPass');
      //  var txtConPass = document.getElementById('txtConPass');
       // if (txtConPass != txtPass) {
       //     alert('Password must be the same!');
      //      return;
     //   }

        }
    
</script>

</head>
<body onload="javascript: document.getElementById('txtName').focus();">
<script type="text/javascript">
    document.write("<div class=content>Current Client Time is " + Date() + "<br></div>")
      </script>

    <form id="frmReg" name="frmReg" runat="server" method="post">
    <div>
    <h1 style="text-align:center">Online Registration Form</h1>
<table>
<tr><td>Name:</td><td><asp:TextBox ID="txtName" Width="150" runat="server"></asp:TextBox></td></tr>
<tr><td>E-Mail:</td><td><asp:TextBox ID="txtEMail" Width="150" runat="server"></asp:TextBox></td></tr>
<tr><td>Phone:</td><td><asp:TextBox ID="txtPhone" Width="150" runat="server"></asp:TextBox></td></tr>
<tr><td>Address:</td><td><asp:TextBox ID="txtAddress" Width="150" runat="server"></asp:TextBox></td></tr>
<tr><td>Password:</td><td><asp:TextBox ID="txtPass" Width="150" runat="server"></asp:TextBox></td></tr>
<tr><td>Confirm Password:</td><td><asp:TextBox ID="txtConPass" Width="150" runat="server"></asp:TextBox></td></tr>
</table>
   <br/>
   <asp:Button ID="btnSubmit" Text="Submit Form" runat="server" class="caption" /><br /><br />
   <input type="button"  class="caption" value="Calculate Cost" id="Button1" name="btnTotal" onclick="btnTotal_OnClick()"/>&nbsp; &nbsp;
   <br/>
   <asp:Label ID="lblOutput" runat="server"></asp:Label>
    </div>
    <asp:Label ID="lblWelcome" class="greeting" runat="server" Text="Label"></asp:Label>
    </form>
    <div style="position: fixed; bottom: 0px; left:0px;">&copy;2015 Developed by Bhrushank Ved</div>
	<div style="position: fixed; bottom: 0px; right:0px;">
	<!-- Call javascript function -->
	<script type="text/javascript">
	    current_time();
	</script>
	</div>

</body>
</html>
