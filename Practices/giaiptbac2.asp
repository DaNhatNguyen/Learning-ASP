<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
</head>
<body>
    <form action="" method="post">
        Nhap a: <input type="text" name="txta" value="<%=request("txta")%>" ><br>
        Nhap b: <input type="text" name="txtb" value="<%=request("txtb")%>" ><br>
        Nhap c: <input type="text" name="txtc" value="<%=request("txtc")%>" ><br>
        <input type="submit" value="giai phuong trinh">
    </form>

    <%
        Dim a, b, c,x1, x2, delta, kq
        a = Request("txta")
        b = Request("txtb")
        c = Request("txtc")
        if a = 0 then
            if b = 0 then
                if c = 0 then
                    Response.Write("phuong trinh co vo so nghiem")
                Else
                    Response.Write("phuong trinh vo nghiem")
                End If
            Else
                kq = -c/a 
            End If
        Else
            delta = b*b - 4*a*c
            x1 = (-b + Sqr(delta))/2*a
            x2 = (-b - Sqr(delta))/2*a  

            Response.Write("phuong trinh co nghiem phan biet x1: " & x1 & " va x2: " & x2)
            
        End If
    %>
</body>
    
</html>