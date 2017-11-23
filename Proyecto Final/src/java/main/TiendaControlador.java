/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.ArticuloPOJO;
import modelo.TiendaDAO;

/**
 *
 * @author Guillermina
 */
public class TiendaControlador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        
        if(accion.equals("buscar")){
            
            ArticuloPOJO POJO = new ArticuloPOJO();
            TiendaDAO DAO = new TiendaDAO();
            
            String nombre = request.getParameter("campoBuscar");
            
            POJO.setNombre(nombre);
            
            List lista = DAO.buscarNombre(POJO);
            HttpSession session = request.getSession();
            session.setAttribute("articulos",lista);
            response.sendRedirect("busqueda_resultados.jsp");
        }
        if(accion.equals("selector")){
            ArticuloPOJO POJO = new ArticuloPOJO();
            TiendaDAO DAO = new TiendaDAO();
            
            String categoria = request.getParameter("opcion");
            
            POJO.setCategoria(categoria);
            
            List lista = DAO.buscarCategoria(POJO);
            HttpSession session = request.getSession();
            session.setAttribute("categorias",lista);
            if(categoria.equals("-- Seleccione una categoria --")){
                session.setAttribute("TituloCategoria", "");
            }else{
                session.setAttribute("TituloCategoria", categoria);
            }
            response.sendRedirect("Categorias.jsp");
            
        }
        if(accion.equals("detalles")){
            
            ArticuloPOJO POJO = new ArticuloPOJO();
            TiendaDAO DAO = new TiendaDAO();
            
            int id = Integer.parseInt(request.getParameter("IDDetalles"));
            
            POJO.setID(id);
            
            ArticuloPOJO cPOJO = DAO.buscarArticuloID(POJO);
            HttpSession session = request.getSession();
            session.setAttribute("detalles",cPOJO);
            response.sendRedirect("DetallesArticulo.jsp");
        }
        
        if(accion.equals("ACarrito")){
            
            ArticuloPOJO POJO = new ArticuloPOJO();
            TiendaDAO DAO = new TiendaDAO();
            
            int id = Integer.parseInt(request.getParameter("IDCarrito"));
            int cantidad = Integer.parseInt(request.getParameter("campoCantidad"));
            
            POJO.setID(id);
            
            DAO.agregarCarrito(POJO);
            DAO.establecerCantidad(POJO, cantidad);
            List lista = DAO.obtenerCarrito();
            HttpSession session = request.getSession();
            session.setAttribute("carrito",lista);
            response.sendRedirect("Carrito.jsp");
        }
        
        if(accion.equals("removerCarrito")){
            
            ArticuloPOJO POJO = new ArticuloPOJO();
            TiendaDAO DAO = new TiendaDAO();
            
            int id = Integer.parseInt(request.getParameter("IDRemover"));
            
            POJO.setID(id);
            
            DAO.borrarCarrito(POJO);
            List lista = DAO.obtenerCarrito();
            HttpSession session = request.getSession();
            session.setAttribute("carrito",lista);
            response.sendRedirect("Carrito.jsp");
        }
        
        if(accion.equals("compra")){
            
            TiendaDAO DAO = new TiendaDAO();
            
            DAO.borrarTodoCarrito();
            List lista = DAO.obtenerCarrito();
            HttpSession session = request.getSession();
            session.setAttribute("carrito",lista);
            response.sendRedirect("Carrito.jsp");
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
