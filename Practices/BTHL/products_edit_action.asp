<!-- #include file = "connection.asp" -->

<%
    p_id = Request("p_id")
    p_name = Request("txtProductName")
    p_discr = Request("txtProductDiscription")
    p_image = Request("txtProductImage")
    p_quan = Request("txtProductQuantity")
    p_price = Request("txtProductPrice")
    cat_id = Request("txtCatID")
    'Response.Write(p_id)

    rs.open "select * from product where p_name = '" & p_name & "' and p_id <> " & p_id, conn
    if(rs.eof)then
    sql = "update product set p_name='" & p_name & "',p_discription='" & p_discr &"', p_image='" & p_image & "',p_quantity=" & p_quan & ",p_price=" & p_price & ",cat_id=" & cat_id & " where p_id = " & p_id
    conn.execute sql
    conn.close
    Response.Redirect("products_view.asp")
    else 
        session("products_edit_error") = p_id & "exist!"
        Response.Redirect("products_edit.asp?p_id = " & p_id)
    end if
%>
