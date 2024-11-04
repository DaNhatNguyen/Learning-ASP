<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" type="image /x-icon" href="mon.ico" />
    <title>Giải Phương Trình Bậc Hai và Bậc Nhất</title>

    <style>
      body {
        font-family: "Times New Roman", serif;
        text-align: center;
      }

      input[type="text"], input[type="submit"] {
        margin: 10px;
        padding: 10px;  
        font-size: 16px;  
      }
      
      input[type="submit"] {
        font-family: "Times New Roman", serif;
        font-size: 18px;  
        cursor: pointer;  
        background-color: #4CAF50; 
        color: white; 
        border: none; 
        border-radius: 5px; 
      }
      
      .result {
        margin-top: 20px;
        border: 1px solid #ccc;
        padding: 10px;
        width: 400px;
        display: inline-block;
        font-size: 20px; 
      }
    </style>
  </head>
  <body>
    <form method="post">
      Nhập a: <input type="text" name="a" value="<%= Request("a") %>"><br />
      Nhập b: <input type="text" name="b" value="<%= Request("b") %>"><br />
      Nhập c: <input type="text" name="c" value="<%= Request("c") %>"><br />
      <input type="submit" value="Giải phương trình" />
    </form>

    <% If Request.Form.Count > 0 Then
        Dim a, b, c, delta, x1, x2, result
        a = Request("a")
        b = Request("b")
        c = Request("c")
        
        If IsNumeric(a) And IsNumeric(b) And IsNumeric(c) Then
            a = CDbl(a)
            b = CDbl(b)
            c = CDbl(c)
            
            If a = 0 Then
                If b = 0 Then
                    If c = 0 Then
                        result = "Phương trình có vô số nghiệm."
                    Else
                        result = "Phương trình vô nghiệm."
                    End If
                Else
                    x1 = -c / b
                    result = "Phương trình bậc nhất: x = " & x1
                End If
            Else
                delta = b * b - 4 * a * c
                If delta > 0 Then
                    x1 = (-b + Sqr(delta)) / (2 * a)
                    x2 = (-b - Sqr(delta)) / (2 * a)
                    result = "Phương trình có hai nghiệm phân biệt: x1 = " & x1 & " và x2 = " & x2
                ElseIf delta = 0 Then
                    x1 = -b / (2 * a)
                    result = "Phương trình có nghiệm kép: x = " & x1
                Else
                    result = "Phương trình vô nghiệm."
                End If
            End If
        Else
            result = "Vui lòng nhập vào các số hợp lệ."
        End If
        
        Response.Write("<div class='result'>Kết quả: " & result & "</div>")
    End If %>
  </body>
</html>
