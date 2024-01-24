<%-- 
    Document   : registrarVenta
    Created on : 16 ene 2024, 15:20:37
    Author     : joelg
--%>

<%@page import="java.util.*"%>
<%@page import="Modelo.*"%>
<%@page session="true"%>
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
        <title>Registrar venta</title>
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
        
        <h2 align="center">Carrito de compras</h2>
        
        
        <div class="venta-form">
    <form method="post" action="ServletControlador">
        <!--Llamamos a la función registrar venta-->
        <input type="hidden" name="accion" value="RegistrarVenta">
        <table class="venta-table">
            <tr>
                <td colspan="5">
                    <input type="hidden" name="txtCliente" value="<%= sesionOK.getAttribute("perfil")!=null ? nom : "" %>" readonly="readonly">
                </td>
            </tr>
            <tr>
                <th width="180">Nombre</th>
                <th>Precio</th>
                <th>Cantidad</th>
                <th>Descuento</th>
                <th>Sub. Total</th>
            </tr>
            <!--Los productos que tenemos en la sesión que se llama a carrito-->
            <%
                double total = 0;
                ArrayList<DetalleVenta> lista = (ArrayList<DetalleVenta>)session.getAttribute("carrito");
                if(lista != null && !lista.isEmpty()){
                    for(DetalleVenta d : lista){
            %>
                        <tr>
                            <td><%= d.getProducto().getNombre()%></td>
                            <td><%= d.getProducto().getPrecio()%></td>
                            <td><%= d.getCantidad()%></td>
                            <td><%= String.format("%.2f",d.getDescuento())%></td>
                            <td><%= String.format("%.2f",(d.getProducto().getPrecio() * d.getCantidad())-d.getDescuento())%></td>
                        </tr>
            <%
                        total = total + (d.getProducto().getPrecio() * d.getCantidad()) - d.getDescuento();
                    }
            %>
                    <tr class="venta-total">
                        <th colspan="4" align="right">Total</th>
                        <th><%= String.format("%.2f",total)%></th>
                    </tr>
                    <tr>
                        <th colspan="5">
                            <input type="submit" value="RegistrarVenta" name="btnVenta" class="venta-submit"/>
                        </th>
                    </tr>
            <%
                } else {
            %>
                    <tr>
                        <th colspan="5">
                            <p>No hay detalles de venta. Agrega productos al carrito antes de registrar la venta.</p>
                        </th>
                    </tr>
            <%
                }
            %>
        </table>
        <input type="hidden" name="total" value="<%= total%>">
    </form>
    <div>
        <h3><a href="index.jsp">Seguir comprando</a> || <a href="ServletLogueo?accion=Cancelar">Cancelar compra</a></h3>
    </div>
</div>
</div>
    </body>

</html>
