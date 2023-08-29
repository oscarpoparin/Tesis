<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if(session.getAttribute("profesor") != null){
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Bienvenido ${profesor.nombre}
            <small>, ${profesor.rol.descripcion}</small>
        <h1>
        <a href="srvUsuario?accion=cerrar">Cerrar sesion</a>
    </body>
</html>
<%
    }else{
        response.sendRedirect("login.jsp");
    }
%>