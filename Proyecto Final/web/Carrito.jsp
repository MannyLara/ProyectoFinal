<%-- 
    Document   : Carrito
    Created on : 20/11/2017, 05:26:44 PM
    Author     : Rodolfo
--%>
<%@page import="java.util.List"%>
<%@page import="modelo.ArticuloPOJO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
function mensajeCompra() {
    alert("¡Su compra ha sido procesada exitosamente!");
}
</script>
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
            <input align="center" type="submit" value="Buscar" name="campoBusqueda2">
            <input type="hidden" name="accion" value="buscar">
            </p>
        </form>
        <img src="Imagenes/carrito.png" height="40" width="40"><label style="font-size:50px">Carrito</label> <img src="Imagenes/carrito.png" height="40" width="40">
        <section style="padding-left: 50px">
        <%
                List articulos = (List) session.getAttribute("carrito");
                int totalPrecio = 0;
                int subTotal = 0;
                if(articulos != null){
        %>
            <%
                    for (Object o : articulos){
                        ArticuloPOJO articulo = (ArticuloPOJO) o;
                        subTotal = articulo.getPrecio() * articulo.getCantidadCarrito();
                        totalPrecio = totalPrecio + subTotal;
            %>
            -------------------------------------------------------------------------------<br>
            <img src="<%=articulo.getImgpath()%>" height="70" width="70">
            <label style="font-size:23px"><%=articulo.getNombre()%></label>
            <label>Cantidad: <%=articulo.getCantidadCarrito()%></label>
            <label>Sub total : $<%=subTotal%></label>
            <form action="TiendaControlador" method="post">
                <input type="submit" value="Ver Detalles">
                <input type="hidden" name="accion" value="detalles">
                <input type="hidden" name="IDDetalles" value="<%=articulo.getID()%>">
            </form>
            <form action="TiendaControlador" method="post">
                <input type="submit" value="Eliminar del Carrito">
                <input type="hidden" name="accion" value="removerCarrito">
                <input type="hidden" name="IDRemover" value="<%=articulo.getID()%>">
            </form>
                    <%}%>
                <%}%>
                <br><br>
                
                
            <% if (totalPrecio != 0){%>
            ---------------------------------------------------------------------------------------------<br>
            <label style="font-size:32px">Precio Total: $<%=totalPrecio%></label>
            <form action="TiendaControlador" method="post">
                <input type="submit" value="ACEPTAR COMPRA" onclick="mensajeCompra()">
                <input type="hidden" name="accion" value="compra">
            </form>
            <%}%>
        </section>
    </body>
</html>
