<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Actualizar Usuario</title>
</head>
<body>
	<h1><span>Actualizar Usuario</span></h1>
	<form action="" method="post">
	<div>
		<label>Cédula</label>
		<input type="text" name="cedula" placeholder="Ingrese su Cédula">
	</div>
	<div>
			<input type="submit">
		</div>
	</form>
		<%
			String cedula = request.getParameter("cedula");
			Class.forName("com.mysql.jdbc.Driver");
			Connection conexion = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda_generica_g5","root","root");
			PreparedStatement ps = conexion.prepareStatement("SELECT * FROM usuarios WHERE cedula_usuario = " + cedula);
			ResultSet result = ps.executeQuery();
			while(result.next()){
		%>
		<form action="" method="get">
			<div>
				<label>Nombre:</label>
				<input type="text" name="nombre" value="<%= result.getString("nombre_usuario")%>">
			</div>
			<div>
				<label>Correo Electronico:</label>
				<input type="text" name="email" value="<%= result.getString("email_usuario")%>">
			</div>
			<div>
				<label>Usuario:</label>
				<input type="text" name="usuario" value="<%= result.getString("usuario")%>">
			</div>
			<div>
				<label>Contraseña:</label>
				<input type="text" name="contraseña" value="<%= result.getString("contraseña")%>">
			</div>			
			<div>
				<input type="submit" name="actualizar">
			</div>
		</form>
		<%
		}
		if(request.getParameter("actualizar")!=null){
				String nombre = request.getParameter("nombre");
				String email = request.getParameter("email");
				String usuario = request.getParameter("usuario");
				String contraseña = request.getParameter("contraseña");
				Statement st = conexion.createStatement();
				st.executeUpdate("UPDATE usuarios SET nombre_usuario ='"+nombre+"', email_usuario ='"+email+"', usuario ='"+usuario+"', contraseña ='"+contraseña+"' WHERE cedula_usuario ="+cedula);
				response.sendRedirect("menuusuarios.html");
		}
		%>
		<h2><a href="menuusuarios.html">Volver</a></h2>
</body>
</html>