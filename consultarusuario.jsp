<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="consultarusuario.css">
<meta charset="ISO-8859-1">
<title>Consultar Usuarios</title>
</head>
<body>
<div class="inicio">
	<form action="" method="post">
		<div class="title">Consultar Usuario</div>
		<div class="input-box">
			<span class="details">C�dula</span>
			<input type ="text" name="cedula" placeholder="Ingrese su c�dula" required>
		</div>
		<div>
			<button class="consultar">Consultar</button>
		</div>
		<h2><a href="menuusuarios.html">Volver</a></h2>
	</form>
</div>
	<%
			String cedula = request.getParameter("cedula");
			Class.forName("com.mysql.jdbc.Driver");
			Connection conexion = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda_generica_g5","root","root");
			PreparedStatement ps = conexion.prepareStatement("SELECT * FROM usuarios WHERE cedula_usuario = " + cedula);
			ResultSet result = ps.executeQuery();
			while(result.next()){
	%>
	<div class="conteiners_users">
		<div class="title"></div>
			<form action="" method="get">
				<div class="detalles_usuario">
					<div class="input-box">
						<span class="details">Nombre</span>
						<input type="text" name="nombre" value="<%= result.getString("nombre_usuario")%>">
					</div>
					<div class="input-box">
						<span class="details">Correo Electr�nico:</span>
						<input type="text" name="email" value="<%= result.getString("email_usuario")%>">
					</div>
					<div class="input-box">
						<span class="details">Usuario:</span>
						<input type="text" name="usuario" value="<%= result.getString("usuario")%>">
					</div>
					<div class="input-box">
						<span class="details">Contrase�a:</span>
						<input type="password" name="contrase�a" value="<%= result.getString("contrase�a")%>">
					</div>	
				</div>		
		</form>
	</div>
		<%
			}
		%>
</body>
</html>