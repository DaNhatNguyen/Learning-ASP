<!-- #include file = "connection.asp" -->
<%
    ' Kiểm tra xem cat_id có tồn tại không, nếu không thì gán giá trị mặc định
    if Request("cat_id") <> "" then
        Cat_id = cint(Request("cat_id"))
    else
        Cat_id = 1 ' Giá trị mặc định
    end if


    sql = "SELECT * FROM product WHERE cat_id = " & Cat_id
    rs.cursorlocation = 3
    rs.open sql, conn, 0, 1
    ' Số bản ghi trên mỗi trang
    rs.pagesize = 3

    ' Kiểm tra và gán giá trị cho page
    page = 1
    page = cint(Request("page"))
    if page <= 0 then 
        page = 1
    end if
    if page > rs.pagecount then
        page = rs.pagecount
    end if
    ' Đặt con trỏ đến trang cần chuyển
    rs.absolutepage = page

    ' Lấy danh sách danh mục từ cơ sở dữ liệu
    sql1 = "SELECT * FROM categories"
    rs1.open sql1, conn
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh mục sản phẩm</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <h2>Danh mục sản phẩm</h2>
            <ul>
                <%
                    ' Lặp qua các danh mục
                    while not rs1.eof
                %>
                <li><a href="?cat_id=<%=rs1("cat_id")%>"><%=rs1("cat_name")%></a></li>
                <%
                    rs1.movenext
                    wend
                    rs1.close
                    set rs1 = nothing
                %>
            </ul>
        </div>
        <div class="display_product">
            <table border="1px">
                <tr>
                <%
                    while not rs.eof and rs.absolutepage = page
                %>
                    <td>
                        <img src="images/<%=rs("p_image")%>">
                        <div class="name-product"><%=rs("p_name")%></div>
                        <div class="price-product"><%=rs("p_price")%></div>
                    </td>     
                <%
                    rs.movenext
                    wend
                %>
                </tr>
            </table>
            <br>
            <%
                ' Phân trang
                for i = 1 to rs.pagecount
                    if i = page then
                        Response.write(i)
                    else
                        Response.write("<a href='?cat_id=" & Cat_id & "&page=" & i & "'> " & i & " </a>")
                    end if
                next
                rs.close
                conn.close
            %>
        </div>
    </div>
</body>
</html>
