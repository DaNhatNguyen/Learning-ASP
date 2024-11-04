<!-- #include file="connection.asp" -->
<%
    CatName = request.Form("txtCatName")
    CatImage = request.Form("txtCatImage")
    CatOrder = request.Form("txtCatOrder")
    CatStatus = request.form("txtCatStatus")
    
    sql1 = "select * from categories where cat_name = '" & CatName & "';"
    rs.open sql1, conn
    if(rs.eof) then

        sql = "insert into categories (cat_name, cat_img, cat_order, cat_status) " & _
        "values('" & CatName & "', '" & CatImage & "', '" & CatOrder & "', '" & CatStatus & "');"

        conn.execute sql
        session("categories_error") ="A new add successful"
        response.redirect("categories_view.asp")
    else
        session("categories_add_error") = "cat_name" & " exist"
        response.redirect("categoriesAdd.asp")
        
    end if
    conn.close
%>