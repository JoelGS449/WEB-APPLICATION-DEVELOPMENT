<%-- 
    Document   : FormularioPago
    Created on : 16 ene 2024, 20:38:19
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
        <title>Formulario Pago</title>
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
        
        <h1 align="center">
            <%
            double total=Double.parseDouble(request.getParameter("total"));
            out.println("Total a pagar: "+total+"<p>");
            %>
        </h1>
        
        <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
            <input type="hidden" name="cmd" value="_ext-enter" />
            <input type="hidden" name="redirect_cmd" value="_xclick" />
            <input type="hidden" name="business" value="joelgurrolas@gmail.com" />
            <input type="hidden" name="item_name" value="Productos varios" />
            <input type="hidden" name="quantity" value="1" />
            <input type="hidden" name="amount" value="<%=total%>" />
            <input type="hidden" name="currency_code" value="USD" />
            <input type="hidden" name="return" value="http://localhost:8081/PasteleriaFinal/index.jsp" />
            <input type="hidden" name="currency_code" value="USD" />
            <input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHostedGuest" />
            <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" title="PayPal - The safer, easier way to pay online!" alt="Buy Now" />
        </form>
        
    </body>
</html>


