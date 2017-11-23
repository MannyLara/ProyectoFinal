<%-- 
    Document   : busqueda_resultados
    Created on : 20/11/2017, 04:05:30 PM
    Author     : Rodolfo
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.ArticuloPOJO"%>
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
	<link href="https://fonts.googleapis.com/css?family=Comfortaa" rel="stylesheet">
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
                List articulos = (List) session.getAttribute("articulos");
                if(articulos != null){
        %>
        <h1>Resultados de Busqueda:</h1>
            <%
                    for (Object o : articulos){
                        ArticuloPOJO articulo = (ArticuloPOJO) o;
            %>
            <section style="padding-left: 50px">
            <label style="font-size:30px"><%=articulo.getNombre()%></label><br>
            Precio: $<%=articulo.getPrecio()%><br>
            Stock: <%=articulo.getStock()%><br>
            <!-- BOTON DE VER DETALLES-->
            <form action="TiendaControlador" method="post">
                <input type="submit" value="Ver Detalles">
                <input type="hidden" name="accion" value="detalles">
                <input type="hidden" name="IDDetalles" value="<%=articulo.getID()%>">
            </form>
            <img src="<%=articulo.getImgpath()%>" height="300" width="300"><br>
            <!-- BOTON DE VER AGREGAR A CARRITO-->
            <form action="TiendaControlador" method="post">
                <input type="submit" value="Agregar al carrito">
                Cantidad: <input type="text" name="campoCantidad" value="1" size="1"><input type="hidden" name="accion" value="ACarrito">
                <input type="hidden" name="IDCarrito" value="<%=articulo.getID()%>">
            </form>
            </section>
            -------------------------------------------------------------------------------
                    <%}%>
       
                 <%}
                    else{
                 %>
                    No se encontraron resultados.
                 <%}%>
            
        
    </body>
</html>
