<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Crear Usuario</title>
</head>
<body>
<%
	int cedula = Integer.parseInt(request.getParameter("cedula"));
	String nombre = request.getParameter("nombre");
	String email = request.getParameter("email");
	String usuario = request.getParameter("usuario");
	String contraseņa = request.getParameter("contraseņa");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conexion = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda_generica_g5","root","root");
	Statement st = conexion.createStatement();
	String sql = "INSERT INTO usuarios(cedula_usuario, nombre_usuario, email_usuario, usuario, contraseņa) VALUES('"+cedula+"','"+nombre+"','"+email+"','"+usuario+"','"+contraseņa+"')";
	st.executeUpdate(sql);
	response.sendRedirect("usuarios.jsp");
%>
</body>
</html>