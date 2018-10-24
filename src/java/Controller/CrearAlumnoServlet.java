/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Alumno;
import Model.Ciudad;
import Model.DAO.DAO_Alumno;
import Model.DAO.DAO_Ciudad;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author maranda
 */
@WebServlet(name = "CrearServlet", urlPatterns = {"/crearAlumno.do"})
public class CrearAlumnoServlet extends HttpServlet {

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
        try {
            //response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");

            Alumno a = new Alumno();
            String nombre = request.getParameter("nombre");
            String genero = request.getParameter("rbtGenero");
            
            /*
            try (PrintWriter out = response.getWriter()) {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet NewServlet</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Genero es " + genero + "</h1>");
                out.println("</body>");
                out.println("</html>");
            }
            */
            
            Boolean generoAIngresar = true;
            if (genero.equals("Masculino")) {
                generoAIngresar = true;

            } else if (genero.equals("Femenino")) {
                generoAIngresar = false;

            }
            String telefono = request.getParameter("telefono");
            String correo = request.getParameter("correo");
            String ciudad = request.getParameter("cboCiudad");

            DAO_Ciudad dc = new DAO_Ciudad();
            DAO_Alumno da = new DAO_Alumno();
            Ciudad ciudadAIngresar = dc.getCiudadPorNombre(ciudad);

            a.setNombre(nombre);
            a.setEsHombre(generoAIngresar);
            a.setTelefono(telefono);
            a.setCorreo(correo);
            a.setCiu(ciudadAIngresar);

            da.create(a);

            response.sendRedirect("index.jsp");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CrearAlumnoServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CrearAlumnoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
