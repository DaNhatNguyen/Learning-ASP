<!-- #include file = "connection.asp" -->
<%
    cat_id = Request.form("slCategories")
    cat_name = Request.form("txtCatname")

    'lấy kết quả tìm kiếm
    
    
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="" method="post" name="f">
        <h1 align = center>Tìm kếm sản phẩm</h1>
        <center>
            <table>
                <tr>
                    <td>
                        <td>Chọn danh mục: </td> 
                        <td>
                            <select name="slCategories" id="">
                                <option></option>
                                    <%
                                        rs.open "select * from Categories",conn
                                        while not rs.eof
                                            Response.Write("<option value=" & rs("cat_id"))
                                            if(cat_id <> "") then
                                                if(rs("cat_id") = cint(cat_id))then
                                                    Response.Write(" selected ")
                                                end if
                                            end if
                                            Response.Write(">" & rs("cat_name") & "</option>")
                                            rs.movenext
                                        wend
                                    %>
                            </select>
                        </td>
                    </td>
                </tr>
                <tr>
                    <td>Nhập tên sản phẩm cần tìm: </td>
                    <td><input type="text" name="txtCatname" value="<%=cat_name%>"></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Tìm kiếm"></td>
                    <td><input type="reset" value="Hủy bỏ"></td>
                </tr>
            </table>
        </center>
        <!-- Xử Lý tìm kiếm -->

    </form>
</body>
</html>