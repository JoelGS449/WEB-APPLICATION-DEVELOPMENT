<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.*"%>

<%@page session="true" %>

<%
    String usu = "";
    String nom = "";
    HttpSession sesionOK = request.getSession();

    if (sesionOK.getAttribute("perfil") != null) {
        nom = (String) sesionOK.getAttribute("nom") + " " + (String) sesionOK.getAttribute("ape");
    }
%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Pasteleria</title>
    <link rel="stylesheet" href="css/estilos.css">
</head>

<body>
    <table border="0" width="1000" align="center" class="header-table">
        <tr>
            <th><a href="index.jsp">Pasteles</a></th>
            <% if (sesionOK.getAttribute("perfil") != null && sesionOK.getAttribute("perfil").equals("Admin")) { %>
                <th><a href="registrarProducto.jsp">Registrar Pastel</a></th>
            <% } %>
            <% if (sesionOK.getAttribute("perfil") != null) { %>
                <th><a href="registrarVenta.jsp">Registrar Ventas</a></th>
            <% } %>
            <% if (sesionOK.getAttribute("perfil") != null && sesionOK.getAttribute("perfil").equals("Admin")) { %>
                <th><a href="ServletControlador?accion=MostrarVentas">Consultar Ventas</a></th>
            <% } %>
            <% if (sesionOK.getAttribute("perfil") != null) { %>
                <th><a href="ServletLogueo?accion=cerrar">Cerrar sesión</a></th>
                <th width="200"><%= "Bienvenido: " + nom %></th>
            <% } %>
            <% if (sesionOK.getAttribute("perfil") == null) { %>
                <th width="200"><a href="login.jsp">Iniciar sesión</a></th>
            <% } %>
        </tr>
    </table>

    <h2 align="center">Catálogo de Pasteles</h2>

    <div class="product-container">
        <%
            ArrayList<Producto> Lista = ProductoDB.obtnerProducto();
            int salto = 0;
            for (Producto p : Lista) {
        %>
            <div class="product">
                <img src="img/<%=p.getImagen()%>" alt="<%=p.getNombre()%>">
                <p class="product-name"><%=p.getNombre()%></p>
                <p class="product-price"><%=p.getPrecio()%></p>
                <%
                    if (sesionOK.getAttribute("perfil") != null && sesionOK.getAttribute("perfil").equals("Admin")) {
                %>
                    <a href="actualizarProducto.jsp?id=<%=p.getCodigoProducto()%>" class="btn-modify">Modificar</a>
                <%
                    }
                %>
                <a href="anadirCarrito.jsp?id=<%=p.getCodigoProducto()%>" class="btn-add">Añadir</a>
            </div>
        <%
            salto++;
            if (salto == 3) {
        %>
            <div style="clear:both;"></div>
        <%
                salto = 0;
            }
        }
        %>
    </div>
</body>

</html>