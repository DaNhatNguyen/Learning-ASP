<!-- #include file = "connection.asp" -->
<%
    sql = "select * from categories"
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
    <h1 align = "center">Categories List</h1>
    <font color = "red"><center><%=session("categories_error")%></center></font>
    <table align="center" width = "800px" border="1">
        <tr>
            <th>Cat ID</th>
            <th>Cat name</th>
            <th>Cat image</th>
            <th>Cat order</th>
            <th>Cat status</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
    <%
        while not rs.eof
    %>
        <tr>
            <td><%=rs("cat_id")%></td>
            <td><%=rs("cat_name")%></td>
            <td><img src = "images/<%=rs("cat_img")%>"></td>
            <td><%=rs("cat_order")%></td>
            <td><%
                if (rs("cat_status") = TRUE) then
                    Response.Write("active")
                else
                    Response.Write("inactive")
                end if
                %></td>
            <td align="center" ><a href="categories_edit.asp?cat_id=<%=rs("cat_id")%>"><img src="images/edit.png" width="20px"></a></td>
            <td align="center"><a onclick="return confirm('are you sure to delete <%=rs("cat_name")%>')" href="categories_delete.asp?cat_id=<%=rs("cat_id")%>"><img src="images/delete.png" width="20px"></a></td>
        <tr>
    <%
        rs.movenext
        wend
        session("categories_error")=""
    %>
    </table>
    <center><a href="categoriesAdd.asp">addNewCategories</a></center>
</body>
</html>
<%
    rs.close
    conn.close
    
%>