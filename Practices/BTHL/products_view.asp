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
            p_id = Request("p_id")
            p_name = Request("txtProductName")
            p_discr = Request("txtProductDiscription")
            p_image = Request("txtProductImage")
            p_quan = Request("txtProductQuantity")
            p_price = Request("txtProductPrice")
            cat_id = Request("txtCatID")
            p_status = Request("rdPstatus")
        
            rs.open "select * from product where p_name = '" & p_name & "' and p_id <> " & p_id, conn
            if(rs.eof)then
            sql = "update product set p_name='" & p_name & "',p_discription='" & p_discr &"', p_image='" & p_image & "',p_quantity=" & p_quan & ",p_price=" & p_price & ",cat_id=" & cat_id & ",p_status='" & p_status & "' where p_id = " & p_id
            'Response.Write(sql)
            conn.execute sql
            else 
                session("products_error") = p_id & "exist!"
            end if
            rs.close
        case "save delete":

    end select

    'sql = "select * from product"
    sql = "select p_id, p_name, p_discription, p_image, p_quantity, p_price, categories.cat_name, p_status from categories inner join product on categories.cat_id = product.cat_id"
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
    <form action="products_view.asp" action = "post">
        <table align="center" width = "800px" border="1">
            <tr>
                <th>Products ID</th>
                <th>Products name</th>
                <th>Products Discription</th>
                <th>Products image</th>
                <th>Products Quatity</th>
                <th>Products Price</th>
                <th>Cat Name</th>
                <th>Status</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>

            <%
                while not rs.eof
                    if((action = "edit") and (cint(p_id) = cint(rs("p_id")))) then
            %>
            <tr>
                <td><%=rs("p_id")%></td>
                <td><input type="text" name="txtProductName" value="<%=rs("p_name")%>"></td>
                <td><textarea name="txtProductDiscription" cols=20 rows=6><%=rs("p_discription")%></textarea></td>
                <td><img src="images/<%=rs("p_image")%>"></td>
                <td><input type="text" name="txtProductQuantity" value="<%=rs("p_quantity")%>"></td>
                <td><input type="text" name="txtProductPrice" value="<%=rs("p_price")%>"></td>
                <!-- hien option va danh dau -->
                <td><select name="txtCatID">
                    <%
                        ' Duyệt qua kết quả truy vấn và tạo các thẻ option
                        rs1.open "select * from Categories", conn
                        Do While Not rs1.EOF
                        Response.Write("<option value=" & rs1("Cat_ID"))
                        if(rs("Cat_Name") = rs1("Cat_Name")) then
                            Response.Write(" selected")
                        end if
                            Response.Write(">" & rs1("Cat_Name") & "</option>")
                        rs1.MoveNext
                        Loop
                        rs1.close
                    %>
                </select></td>
                <!-- hien o trang thai va danh dau -->
                <td><input type=radio  
                    <%
                        if (rs("p_status") = -1) then 
                            response.write(" checked ") 
                        end if 
                    %> 
                    value=-1 name=rdPstatus>Hoạt động
                    <input type=radio 
                    <%
                        if (rs("p_status") = 0) then 
                            response.write(" checked ") 
                        end if 
                    %>
                    value=0 name=rdPstatus>Ngừng hoạt động 
                </td>
                <td>
                    <input type=hidden name="action" value="save update">
                    <input type=hidden name="p_id" value=<%=p_id%>>
                    <input type=submit value="Lưu lại">
                </td>
                <td>
                    <input type=reset value="Hủy bỏ">
                </td>
            </tr>
            <%
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
                <td><%
                    if (rs("p_status")=-1) then
                        response.write("Hoạt động")
                    else 
                        response.write("Ngừng hoạt động")
                    end if 
                    %>
                </td>
                <td align="center" ><a href="?action=edit&p_id=<%=rs("p_id")%>"><img src="images/edit.png" width="20px"></a></td>
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
                                    Response.Write("<option value='" & rs("Cat_ID") & "'>" & rs("Cat_Name") & "</option>")
                                    rs.MoveNext
                                Loop
                                rs.close
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Trạng thái:</td>
                        <td><input type=radio value=-1 checked name=rdPstatus>Hoạt động
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