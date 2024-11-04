<%
    a = Request.Form("txta")
    b = Request.Form("txtb")
    c = Request.Form("txtc")
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
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
</body>
</html>