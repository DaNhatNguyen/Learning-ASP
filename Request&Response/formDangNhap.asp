<%
    a = Request.Form("txta")
    b = Request.Form("txtb")
    
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1 align="center">Đăng nhập vào hệ thống</h1>
    <form action="" method="post">
        <table border="0" align="center">
            <tr>
                <td>Tài khoản: </td>
                <td><input type="text" name="txta" value="<%=a%>"></td>     <!--<%=a%> tương đương với response.write-->
            </tr>
            <tr>
                <td>Mật khẩu: </td>
                <td><input type="text" name="txtb" value="<%=b%>"></td>
            </tr>
            <tr>
                <td align="center"><input type="submit" name="cmd" value="Đăng nhập"></td>
                <td><input type="reset" value="Làm lại"></td>
            </tr>
        </table>
    </form>
    <%
        if(Request.Form("cmd")<>"") then
            response.write("Tên đăng nhập: " & a)
            response.write("Mật khẩu: " & b)
        end if
    %>
</body>
</html>