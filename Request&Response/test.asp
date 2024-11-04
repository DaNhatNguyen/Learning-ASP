    <%
        a = Request.Form("txta")
        b = Request.Form("txtb")
        c = Request.Form("txtc")
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1 align="center">Giải phương trình bậc 1</h1>
    <form action="" method="post">
        <table border="0" align="center">
            <tr>
                <td>Nhập a: </td>
                <td><input type="text" name="txta" value="<%=a%>"></td>
            </tr>
            <tr>
                <td>Nhập b: </td>
                <td><input type="text" name="txtb" value="<%=b%>"></td>
            </tr>
            <tr>
                <td>Nhập c: </td>
                <td><input type="text" name="txtc" value="<%=c%>"></td>
            </tr>
            <tr>
                <td align="center"><input type="submit" name="cmd" value="Giải phương trình"></td>
                <td><input type="reset" value="Làm lại"></td>
            </tr>
        </table>
    </form>
    <%
            if(Request.Form("cmd")<>"") then
                
                if(a=0) then
                    if(b=c) then
                        Response.write("Phương trình vô số nghiệm")
                    else
                        Response.write("Phương trình vô nghiệm")
                    end if
                else
                    x=(c-b)/a
                    response.write("Phương trình có nghiệm x = " & x)
                end if
            end if
        %>
</body>
</html>