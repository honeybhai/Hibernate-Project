<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" />
	<link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" type="text/css" />
	<title>Vopium - ERS :: Login</title>
</head>
<body>
	<div id="login">
		<div id="container">
			<table width="100%" style="padding: 5px; margin: 0 auto;">
				<tr>
					<td style="padding-left: 10px; padding-top: 10px;" width="20%">
						<%-- <img alt="BNU" src="${pageContext.request.contextPath}/images/vopium-logo.png" height="50" width="150px"> --%>
					</td>
					 <td id="subtitle">&nbsp;&nbsp;Spring-Hibernate Demo Application</td>
					<!-- <td align="right" valign="top"></td> -->
				</tr>
				<tr>
					<td colspan="2" style="padding-top: 10px;">
						<form action="${pageContext.request.contextPath}/loginUser.bnu" method="post">
							<table id="login_table">
								<tr>
									<td width="20%">&nbsp;</td>
									<td width="20%"><label>Username</label></td>
									<td><input type="text" name="j_username" /></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td><label>Password</label></td>
									<td><input type="password" name="j_password" /></td>
									<td rowspan="2" width="30%" style="padding-left: 20px;">
										<!-- <div id="login_button" title="Login" onclick="document.forms[0].submit();"></div> -->
										<input type="submit" value="Login" />
									</td>
								</tr>
							</table>
							<input type="submit" style="position: absolute; left: -9999px; width: 1px; height: 1px;"/>
						</form>	
					</td>					
				</tr>
			</table>
		</div>	
		<div id="footer">
			Powered by <a href="http://www.linkedin.com/in/muhammadharis">Muhammad Haris</a>
		</div>
	</div>
</body>
</html>