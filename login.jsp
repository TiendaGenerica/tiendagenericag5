<%@page import="tienda_generica_g5.mensaje"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<% 
	String usuario = request.getParameter("usuario"); 
	String contraseņa = request.getParameter("contraseņa");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conexion = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda_generica_g5","root","root");
	PreparedStatement ps = conexion.prepareStatement("SELECT * FROM usuarios WHERE usuario = ? AND contraseņa = ?");
	ps.setString(1, usuario);
	ps.setString(2, contraseņa);
	ResultSet result = ps.executeQuery();
	int i=0;
	while(result.next()){
		i++;
	}
	if (i == 1){
		response.sendRedirect("menuprincipal.html");
	}else{
		response.sendRedirect("mensaje.html");
	}
	%>

</body>
</html>