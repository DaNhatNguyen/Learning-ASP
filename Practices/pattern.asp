<!--#include file="connection.asp"-->
<%
	action = Request("action")
	pid = Request("pid")
	select case  (action) 
		case "save add":
			pname=Request.Form("txtPname")
			pdesc=Request.Form("taPdesc")
			pimage=Request.Form("txtPimage")
			cid=Request.Form("slCid")
			pprice = Request.Form("txtPprice")
			pquantity = Request.Form("txtPquantity")
			pstatus=Request.Form("rdPstatus")
			'Kiểm tra nếu tên danh mục có rồi thì báo lỗi
			sql="select * From Product where pname='" & pname &"'"
			rs.open sql, conn 
			if (not rs.eof) then
				Session("product_add_error")="Tên sản phẩm: " & pname &" đã có rồi!"
				action = "add"	
				Session("product_error")=""
			else 
				sql = "insert into product(pname,pdesc,pimage,cid,pstatus,pprice,pquantity) values ('" & pname & "','" & pdesc & "','" & pimage & "'," & cid & "," & pstatus & "," &pprice & "," & pquantity & ")"
				'Response.write(sql)
				conn.execute sql 
				
				Session("product_add_error")=""
				Session("product_error")="Thêm mới thành công"
				
			end if			
			rs.close 
		case "save update":
			pname=Request.Form("txtPname")
			pdesc=Request.Form("taPdesc")
			pimage=Request.Form("txtPimage")
			cid=Request.Form("slCid")
			pstatus=Request.Form("rdPstatus")
			'Kiểm tra nếu tên danh mục có rồi thì báo lỗi
			sql="select * From Product where pname='" & pname &"' and pid<>" & pid 
			rs.open sql, conn 
			if (not rs.eof) then
				Session("product_error")="Tên sản phẩm: " & pname &" đã có rồi!"	
			else 
				sql = "update product set pname='" & pname & "',pdesc='" & pdesc & "',pimage ='" & pimage & "',cid = " & cid & ",pstatus = " & pstatus & " where pid = " & pid 
				'Response.write(sql)
				conn.execute sql 
				Session("product_error")="Cập nhật thành công"
			end if
			rs.close 
		case "delete":
			sql = "delete from Product where pid=" & pid 
			conn.execute sql 
			session("product_error") = "Xóa thành công!"	

	end select 


	sql = "select Product.*,Categories.cname from Product, Categories where Product.cid = Categories.cid"
	rs.open sql, conn  
