/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BancoAmigo.servlet;

import BancoAmigo.user.User;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MSI GT70 2PE
 */
public class RegisterServlet extends HttpServlet {

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

        

        String user = request.getParameter("usuario");
        String pass = request.getParameter("clave");
        String name = request.getParameter("nombre");
        String lastname = request.getParameter("apellido");
        String email = request.getParameter("email");

        if (user != null && pass != null) {
            User usr = new User();

            usr.setApellido(lastname);
            usr.setClave(pass);
            usr.setEmail(email);
            usr.setNombre(name);
            usr.setUsuario(user);

            ServletContext ApplicationContext = request.getServletContext();
            List<User> users = (List<User>) ApplicationContext.getAttribute("usuarios");

            if (users == null) {
                users = new ArrayList();
            }

            if (!users.contains(usr)) {
                users.add(usr);
                ApplicationContext.setAttribute("usuarios", users);
                request.setAttribute("exito", "El usuario ha sido registrado");

            } else {
                request.setAttribute("error", "usuario ya existe");
            }
        }
        else{
            request.setAttribute("error", "Faltan campos obligatorios");
        }
        request.getRequestDispatcher("/WEB-INF/jsp/register.jsp").forward(request, response);

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
