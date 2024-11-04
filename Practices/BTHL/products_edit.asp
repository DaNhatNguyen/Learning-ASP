<!-- #include file = "connection.asp" -->

<%
    p_id = Request("p_id")
    rs.open "select * from product where p_id = " & p_id,conn
    Set rs1 = conn.Execute("SELECT Cat_ID, Cat_Name FROM Categories")
    if rs.eof then
        session("products_error") = "Data not exist to edit"
        Response.Redirect("products_view.asp")
    else 
%>

    <h1 align = "center">Edit Product</h1>
    <center>
        <font color = "red"><%=session("products_edit_error")%></font>
    </center>
    <form action="products_edit_action.asp" method="post">
        <table border="0" align="center">
            <tr>
                <td align="right">Product Name:</td>
                <td><input type="text" name="txtProductName" value="<%=rs("p_name")%>"></td>
            </tr>
            <tr>
                <td align="right">Product Discription:</td>
                <td><input type="text" name="txtProductDiscription" value="<%=rs("p_discription")%>"></td>
            </tr>
            <tr>
                <td align="right">Product Image:</td>
                <td><input type="text" name="txtProductImage" value="<%=rs("p_image")%>"></td>
            </tr>
            <tr>
                <td align="right">Product Quantity:</td>
                <td><input type="text" name="txtProductQuantity" value="<%=rs("p_quantity")%>"></td>
            </tr>
            <tr>
                <td align="right">Product Price:</td>
                <td><input type="text" name="txtProductPrice" value="<%=rs("p_price")%>"></td>
            </tr>
            <tr>
                <td align="right">Categories Name:</td>
                <td>
                    <select name="txtCatID">
                        <%
                        selectedCatID = rs("cat_id")
                        ' Duyệt qua kết quả truy vấn và tạo các thẻ option
                        Do While Not rs1.EOF
                        ' Kiểm tra nếu giá trị từ form khác khớp với Cat_ID
                        If rs1("Cat_ID") = selectedCatID Then
                            Response.Write "<option value='" & rs1("Cat_ID") & "' selected>" & rs1("Cat_Name") & "</option>"
                        Else
                            Response.Write "<option value='" & rs1("Cat_ID") & "'>" & rs1("Cat_Name") & "</option>"
                        End If
                            rs1.MoveNext
                        Loop
                        %>
                    </select>
                </td>
            </tr>
            <tr>
                <td><input type="submit" name = "cmd" value = "Update">
                    <input type="hidden" name="p_id" value="<%=p_id%>">
                </td>
                <td><input type="reset" value = "Reset"></td>
            </tr>
        </table>
    </form>
<%
    end if 
    session("products_edit_error")=""
%>
