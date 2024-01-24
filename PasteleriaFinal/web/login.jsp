
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
        <title>Iniciar sesion</title>
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
        
        <div class="login-form">
    <h2>Login de usuarios</h2>
    <form action="ServletLogueo" method="post">
        <input type="hidden" name="accion" value="loguin">
        <table>
            <tr>
                <td>Usuario:</td>
                <td><input type="text" placeholder="Usuario" name="txtUsu"></td>
            </tr>
            <tr>
                <td>Contraseña:</td>
                <td><input type="password" placeholder="Contraseña" name="txtPas"></td>
            </tr>
            <tr>
                <th colspan="2">
                    <input type="submit" name="btn" value="Iniciar Sesión">
                </th>
            </tr>
        </table>
    </form>
    <h4 class="login-msg">
        <% if(request.getAttribute("msg")!=null){ out.println(request.getAttribute("msg")); } %>
    </h4>
</div>
    </body>
</html>
