<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1 align="center">Thu thập thông tin sinh viên</h1>
    <form method="get" action="ThuThaptt_action.asp" name="f1">
        <table border="0" align="center" width="600">
            <tr>
                <td align="right"> Họ và tên: </td>
                <td><input class="dai" type="text" name="txtHovaTen"></td>
            </tr>
            <tr>
                <td align="right">Số bí mật: </td>
                <td><input class="dai" type="password" name="txtSobiMat"></td>
            </tr>
            <tr>
                <td align="right">Địa chỉ: </td>
                <td><input class="dai" type="text" name="txtDiaChi"></td>
            </tr>
            <tr>
                <td align="right">Điện thoại: </td>
                <td><input class="dai" type="text" name="txtSDT"></td>
            </tr>
            <tr>
                <td align="right">Giới tính: </td>
                <td><input type="radio" name="rdGioiTinh" value="Nam" checked>Nam
                    <input type="radio" name="rdGioiTinh" value="Nữ">Nữ
                    <input type="radio" name="rdGioiTinh" value="Khác">Khác
                </td>
            </tr>
            <tr>
                <td align="right">Sở thích: </td>
                <td><input type="checkbox" name="rdSoThich" value="Âm nhạc">Âm nhạc
                    <input type="checkbox" name="rdSoThich" value="Bóng đá">Bóng đá
                    <input type="checkbox" name="rdSoThich" value="Đọc sách">Đọc sách<br>
                    <input type="checkbox" name="rdSoThich" value="Ngủ">Ngủ
                    <input type="checkbox" name="rdSoThich" value="Xem phim">Xem phim
                    <input type="checkbox" name="rdSoThich" value="Game">Game
                </td>
            </tr>
            <tr>
                <td align="right">Giới thiệu bản thân</td>
                <td><textarea class="dai" name="txtGT" ></textarea></td>
            </tr>
            <tr>
                <td align="right"><input type="submit" name="cmd" value="Gửi đi"></td>
                <td><input type="reset" value="Làm lại"></td>
            </tr>
        </table>
    </form>
</body>
</html>