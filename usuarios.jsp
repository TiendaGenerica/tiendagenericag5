<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Usuarios</title>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<h1>Usuarios</h1>
	<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conexion = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda_generica_g5","root","root");
	PreparedStatement ps = conexion.prepareStatement("SELECT * FROM usuarios");
	ResultSet result = ps.executeQuery();
	%>
	<a href="crearUsuario.html">Crear Usuario</a>
	<table border="1">
		<tr>
			<th>Cedula</th>
			<th>Nombre</th>
			<th>Email</th>
			<th>Usuario</th>
			<th>Contraseña</th>
			<th colspan="2">Acciones</th>
		</tr>
		<%
			while(result.next()){				
		%>
		<tr>
			<td><%=result.getInt("cedula_usuario") %>
			<td><%=result.getString("nombre_usuario") %>
			<td><%=result.getString("email_usuario") %>
			<td><%=result.getString("usuario") %>
			<td><%=result.getString("contraseña") %>			
			<td><a href="actualizarUsuario.jsp?cedula=<%=result.getInt("cedula_usuario")%>">Editar</a></td>
			<td><a href="borrarUsuario.jsp?cedula=<%=result.getInt("cedula_usuario")%>">Eliminar</a></td>
		</tr>
		<%} %>
	</table>
</body>
</html>