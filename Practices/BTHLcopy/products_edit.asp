<!-- #include file = "connection.asp" -->

<%
    p_id = Request("p_id")
    rs1.open "select * from product where p_id = " & p_id,conn
    
    if rs1.eof then
        session("products_error") = "Data not exist to edit"
        conn.close
        Response.Redirect("products_view.asp")
    else 
        rs.open "select * from Categories", conn 
%>

    <h1 align = "center">Edit Product</h1>
    <center>
        <font color = "red"><%=session("products_edit_error")%></font>
    </center>
    <form action="products_edit_action.asp" method="post">
        <table border="0" align="center">
            <tr>
                <td align="right">Product Name:</td>
                <td><input type="text" name="txtProductName" value="<%=rs1("p_name")%>"></td>
            </tr>
            <tr>
                <td align="right">Product Discription:</td>
                <td><input type="text" name="txtProductDiscription" value="<%=rs1("p_discription")%>"></td>
            </tr>
            <tr>
                <td align="right">Product Image:</td>
                <td><input type="text" name="txtProductImage" value="<%=rs1("p_image")%>"></td>
            </tr>
            <tr>
                <td align="right">Product Quantity:</td>
                <td><input type="text" name="txtProductQuantity" value="<%=rs1("p_quantity")%>"></td>
            </tr>
            <tr>
                <td align="right">Product Price:</td>
                <td><input type="text" name="txtProductPrice" value="<%=rs1("p_price")%>"></td>
            </tr>
            <tr>
                <td align="right">Categories Name:</td>
                <td>
                    <select name="slCategory">
                        <%
                            while not rs.eof 
                            %>
                                <option 
                                    <% 
                                    if (Cint(rs1("cat_id")) = Cint(rs("cat_id"))) then 
                                        response.write(" selected ")
                                    end if 
                                    %>
                                value="<%=rs("cat_id")%>"><%=rs("cat_name")%></option>
                            <%
                            rs.movenext
                            wend
                            
                        %>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right">Product status:</td>
                <td><input type=radio 
                            <%
                                if (rs1("p_status")=TRUE) then 
                                    response.write(" checked ")
                                end if     
                            %> 
                    name = "rsProductStatus" value=1>Active
                    <input type="radio"
                            <%
                                if (rs1("p_status")=FALSE) then 
                                    response.write(" checked ")
                                end if     
                            %>
                    name="rsProductStatus" value="0">Inactive
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
