<%
username = Request.Form("txtUsername")
password = Request.Form("txtPassword")

if(username = "nhat") and (password = "123") then
    session("fullname") = username
    session("login error") = ""
    session("login") = true
    Response.redirect("admin.asp")
Else
    session("fullname") = ""
    session("login error") = "username or password incorrect"
    session("login") = false
    Response.redirect("login.asp")
end if
%> 