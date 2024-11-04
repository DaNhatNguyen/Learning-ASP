<!-- #include file = "connection.asp" -->
<%
    sql = "select * from categories"
    sql1 = "select * from product"
    'Response.Write(sql1)
    'mo tap ket qua
    rs.open sql, conn
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <table align="left" width = "300px" border="1px">
    <%
        while not rs.eof
    %>
        <tr>
            <td><a href="detail_product.asp?cat_id=<%=rs("cat_id")%>"><%=rs("cat_name")%></a></td>
        <tr>
    <%
        rs.movenext
        wend
        session("categories_error")=""
        rs.close
    %>
    </table>

<table align="center" border="1px">
    <tr>
    <%
        rs.open sql1
        while not rs.eof
            if rs("is_hot") = TRUE then
    %>
                <a href="detail_product2.asp?p_id=<%=rs("p_id")%></a>">
                    <td>
                        <img src="images/<%=rs("p_image")%>">
                        <div class="name-product"><%=rs("p_name")%></div>
                        <div class="price-product"><%=rs("p_price")%></div>
                    </td> 
                </a>  
    <%
            end if
            rs.movenext
        wend
        session("categories_error") = ""
    %>
    </tr>
</table>


</body>
</html>
<%
    conn.close  
%>