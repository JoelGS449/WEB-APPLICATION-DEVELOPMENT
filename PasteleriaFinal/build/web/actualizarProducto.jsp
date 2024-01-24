<%-- 
    Document   : actualizarProducto
    Created on : 16 ene 2024, 16:47:46
    Author     : joelg
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.*"%>
<%@page session="true"%>

<%
    String usu="";
    String nom="";
    HttpSession sesionOK=request.getSession();
    
    if(sesionOK.getAttribute("perfil")!=null){
        nom=(String)sesionOK.getAttribute("nom")+" "+(String)sesionOK.getAttribute("ape");
    }
%>

<%
    Producto p=ProductoDB.obtenerProducto(Integer.parseInt(request.getParameter("id")));
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Producto</title>
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
        
<div style="text-align: center; background-color: #94d3f0; width: 400px; padding: 20px; border-radius: 10px; margin: 0 auto 50px; margin-top: 50px;">   <h2 style="color: white;">Actualizar Pasteles</h2>

    <form method="post" action="ServletControlador" style="width: 400px; margin: 0 auto;">
        <table border="0" width="100%">
            <tr>
                <td style="text-align: right; color: white;">Código: </td>
                <td><input type="text" name="txtCodigo" value="<%= p.getCodigoProducto()%>" readonly></td>
            </tr>
            <tr>
                <td style="text-align: right; color: white;">Nombre: </td>
                <td><input type="text" name="txtNombre" value="<%= p.getNombre()%>"></td>
            </tr>
            <tr>
                <td style="text-align: right; color: white;">Precio: </td>
                <td><input type="text" name="txtPrecio" value="<%= p.getPrecio()%>"></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <input type="submit" value="Actualizar" name="btnActualizar" style="width: 100%; background-color: #F0A2F8; color: white; padding: 10px; border: none; border-radius: 5px; cursor: pointer;">
                </td>
                <input type="hidden" name="accion" value="ModificarProducto">
            </tr>
        </table>
    </form>
</div>
    </body>
</html>