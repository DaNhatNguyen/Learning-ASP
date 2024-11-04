<%
    Response.write("Họ tên của bạn: " & Request.QueryString("txtHovaTen") & "<br>")
    Response.write("Số điện thoại: " & Request.QueryString("txtSDT") & "<br>")
    Response.write("Sở thích: " & Request.QueryString("rdSoThich"))
    for i=0 to Request.QueryString("rdSoThich").count
        response.write("<br>" & Request.QueryString("rdSoThich")(i))
        next
%>

<!-- Lưu ý : Nếu không biết method gửi là post hay get  -->
 <!-- Request("Tên phẩn tử"): lấy được giá trị của phần tử có tên là "tên phần tử" -->
<!-- Muốn chuyển hướng đến trang nào đó thì dùng -->
<!-- Response.Redirect("Tên cần chuyển") -->
<!-- Ví dụ -->
    <!-- if (Request("action")="edit") then
        response.Redirect("test_action.asp")
    else if (Request("action")="add") then
        Response.Redirect("formDangNhap.asp")
    else Response.Redirect("default.asp")
    end if
    end if -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
</body>
</html>