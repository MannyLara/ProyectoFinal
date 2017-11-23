<%-- 
    Document   : Categorias
    Created on : 20/11/2017, 05:26:38 PM
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
        </form >
        <section style="padding-left: 50px">
        <h1 style="font-size:38px">Busqueda por Categorias</h1>
        <form action="TiendaControlador" method="post">
            <select name="opcion">
                <option>-- Seleccione una categoria --</option>
                <option value="Celulares">Celulares</option>
                <option value="Impresoras">Impresoras</option>
                <option value="Laptops">Laptops</option>
                <option value="Teclados">Teclados</option>
            </select>
            <input align="center" type="submit" value="Mostrar">
            <input type="hidden" name="accion" value="selector">
        </form>
        <%
                List articulosCategoria = (List) session.getAttribute("categorias");
                if(articulosCategoria != null){
        %>
        
        <h1 style="font-size:50px"><%=session.getAttribute("TituloCategoria")%></h1>
            <%
                    for (Object o : articulosCategoria){
                        ArticuloPOJO articulo = (ArticuloPOJO) o;
            %>
            -------------------------------------------------------------------------------<br>
            <label style="font-size:30px"><%=articulo.getNombre()%></label><br>
            Precio: $<%=articulo.getPrecio()%><br>
            Stock: <%=articulo.getStock()%><br>
            <form action="TiendaControlador" method="post">
                <input type="submit" value="Ver Detalles">
                <input type="hidden" name="accion" value="detalles">
                <input type="hidden" name="IDDetalles" value="<%=articulo.getID()%>">
            </form>
            <img src="<%=articulo.getImgpath()%>" height="300" width="300"><br>
            <form action="TiendaControlador" method="post">
                Cantidad: <input type="text" name="campoCantidad" value="1" size="1"><input type="submit" value="Agregar al carrito">
                <input type="hidden" name="accion" value="ACarrito">
                <input type="hidden" name="IDCarrito" value="<%=articulo.getID()%>">
            </form>
            
                    <%}%>
                 <%}%>
                 <%session.setAttribute("categorias",null);%>
        </section>
    </body>
</html>
