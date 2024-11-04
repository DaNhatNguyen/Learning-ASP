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
    <title>Giai Phuong Trinh Bac 2</title>
</head>
<body>
    <h1 align="center" >Giải phương trình bậc 2</h1>
    <form action="" method="post">
    <table align="center">
        <tr>
            <td>Nhập A: </td>
            <td> <input type="number" name="txta" value="<%=a%>"></td>
        </tr>
        <tr>
            <td>Nhập B: </td>
            <td> <input type="number" name="txtb" value="<%=b%>"></td>
        </tr>
        <tr>
            <td>Nhập C: </td>
            <td> <input type="number" name="txtc" value="<%=c%>"></td>
        </tr>
        <tr>
            <td></td>
            <td> <input type="submit" name="cmd"> </td>
        </tr>
    <%
    If(Request.Form("cmd") <> "") then
        If(a = 0) then 
            If(b = 0) then
                If(c = 0) then
                    kq = "phương trình vô số nghiệm"             
                Else
                    kq = "Phương trình vô nghiệm"
                End If
            Else
                kq = -c/b
            End If
        Else 
            delta = b*b - 4*a*c
            If (delta < 0) then
                kq = "phương trình vô nghiệm"
            Else If (delta = 0) then
                kq = "x1 = x2 = " &(-b/(2*a))
            Else 
                kq = "x1 = " &((-b + sqr(delta))/2*a) &" và " &"x2 = " &((-b - sqr(delta))/2*a) 
            End If
            End If
        End If
    End If

    If (a = 1) then
    pt = "" &"x^2 + " &b &"x + " &c &" = 0"
    Else If (a = 0) then
    pt = "" &b &"x + " &c &" = 0"
        If (b = 0) then
        pt = "" &c &" = 0"
        End If
    Else
    pt = ""&a &"x^2 + " &b &"x + " &c &" = 0"
    End If
    End If

    %>
    <tr>
        <td>PT: </td>
        <td> <input type="text" name="txtPT" value="<%=pt%>"> </td>
    </tr>
    <tr>
        <td>Kết quả: </td>
        <td> <input type="text" name="txtKQ" value="<%=kq%>"></td>
    </tr>
</table>
</body>
</html>