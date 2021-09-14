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
	<jsp:include page="menu.jsp"></jsp:include>
	<h1>Actualizar Usuario</h1>
		<%
			int cedula = Integer.parseInt(request.getParameter("cedula"));
			Class.forName("com.mysql.jdbc.Driver");
			Connection conexion = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda_generica_g5","root","root");
			PreparedStatement ps = conexion.prepareStatement("SELECT * FROM usuarios WHERE cedula_usuario = " + cedula);
			ResultSet result = ps.executeQuery();
			while(result.next()){
		%>
		<form action="" method="post">
			<div>
				<label>Nombre:</label>
				<input type="text" name="nombre" value="<%= result.getString("nombre_usuario")%>">
			</div>
			<div>
				<label>Email:</label>
				<input type="text" name="email" value="<%= result.getString("email_usuario")%>">
			</div>
			<div>
				<label>Usuario:</label>
				<input type="text" name="usuario" value="<%= result.getString("usuario")%>">
			</div>
			<div>
				<label>Contraseña:</label>
				<input type="password" name="contraseña" value="<%= result.getString("contraseña")%>">
			</div>			
			<div>
				<input type="submit">
			</div>
		</form>
		<%
			}
			String nombre = request.getParameter("nombre");
			String email = request.getParameter("email");
			String usuario = request.getParameter("usuario");
			String contraseña = request.getParameter("contraseña");
			if(nombre != null && email != null && usuario != null && contraseña != null){
				String sql = "UPDATE usuarios set nombre_usuario = '"+nombre+"', email_usuario = '"+email+"', usuario = '"+usuario+"', contraseña = '"+contraseña+"' WHERE cedula_usuario = " + cedula;
				Statement st = conexion.createStatement();
				st.executeUpdate(sql);
				response.sendRedirect("usuarios.jsp");
			}
		%>
</body>
</html>