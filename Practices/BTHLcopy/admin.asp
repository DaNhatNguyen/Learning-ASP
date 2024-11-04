<%
    if(session("login") = false) then
        session("login error") = "You must login to access admin"
        Response.Redirect("login.asp")
    Else
        Response.Write("login is succesfull")
        Response.Redirect("categories_view.asp")
    end if
%>