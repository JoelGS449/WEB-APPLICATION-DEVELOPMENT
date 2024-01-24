<%-- 
    Document   : registrarProducto
    Created on : 16 ene 2024, 17:48:46
    Author     : joelg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%
    String usu="";
    String nom="";
    HttpSession sesionOK=request.getSession();
    
    if(sesionOK.getAttribute("perfil")!=null){
        nom=(String)sesionOK.getAttribute("nom")+" "+(String)sesionOK.getAttribute("ape");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Producto</title>
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
        
        <h2 align="center">Cargar imagen</h2>
        
        
<div class="imagen-table">
    <form action="subirImagen.jsp" enctype="multipart/form-data" method="post">
        <table border="0" width="100%">
            <tr >
                <th>Imagen</th>
                <th><input type="file" name="file"/></th>
            </tr>
            <tr>
                <th colspan="2">
                    <input type="submit" value="Registrar" name="CargarImagen"/>
                </th>
            </tr>
        </table>
    </form>
</div>
    </body>
</html>
