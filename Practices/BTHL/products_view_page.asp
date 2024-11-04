<!-- #include file = "connection.asp" -->

<%
    sql = "select a.*, b.cat_name from product a, Categories b where a.cat_id = b.cat_id"
    rs.cursorlocation = 3
    rs.open sql,conn,0,1
    'so ban ghi tren trang'
    rs.pagesize = 3
    page = cint(Request("page"))
    if(page <= 0) then 
        page = 1
    end If
    if(page > rs.pagecount) then
        page = rs.pagecount
    end if
    'doc con tro den trang can chuyen '
    rs.absolutepage = page
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1 align = "center">Products List</h1>
    <font color = "red"><center><%=session("products_error")%></center></font>
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
            while not rs.eof and rs.absolutepage = page
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
    <center><a href="products_view_deleted.asp">View Deleted Products</a></center>
    <center><a href="products_add.asp">Add New Products</a>
        <br>
        <%
            for i = 1 to rs.pagecount
                if(i = page) then
                    Response.Write( i )
                else
                    Response.Write("<a href = ?page="&i&">"&" "& i &" " &"</a>")
                end if
            next
            rs.close
            conn.close
        %>
    </center>

    <%session("products_error")=""%>
</body>
</html>