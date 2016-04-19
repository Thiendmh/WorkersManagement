<%-- 
    Document   : register
    Created on : Apr 18, 2016, 6:11:59 AM
    Author     : dinhd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>register</title>
    </head>
    <body>
        <h1>Register!</h1>
        <form action="login.jsp" method="POST"></br>
            Username<input type="text" name="txtUsername"/></br>
            Password<input type="password" name="txtPwd"/></br>
            Confirm Password<input type="password" name="txtConfirm"/></br>
            Name<input type="text" name="txtName"/></br>
            DOB<input type="text" name="txtDob"/></br>
            Telephone<input type="text" name="txtTel"/></br>
            Address<input type="text" name="txtAdd"/></br>
            Email<input type="text" name="txtEmail"/></br>
            About<input type="text" name="txtAbout"/></br>
            <input type="submit" value="Register"/>
            <input type="cancel" value="Cancel"/>
        </form>
    </body>
</html>
