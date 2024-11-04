' <!-- sử dụng session:
' dùng cho các phiên làm việc đến kh hủy session như là đăng nhập, lưu trữ thông tin trong phiên
' phiên xác định từ khi bật trình duyệt đến khi trình duyệt
' các trình duyệt khác nhau thì phiên khác nhau
' cách khởi tạo session
' session("ten session") -->

<%
        if( session("nhan f5") = "") then 
            session("nhan f5") = 0
        end If
        session("nhan f5")  = session("nhan f5") + 1
        Response.Write("so lan nhan f5 la: " & session("nhan f5"))
     %>