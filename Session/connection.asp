<%
    set conn = Server.CreateObject("ADODB.Connection")
        strconn = "Provider = Microsoft.Jet.OLEDB.4.0; Data Source = " & Server.Mappath("Database1.accdb") & ";"
        conn.Open strconn
%>
