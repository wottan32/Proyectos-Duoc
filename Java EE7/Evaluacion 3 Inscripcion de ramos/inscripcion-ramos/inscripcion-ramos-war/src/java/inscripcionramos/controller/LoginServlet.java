/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package inscripcionramos.controller;

import inscripcionramos.service.UsuarioService;
import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author MSI GT70 2PE
 */
public class LoginServlet extends HttpServlet {

    @EJB
    private UsuarioService service;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/vista/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page;
        String login = request.getParameter("login");
        String password = request.getParameter("password");

        try {

            if (this.service.isAutenticacionValida(login, password)) {
                HttpSession session = request.getSession();
                session.setAttribute("autenticado", login);
                Long id = this.service.returnCurrentUserID(login, password);
                session.setAttribute("idUsuario", id);
                page = "/privado/ListarAsignaturas";
            } else {
                HttpSession mensajeerror = request.getSession();
                mensajeerror.setAttribute("mensajesdeerrores", "Usuario o contraseña incorrecta");
                page = "/login";
            }

        } catch (Exception e) {
            HttpSession mensajeerror = request.getSession();
            mensajeerror.setAttribute("mensajesdeerrores", "Problema al intentar realizar el login: "+e.getMessage());
            page = "/login";
        }

        RequestDispatcher rd = request.getRequestDispatcher(response.encodeURL(page));
        response.sendRedirect(request.getContextPath() + page);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if ("Logout".equals(accion)) {
            this.logout(request, response);
        } else {
            HttpSession session = request.getSession();
            if (session.getAttribute("autenticado") != null) {
                response.sendRedirect(request.getContextPath() + "/privado/ListarAsignaturas");
            } else {
                processRequest(request, response);
                
                //Eliminamos la variable de session ya que en un get no deberia volver a aparecer.
                HttpSession mensajeerror = request.getSession();
                mensajeerror.removeAttribute("mensajesdeerrores");
            }
        }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        processRequest(request, response);
    }

}
