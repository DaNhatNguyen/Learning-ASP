<!-- #include file = "connection.asp" -->
 <%
    cat_id = Request("cat_id")
    cat_name = Request("txtCatName")
    cat_order = Request("txtCatOrder")
    cat_image = Request("txtCatImage")
    cat_status = Request("txtCatStatus")
    rs.open "select * from categories where cat_name = '" & cat_name & "' and cat_id <> " & cat_id, conn
    if(rs.eof)then
    sql = "update categories set cat_name='" & cat_name & "',cat_order=" & cat_order &", cat_img='" & cat_image & "',cat_status=" & cat_status & " where cat_id = " & cat_id
    conn.execute sql
    conn.close
    Response.Redirect("categories_view.asp")
    else 
        session("categories_edit_error") = cat_name & "exist!"
        Response.Redirect("categories_edit.asp?cat_id = " & cat_id)
    end if
 %>