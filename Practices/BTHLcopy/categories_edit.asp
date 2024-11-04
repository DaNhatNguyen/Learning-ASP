<!-- #include file = "connection.asp" -->

<%
    cat_id = Request("cat_id")
    rs.open "select * from categories where cat_id = " & cat_id,conn
    if rs.eof then
        session("categories_error") = "Data not exist to edit"
        Response.Redirect("categories_view.asp")
    else 
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1 align = "center">Edit categories</h1>
    <center>
        <font color = "red"><%=session("categories_edit_error")%></font>
    </center>
    <form action="categories_edit_action.asp" method="post">
        <table border="0" align="center">
            <tr>
                <td align="right">categories name:</td>
                <td><input type="text" name="txtCatName" value="<%=rs("cat_name")%>"></td>
            </tr>
            <tr>
                <td align="right">categories image:</td>
                <td><input type="text" name="txtCatImage" value="<%=rs("cat_img")%>"></td>
            </tr>
            <tr>
                <td align="right">categories order:</td>
                <td><input type="text" name="txtCatOrder" value="<%=rs("cat_order")%>"></td>
            </tr>
            <tr>
                <td align="right">categories status:</td>
                <td><input type="radio" name="txtCatStatus" value="1" <%if(rs("cat_status")=true) then Response.Write(" checked")%>>active
                    <input type="radio" name="txtCatStatus" value="0" <%if(rs("cat_status")=false) then Response.Write(" checked")%>>inactive
                </td>
            </tr>
            <tr>
                <td><input type="submit" name = "cmd" value = "Update">
                    <input type="hidden" name="cat_id" value="<%=cat_id%>"></td>
                <td><input type="reset" value = "Reset"></td>
            </tr>
        </table>
        <%session("categories_edit_error")=""%>
    </form>
</body>
</html>
<%
    end if 
%>