/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BancoAmigo.servlet;

import BancoAmigo.user.User;
import java.io.IOException;
import java.util.List;
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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String user = request.getParameter("usuario");
        String pass = request.getParameter("clave");

        List<User> users = (List<User>) request.getServletContext().getAttribute("usuarios");//maall 3:40

        if (users == null) {
            request.setAttribute("error", "usuario no registrado");
            request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
        } else {
            User usr = new User();
            usr.setUsuario(user);
            int i = users.indexOf(usr);
            if (i >= 0) {
                usr = (User) users.get(i);
                if (usr.getUsuario().equals(user) && usr.getClave().equals(pass)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("autenticado", true);
                    session.setAttribute("NombreUsuiario", usr.getNombre());
                    response.sendRedirect(request.getContextPath() + "/private");
                } else {
                    request.setAttribute("error", "Usuario o clave incorrecta");
                    request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
                }

            }

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);

    }

}
