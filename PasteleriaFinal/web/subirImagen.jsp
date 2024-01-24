<%-- 
    Document   : subirImagen
    Created on : 16 ene 2024, 17:57:44
    Author     : joelg
--%>

<%@page import="java.io.File"%>
<%@page import="java.util.*" %>
<%@page import="org.apache.commons.io.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>


<%
    FileItemFactory file_factory = new DiskFileItemFactory();
    ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
    List items = servlet_up.parseRequest(request);
    String img = "";
    
    for(int i=0;i<items.size();i++){
        FileItem item = (FileItem) items.get(0);
        if(!item.isFormField()){
        File archivo_server=new File("C:\\Users\\joelg\\OneDrive\\Escritorio\\septimo Escom\\redes2\\tareas\\Practica\\PasteleriaFinal\\web\\img\\"+item.getName());
        
        try{
        item.write(archivo_server);
        }catch(Exception e){}
    }
    }
%>

<jsp:forward page="registrarProducto2.jsp">
    <jsp:param name="img" value="<%=img%>"/>
</jsp:forward>