%>
<html>
	<head>
		<title>Tiêu đề trang web</title>
		<meta charset="utf-8">
		<style type=text/css>
				.dai{ width:150px; }
		</style>
	</head>
	<body>
			<h1 align=center>Danh sách các sản phẩm trong hệ thống</h1>
			<center><font color=red><%=Session("product_error")%></font></center>
			<br>
			<center><a href="product_add.asp">Thêm mới một sản phẩm</a></center>
			<form method=Post action="product_view_one_page.asp">
			<table border=1 width=800 align=center>
				<tr>
					<th>Mã sản phẩm</th>
					<th>Tên sản phẩm </th>
					<th>Mô tả</th>
					<th>Ảnh</th>
					<th>Nhóm sản phẩm</th>
					<th>Trạng thái</th>
					<th>Sửa</th>
					<th>Xóa</th>
				</tr>
				<%
				if (rs.eof) then
					response.write("<tr><td colspan=8>Tập dữ liệu rỗng!</td></tr>")
				else
					while not rs.eof 
						if ((action="edit") and (cint(pid) =rs("pid"))) then 
								%>
								<tr>
								<td><%=rs("pid")%></td>
								<td><input type=text name=txtPname value="<%=rs("pname")%>"></td>
								<td><textarea cols=20 rows=6 name=taPdesc><%=rs("pdesc")%></textarea></td>
								<td><input type=text name=txtPimage value="<%=rs("pimage")%>"></td>
								<td><select name=slCid>
											<%
															rs1.open "select * from Categories where cstatus=1", conn 
															while not rs1.eof 
																response.write("<option value=" & rs1("cid"))
																if (rs("cid") =rs1("cid")) then 
																		response.write(" selected ")
																end if 
																response.write (">" & rs1("cname") & "</option>")
															
															rs1.movenext
															wend
															rs1.close 
													%>	
										</select>
								</td>
								<td><input type=radio value=1 <%
											if (rs("pstatus")=1)  then 
												response.write(" checked ") 
											end if 
										%> name=rdPstatus>Hoạt động
												<input type=radio 
												<%
											if (rs("pstatus")=0)  then 
												response.write(" checked ") 
											end if 
										%>
												value=0 name=rdPstatus>Ngừng hoạt động 
								</td>
								<td>
											<input type=hidden name="action" value="save update">
											<input type=hidden name="pid" value=<%=pid%>>
											<input type=submit value="Lưu lại">
								</td>
								<td>
										<input type=reset value="Hủy bỏ">
								</td>
							</tr>
						<%		
						else 
						%>
							<tr>
								<td><%=rs("pid")%></td>
								<td><%=rs("pname")%></td>
								<td><%=rs("pdesc")%></td>
								<td><img src="images/<%=rs("pimage")%>" width=200></td>
								<td><%=rs("cname")%></td>
								<td><%
										if (rs("pstatus")=1) then
											response.write("Hoạt động")
										else 
											response.write("Ngừng hoạt động")
										end if 
								%></td>
								<td><a href="?action=edit&pid=<%=rs("pid")%>">Sửa</a></td>
								<td><a onclick="return confirm('Bạn có chắc muốn xoá <%=rs("pname")%> hay ko?');"  href="?action=delete&pid=<%=rs("pid")%>">Xóa</a></td>
							</tr>
						<%
						end if 
							rs.movenext
						
							wend
							rs.close
							'conn.close 
						%>
						<%
				end if
					%>
			</table>
			</form>
			<center><a href="?action=add">Thêm mới một sản phẩm</a></center>
			<%
				if (action="add") then 
					%>
						<form method=POST name=f action="product_view_one_page.asp">
							<h1 align=center>Thêm mới một sản phẩm</h1>
							<center><font color=red><%=session("product_add_error")%></font></center>
							<table border=0 align=center>
									<tr>
										<td>Tên sản phẩm:</td>
										<td><input type=text name=txtPname class=dai></td>
									</tr>
									<tr>
										<td>Mô tả:</td>
										<td><textarea cols=20 rows=6 name=taPdesc class=dai></textarea></td>
									</tr>
									<tr>
										<td>Ảnh:</td>
										<td><input type=text name=txtPimage class=dai></td>
									</tr>
									<tr>
										<td>Đơn giá:</td>
										<td><input type=text name=txtPprice class=dai></td>
									</tr>
									<tr>
										<td>Số lượng:</td>
										<td><input type=text name=txtPquantity class=dai></td>
									</tr>
									<tr>
										<td>Danh mục:</td>
										<td><select name=slCid>
													<%
															rs.open "select * from Categories where cstatus=1", conn 
															while not rs.eof 
																response.write("<option value=" & rs("cid") & ">" & rs("cname") & "</option>")
															
															rs.movenext
															wend
															rs.close 
													%>
												</select>
										</td>
									</tr>
									<tr>
										<td>Trạng thái:</td>
										<td><input type=radio value=1 checked name=rdPstatus>Hoạt động
												<input type=radio value=0 name=rdPstatus>Ngừng hoạt động 
										</td>
									</tr>
									<tr>
												<input type=hidden name=action value="save add">
										<td align=right><input type=submit value="Lưu lại"></td>
										<td><input type=reset value="Hủy bỏ"></td> 
									</tr>
							</table>
						</form>
			<%
				end if 
			%>	
			
	</body>
</html>
<%
	conn.close
	session("product_error") = ""
	session("product_add_error") = ""
%>