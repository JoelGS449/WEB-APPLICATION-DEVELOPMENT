<%-- 
    Document   : obtenerDetalleVenta
    Created on : 16 ene 2024, 23:16:11
    Author     : joelg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.*, java.util.*" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle de la venta</title>
        <link rel="stylesheet" href="css/estilos.css">
    </head>
    <body>
        
        
        <table border="1" width="600" align="center">
            <tr bgcolor="skyblue">
                <th>CodPro</th>
                <th>Cantidad</th>
                <th>Descuento</th>
            </tr>
            <%
                ArrayList<DetalleVenta> lista = DetalleVentaDB.obtenerDetalleVenta(Integer.parseInt(request.getParameter("cod")));
                for (int i = 0; i < lista.size(); i++) {
                DetalleVenta d=lista.get(i);
            %>
            <tr>
                <td><%=d.getCodigoProducto()%></td>
                <td><%=d.getCantidad()%></td>
                <td><%=d.getDescuento()%></td>
            </tr>
            <%
                }
            %>
        </table>
        
    </body>
</html>
