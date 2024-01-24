<%-- 
    Document   : mensaje
    Created on : 16 ene 2024, 17:41:02
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
        <title>Mensajes</title>
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
        <h2 align="center">
            <%
                if(request.getParameter("men")!=null){
                 out.println(request.getParameter("men"));
                }
            %>
        </h2>
        <h3 align="center">
            <a href="index.jsp">Volver a la pagina principal</a>
        </h3>
    </body>
</html>
