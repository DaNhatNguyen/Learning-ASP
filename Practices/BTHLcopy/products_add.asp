<!-- #include file = "connection.asp" -->
<%
    Set rs = conn.Execute("SELECT Cat_ID, Cat_Name FROM Categories")
%>

    <h1 align = "center">Add new product</h1>
    <center>
        <font color = "red"><%=session("products_add_error")%></font>
        <%session("products_add_error")=""%>
    </center>
    <form action="products_add_action.asp" method="post">
        <table border="0" align="center">
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
                            Do While Not rs.EOF
                            Response.Write "<option value='" & rs("Cat_ID") & "'>" & rs("Cat_Name") & "</option>"
                            rs.MoveNext
                        Loop
                        %>
                    </select>
                </td>
            </tr>
    
            <tr>
                <td><input type="submit" name = "cmd" value = "Submit"></td>
                <td><input type="reset" value = "Reset"></td>
            </tr>
        </table>
        
    </form>