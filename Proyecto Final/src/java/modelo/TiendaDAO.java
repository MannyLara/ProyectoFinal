/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Rodolfo Espinoza 1418935
 */
public class TiendaDAO {
    Connection conexion;
    
    private void abrirConexion() throws SQLException{
        String dbURI = "jdbc:derby://localhost:1527//Tienda";
        String username = "rodo";
        String password = "rodo123";
        conexion = DriverManager.getConnection(dbURI, username,password);
    }
    private void cerrarConexion() throws SQLException{
        conexion.close();
    }
    
    public List buscarNombre(ArticuloPOJO POJO){
        ResultSet mensajes;
        List beans = new ArrayList();
        try{
            this.abrirConexion();
            String sql = "select * from ARTICULO where NOMBRE like '%" + POJO.getNombre() + "%'";
            Statement stmt = conexion.createStatement();
            mensajes = stmt.executeQuery(sql);
            
            while(mensajes.next()){
                String nombre = mensajes.getString("NOMBRE");
                int precio = mensajes.getInt("PRECIO");
                String imgpath = mensajes.getString("IMGPATH");
                int stock = mensajes.getInt("STOCK");
                int ID = mensajes.getInt("ID");
                
                ArticuloPOJO cPOJO = new ArticuloPOJO();
                cPOJO.setNombre(nombre);
                cPOJO.setPrecio(precio);
                cPOJO.setImgpath(imgpath);
                cPOJO.setStock(stock);
                cPOJO.setID(ID);
                beans.add(cPOJO);
                
            }
            this.cerrarConexion();
        }
        catch(SQLException e){
        }
        
        return beans;
    }
    public List buscarCategoria(ArticuloPOJO POJO){
        ResultSet mensajes;
        List beans = new ArrayList();
        try{
            this.abrirConexion();
            String sql = "select * from ARTICULO where CATEGORIA = '" + POJO.getCategoria() + "'";
            Statement stmt = conexion.createStatement();
            mensajes = stmt.executeQuery(sql);
            
            while(mensajes.next()){
                String nombre = mensajes.getString("NOMBRE");
                int precio = mensajes.getInt("PRECIO");
                String imgpath = mensajes.getString("IMGPATH");
                int stock = mensajes.getInt("STOCK");
                int ID = mensajes.getInt("ID");
                String categoria = mensajes.getString("CATEGORIA");
                
                ArticuloPOJO cPOJO = new ArticuloPOJO();
                cPOJO.setNombre(nombre);
                cPOJO.setPrecio(precio);
                cPOJO.setImgpath(imgpath);
                cPOJO.setStock(stock);
                cPOJO.setID(ID);
                cPOJO.setCategoria(categoria);
                beans.add(cPOJO);
                
            }
            this.cerrarConexion();
        }
        catch(SQLException e){
        }
        
        return beans;
    }
    
    public ArticuloPOJO buscarArticuloID(ArticuloPOJO POJO){
        ResultSet mensajes;
        ArticuloPOJO cPOJO = new ArticuloPOJO();
        try{
            this.abrirConexion();
            String sql = "select * from ARTICULO where ID = " + POJO.getID();
            Statement stmt = conexion.createStatement();
            mensajes = stmt.executeQuery(sql);
            mensajes.next();
            
            String nombre = mensajes.getString("NOMBRE");
            int precio = mensajes.getInt("PRECIO");
            String imgpath = mensajes.getString("IMGPATH");
            int stock = mensajes.getInt("STOCK");
            int ID = mensajes.getInt("ID");
            String categoria = mensajes.getString("CATEGORIA");
            String descripcion = mensajes.getString("DESCRIPCION");
                
            cPOJO.setNombre(nombre);
            cPOJO.setPrecio(precio);
            cPOJO.setImgpath(imgpath);
            cPOJO.setStock(stock);
            cPOJO.setID(ID);
            cPOJO.setCategoria(categoria);
            cPOJO.setDescripcion(descripcion);
            this.cerrarConexion();
            
        }
        catch(SQLException e){
        }  
        return cPOJO;
    }
    
    public void agregarCarrito(ArticuloPOJO POJO){
        try{
            this.abrirConexion();
            String sql = "UPDATE ARTICULO SET CARRITO = 'SI' WHERE ID = " + POJO.getID();
            Statement stmt = conexion.createStatement();
            stmt.executeUpdate(sql);
            this.cerrarConexion();
            
        }
        catch(SQLException e){
        }  
    }
    
    public List obtenerCarrito(){
        ResultSet mensajes;
        List beans = new ArrayList();
        try{
            this.abrirConexion();
            String sql = "select * from ARTICULO where CARRITO = 'SI'";
            Statement stmt = conexion.createStatement();
            mensajes = stmt.executeQuery(sql);
            
            while(mensajes.next()){
                String nombre = mensajes.getString("NOMBRE");
                int precio = mensajes.getInt("PRECIO");
                String imgpath = mensajes.getString("IMGPATH");
                int stock = mensajes.getInt("STOCK");
                int ID = mensajes.getInt("ID");
                String categoria = mensajes.getString("CATEGORIA");
                int cantidad = mensajes.getInt("CANTIDADCARRITO");
                
                ArticuloPOJO cPOJO = new ArticuloPOJO();
                cPOJO.setNombre(nombre);
                cPOJO.setPrecio(precio);
                cPOJO.setImgpath(imgpath);
                cPOJO.setStock(stock);
                cPOJO.setID(ID);
                cPOJO.setCategoria(categoria);
                cPOJO.setCantidadCarrito(cantidad);
                beans.add(cPOJO);
                
            }
            this.cerrarConexion();
        }
        catch(SQLException e){
        }
        
        return beans;
    }
    
    public void borrarCarrito(ArticuloPOJO POJO){
        try{
            this.abrirConexion();
            String sql = "UPDATE ARTICULO SET CARRITO = 'NO' WHERE ID = " + POJO.getID();
            Statement stmt = conexion.createStatement();
            stmt.executeUpdate(sql);
            this.cerrarConexion();
            
        }
        catch(SQLException e){
        }  
    }
    public void establecerCantidad(ArticuloPOJO POJO,int i){
        try{
            this.abrirConexion();
            String sql = "UPDATE ARTICULO SET CANTIDADCARRITO =" + i + " WHERE ID = " + POJO.getID();
            Statement stmt = conexion.createStatement();
            stmt.executeUpdate(sql);
            this.cerrarConexion();
            
        }
        catch(SQLException e){
        }  
    }
    
    public void borrarTodoCarrito(){
        try{
            this.abrirConexion();
            String sql = "UPDATE ARTICULO SET CARRITO = 'NO'";
            Statement stmt = conexion.createStatement();
            stmt.executeUpdate(sql);
            this.cerrarConexion();
            
        }
        catch(SQLException e){
        } 
    }
}