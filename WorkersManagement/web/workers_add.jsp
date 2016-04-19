<%-- 
    Document   : workers_add
    Created on : Apr 18, 2016, 5:05:01 PM
    Author     : dinhd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>workers_add</title>
    </head>
    <body>
        <h1>Add New Worker</h1>
        <form action="workers.jsp?action=add" method="POST">
            <table>               
<!--                <tr>
                    <th>Name</th>
                    <td><input type="text" name="txtName"/></td>
                </tr>-->
                <tr>
                    <th>Name</th>
                    <td><input type="text" name="txtName"/></td>
                </tr>
                <tr>
                    <th>DOB</th>
                    <td><input type="text" name="txtDOB"/></td>
                </tr>
                <tr>
                    <th>Tel</th>
                    <td><input type="text" name="txtTel"/></td>
                </tr>
                <tr>
                    <th>Address</th>
                    <td><input type="text" name="txtAddress"/></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><input type="text" name="txtEmail"/></td>
                </tr>
                <tr>
                    <th>About</th>
                    <td><input type="text" name="txtAbout"/></td>
                </tr>
                <tr>
                    <th>Active</th>
                    <td>
                        Active <input type="radio" name="rdoActive" value=true checked="checked" />
                        Not Active <input type="radio" name="rdoActive" value=false />
                    </td>
                    
                </tr>                          
            </table>
            <input type="submit" value="Add" />
        </form>
    </body>
</html>
