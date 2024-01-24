<%-- 
    Document   : consultarVentas
    Created on : 16 ene 2024, 21:50:06
    Author     : joelg
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.*,java.util.*" %>

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
        <title>Ventas</title>
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
        <div class="consultar-ventas">
    <h2>Consultar Ventas</h2>
    <table class="ventas-table">
        <tr>
            <th>Código</th>
            <th>Cliente</th>
            <th>Fecha</th>
            <th>Acción</th>
        </tr>
        <%
        ArrayList<Venta> lista = (ArrayList<Venta>)request.getAttribute("lista");
        for(Venta v : lista){
        %>
        <tr>
            <td><%= v.getCodigoVenta()%></td>
            <td><%= v.getCliente()%></td>
            <td><%= v.getFecha()%></td>
            <th><a href="obtenerDetalleVenta.jsp?cod=<%= v.getCodigoVenta()%>" target="detalle">Ver detalle</a></th>
        </tr>
        <%
            }
        %>
    </table>
    <div class="detalle-frame">
        <iframe name="detalle" width="630" height="300" frameborder="0"></iframe>
    </div>
</div>
        
    </body>
</html>
