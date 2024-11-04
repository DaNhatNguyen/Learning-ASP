<!-- #include file="connection.asp" -->

<%
    ProductName = Request.Form("txtProductName")
    ProductDiscript = Request.Form("txtProductDiscription")
    ProductImage = Request.Form("txtProductImage")
    ProductQuantity = Request.Form("txtProductQuantity")
    ProductPrice = Request.Form("txtProductPrice")
    CatID = Request.Form("txtCatID")

    sql1 = "select * from product where p_name = '" & ProductName & "';"
    rs.open sql1, conn

    if(rs.eof) then
        sql = "insert into product (p_name, p_discription, p_image, p_quantity, p_price, cat_id) " & _
        "values('" & ProductName & "', '" & ProductDiscript & "', '" & ProductImage & "', '" & ProductQuantity & "', '" & ProductPrice & "', '" & CatID & "');"

        conn.execute sql
        session("product_error") ="A new add successful"
        response.redirect("products_view.asp")
    else
        session("products_add_error") = "cat_name" & " exist"
        response.redirect("ProductsAdd.asp")
    end if
    conn.close
%>