<%-- 
    Document   : anadirCarrito
    Created on : 16 ene 2024, 08:45:23
    Author     : joelg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.*"%>

<%@page session="true" %>

<%
    String usu="";
    String nom="";
    HttpSession sesionOK=request.getSession();
    
    if(sesionOK.getAttribute("perfil")!=null){
        nom=(String)sesionOK.getAttribute("nom")+" "+(String)sesionOK.getAttribute("ape");
    }
    
    if(sesionOK.getAttribute("perfil")==null){
%>
<jsp:forward page="login.jsp"/>
<%
    }else{
usu=(String)sesionOK.getAttribute("perfil");
}
%>
<!DOCTYPE html>

<%
    Producto p=ProductoDB.obtenerProducto(Integer.parseInt(request.getParameter("id")));
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrito</title>
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
        
        <h2 align="center">Añadir producto al carrito</h2>
        
        <div style="text-align: center; background-color: #94d3f0; width: 700px; padding: 20px; border-radius: 10px; margin: 0 auto 50px; margin-top: 50px;"> 
    <table border="0" width="500" align="center">
        <form method="post" action="ServletControlador" onsubmit="return validarCantidad()">
            <tr>
                <th rowspan="5"><img src="img/<%=p.getImagen()%>" width="140" height="140"></th>
                <th>Codigo</th>
                <th><input type="text" name="txtCodigo" value="<%= p.getCodigoProducto()%>" readonly></th>
            <tr></tr>
                <th>Nombre</th>
                <th><input type="text" name="txtNombre" value="<%= p.getNombre()%>" readonly></th>
            <tr></tr>
                <th>Precio</th>
                <th><input type="text" name="txtPrecio" value="<%= p.getPrecio()%>" readonly></th>
            <tr></tr>
                <th>Cantidad</th>
                <th><input type="number" value="1" min="1" name="txtCantidad" id="txtCantidad"></th>
            </tr>
            <tr>
                <th colspan="3">
                    <input type="submit" value="Añadir" name="btnAnadir">
                </th>
            <input type="hidden" name="accion" value="AnadirCarrito">
            </tr>
        </form>
    </table>
</div>

  
</body>
<script>
    function validarCantidad() {
        var cantidad = document.getElementById("txtCantidad").value;
        if (cantidad < 1) {
            alert("La cantidad debe ser al menos 1.");
            return false;
        }
        return true;
    }
</script>
</html>
