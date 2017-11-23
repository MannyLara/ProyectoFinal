<%-- 
    Document   : DetallesArticulo
    Created on : 20/11/2017, 08:16:37 PM
    Author     : Rodolfo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.ArticuloPOJO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Tienda de electronica Online</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="utf-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="Style.css"/> 
        <link href="https://fonts.googleapis.com/css?family=Comfortaa:300,400,700" rel="stylesheet">
    </head>
    <body style="background-color:#B4CBD9;">
        <h1 align="center" style="font-size:42px">Tienda de electronica Online!</h1>
        <ul id= "button">
 <li><a href=index.html>Inicio</a></li>
 <li><a href=Categorias.jsp>Buscar por categoria</a></li>
 <li><a href=Carrito.jsp>Ver carrito</a></li>
 </ul>
        <form action="TiendaControlador" method="post">
            <p align="center">
                <label>¿Que estas buscando?</label> <input type="text" name="campoBuscar" size="35">
            <input align="center" type="submit" value="Buscar">
            <input type="hidden" name="accion" value="buscar">
            </p>
        </form>
        
        <%
                ArticuloPOJO articulo = (ArticuloPOJO) session.getAttribute("detalles");
                
                if(articulo != null){
        %>
            <p style="padding-left: 50px">
                <label style="font-size:50px"><%=articulo.getNombre()%></label><br><br>
                Precio:$<%=articulo.getPrecio()%><br><br>
                Cantidad en stock: <%=articulo.getStock()%><br>
                <img src="<%=articulo.getImgpath()%>" height="500" width="500"><br>
                Descripcion<br>
                <label style="font-size:24px"><%=articulo.getDescripcion()%></label><br>
            </p>
                    <%}%>
</html>
