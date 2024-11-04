<!-- #include file = "connection.asp" -->

<%
    cat_id = Request("cat_id")
    rs1.open "select * from Categories where cat_id=" & cat_id, conn
    sql = "select * from product where cat_id = " & cat_id
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
    <h1>Cac sản phẩm của <%=rs1("cat_name")%></h1>
    <table align="center" border="1px">
        <tr>
            <%
                while not rs.eof
            %>
                <td>
                    <img src="images/<%=rs("p_image")%>">
                    <div class="name-product">Tên Sản Phẩm: <%=rs("p_name")%></div>
                    <div class="price-product">Giá Bán: <%=rs("p_price")%></div>
                </td>
            <%
                rs.movenext
                wend
                session("products_error")=""
            %>
        </tr>
    </table>
    <%
    rs.close
    conn.close
    %>
</body>
</html>