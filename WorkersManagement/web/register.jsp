<%-- 
    Document   : register
    Created on : Apr 18, 2016, 6:11:59 AM
    Author     : dinhd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>register</title>
         <script type="text/javascript">
            var ck_name = /^[A-Za-z0-9 ]{3,20}$/;
            var ck_email = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i 
            var ck_username = /^[A-Za-z0-9_]{1,20}$/;
            var ck_password =  /^[A-Za-z0-9!@#$%^&*()_]{6,20}$/;
            var ck_phoneNumber = /^[(]{0,1}[0-9]{3}[)]{0,1}[-\s\.]{0,1}[0-9]{3}[-\s\.]{0,1}[0-9]{4}$/;

            function validate(form){
             var email = form.txtEmail.value;
             var username = form.txtUsername.value;
             var password = form.txtPassword.value;
             var phone = form.txtTel.value;
             var name = form.txtName.value;
             var errors = [];

             if (!ck_email.test(email)) {
              errors[errors.length] = "You must enter a valid email address.";
             }
             if (!ck_username.test(username)) {
              errors[errors.length] = "You valid UserName no special char .";
             }

             if (!ck_password.test(password)) {
              errors[errors.length] = "You must enter a valid Password min 6 char.";
             }
             if (!ck_phoneNumber.test(phone)){
                 errors[errors.length] = "You must enter a valid Phone number."
             }
             if (!ck_name.test(name)) {
                 errors[errors.length] = "You must enter a valid name."
             }
             if (form.txtPassword.value != form.txtConfirm.value) {
                 errors[errors.length] = "Please check that you've entered and confirmed your password!"
             }
             if (errors.length > 0) {
              reportErrors(errors);
              return false;
             }
             
             return true;
            }

            function reportErrors(errors){
             var msg = "Please Enter Valide Data...\n";
             for (var i = 0; i<errors.length; i++) {
              var numError = i + 1;
              msg += "\n" + numError + ". " + errors[i];
             }
             alert(msg);
            }
        </script>
    </head>
    <body>
        <h1>Register!</h1>
        <form method="post" action="ReisterServlet?action=addUser" onSubmit="return validate(this);" name="form">
            Username<input type="text" name="txtUsername"/></br>
            Password<input type="password" name="txtPassword"/></br>
            Confirm Password<input type="password" name="txtConfirm"/></br>
            Name<input type="text" name="txtName"/></br>
            DOB<input type="text" name="txtDob"/></br>
            Telephone<input type="text" name="txtTel"/></br>
            Address<input type="text" name="txtAdd"/></br>
            Email<input name="txtEmail" type="text" value="" /></br>
            About<input type="text" name="txtAbout"/></br>
            <input type="submit" value="Register"/>
            <input type="reset" value="Cancel"/>
        </form>
    </body>
</html>
