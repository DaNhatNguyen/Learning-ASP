<!-- #include file = "connection.asp" -->
<%
    cat_id = Request("cat_id")
    sql = "delete from categories where cat_id = " & cat_id
    conn.execute sql
    conn.close
    session("categories_error") = "Delete Successfull !"
    Response.Redirect("categories_view.asp")
%>