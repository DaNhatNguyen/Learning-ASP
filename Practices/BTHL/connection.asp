<%
    set conn = Server.CreateObject("ADODB.Connection")
    set rs = Server.CreateObject("ADODB.Recordset")
    set rs1 = Server.CreateObject("ADODB.Recordset")
    connstr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.Mappath("Database1.mdb")
    conn.open connstr
%>