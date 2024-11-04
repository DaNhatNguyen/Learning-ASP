<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <h1 align = "center">Login admin</h1>
    <center>
        <font color = "green"><%=session("login error")%></font>
    </center>
    <form action="login_action.asp" method="post">
        <table align="center" >
            <tr>
                <td>Username: </td>
                <td><input type="text" name="txtUsername"></td>
            </tr>
            <tr>
                <td>Password: </td>
                <td><input type="password" name="txtPassword"></td>
            </tr>
            <tr>
                <td><input type="submit" name="cmd" value="login"></td>
                <td><input type="submit" value="reset"></td>
                <td><a href="register.asp">register</a></td>
            </tr>
        </table>
    </form>
    <script>
        function check (){
            
        }
    </script>
</body>
<%
    session("login error") = ""
%>
</html>