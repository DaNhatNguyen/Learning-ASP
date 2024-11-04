<!-- #include file = "connection.asp" -->
<%
    p_status = Request("p_status")    
    if (p_status = 1) then 
        p_status = TRUE 
    else 
        p_status = FALSE
    end if         
    sql = "select product.*, cat_name from Product, Categories where Product.cat_id = Categories.cat_id and p_status = " & p_status

    'mở tập kết quả
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
    <div class="main">
        <div class="navigation"></div>
        <div class="hot_product"></div>
    </div>
    <h1 align = "center">Products List</h1>
    <font color = "red"><center><%=session("products_error")%></center>
        <center>
            <%
                if (p_status = TRUE) then
                    Response.write("<br>Product active <a href=?p_status=0>Product inactive</a><br>")
                else
                    Response.write("<br><a href=?p_status=1> Product active</a> Product inactive <br>")
                end if
            %>
            <br>
        </center>
    </font>
    <table align="center" width = "800px" border="1">
        <tr>
            <th>Products ID</th>
            <th>Products name</th>
            <th>Products Discription</th>
            <th>Products image</th>
            <th>Products Quatity</th>
            <th>Products Price</th>
            <th>Cat Name</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>

        <%
            while not rs.eof
        %>
        <tr>
            <td><%=rs("p_id")%></td>
            <td><%=rs("p_name")%></td>
            <td><%=rs("p_discription")%></td>
            <td><img src="images/<%=rs("p_image")%>"></td>
            <td><%=rs("p_quantity")%></td>
            <td><%=rs("p_price")%></td>
            <td><%=rs("cat_name")%></td>
            <td align="center" ><a href="products_edit.asp?p_id=<%=rs("p_id")%>"><img src="images/edit.png" width="20px"></a></td>
            <td align="center"><a onclick="return confirm('are you sure to delete <%=rs("p_id")%>')" 
                                    href="products_delete.asp?p_id=<%=rs("p_id")%>"><img src="images/delete.png" width="20px"></a></td>
        </tr>
        <%
            rs.movenext
            wend
        %>

    </table>
    <center><a href="products_add.asp">Add New Products</a></center>
    <center><a href="products_view_deleted.asp">View Deleted Products</a></center>

    <%session("products_error")=""%>
</body>
</html>