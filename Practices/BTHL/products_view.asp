<!-- #include file = "connection.asp" -->
<%
    action = Request("action")
    p_id = Request("p_id")
    Select case(action)
        case "save add":
            ProductName = Request.Form("txtProductName")
            ProductDiscript = Request.Form("txtProductDiscription")
            ProductImage = Request.Form("txtProductImage")
            ProductQuantity = Request.Form("txtProductQuantity")
            ProductPrice = Request.Form("txtProductPrice")
            CatID = Request.Form("txtCatID")
            ProductStatus = Request.Form("rdPstatus")
            
            'kiem tra ten xem co thoa man
            sql1 = "select * from product where p_name = '" & ProductName & "';"
            rs.open sql1, conn
        
            if(rs.eof) then
                sql = "insert into product (p_name, p_discription, p_image, p_quantity, p_price, cat_id, p_status) " & _
                "values('" & ProductName & "', '" & ProductDiscript & "', '" & ProductImage & "', '" & ProductQuantity & "', '" & ProductPrice & "', '" & CatID &"', " & ProductStatus & ");"
                conn.execute sql
                session("products_error") ="A new add successful"
            else
                session("products_error") = "cat_name" & " exist"
                action = "add"
				Session("product_error")=""
            end if
            rs.close                      
        case "save update":

        case "save delete":

    end select

    'sql = "select * from product"
    sql = "select p_id, p_name, p_discription, p_image, p_quantity, p_price, categories.cat_name from categories inner join product on categories.cat_id = product.cat_id"
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
    <h1 align = "center">Products List</h1>
    <font color = "red"><center><% =session("products_error")%></center></font>
    <form action="">
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
                    if((action = "edit") and (p_id = cint(rs("p_id")))) then
                    end if
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
                rs.close
            %>

        </table>
    </form>
    <center><a href="?action=add">Add New Products</a></center>
    <%
        if(action = "add") then
    %>
            <form action = "products_view.asp" method="post" name = "f">
                <table border="0" align="center">
                    <h1 align = "center">Add Product</h1>
                    <center><font><% session("product_add_error")%></font></center>
                    <tr>
                        <td align="right">Product Name:</td>
                        <td><input type="text" name="txtProductName"></td>
                    </tr>
                    <tr>
                        <td align="right">Product Discription:</td>
                        <td><input type="text" name="txtProductDiscription"></td>
                    </tr>
                    <tr>
                        <td align="right">Product Image:</td>
                        <td><input type="text" name="txtProductImage"></td>
                    </tr>
                    <tr>
                        <td align="right">Product Quantity:</td>
                        <td><input type="text" name="txtProductQuantity"></td>
                    </tr>
                    <tr>
                        <td align="right">Product Price:</td>
                        <td><input type="text" name="txtProductPrice"></td>
                    </tr>
                    <tr>
                        <td align="right">Categories Name:</td>
                        <td>
                            <select name="txtCatID">
                                <%
                                ' Duyệt qua kết quả truy vấn và tạo các thẻ option
                                    rs.open "select * from Categories"
                                    Do While Not rs.EOF
                                    Response.Write "<option value='" & rs("Cat_ID") & "'>" & rs("Cat_Name") & "</option>"
                                    rs.MoveNext
                                Loop
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Trạng thái:</td>
                        <td><input type=radio value=1 checked name=rdPstatus>Hoạt động
                                <input type=radio value=0 name=rdPstatus>Ngừng hoạt động 
                        </td>
                    </tr>
                    <tr>
                        <input type="hidden" name = "action" value="save add">
                        <td><input type="submit" name = "cmd" value = "Submit"></td>
                        <td><input type="reset" value = "Reset"></td>
                    </tr>
                </table>
    <%
    end if
    %>
</body>
</html>
<%
	conn.close
	session("products_error") = ""
	session("product_add_error") = ""
%>