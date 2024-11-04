<!-- #include file = "connection.asp" -->
<%
    p_id = Request("p_id")
    sql = "delete from product where p_id = " & p_id
    conn.execute sql
    conn.close
    session("products_error") = "Delete Successfull !"
    Response.Redirect("products_view.asp")
%>