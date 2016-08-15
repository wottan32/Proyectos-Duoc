/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package inscripcionramos.controller;

import inscripcionramos.entity.Asignatura;
import inscripcionramos.service.InscripcionAsignaturasService;
import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author MSI GT70 2PE
 */
public class ListarAsignaturas extends HttpServlet {

    @EJB
    private InscripcionAsignaturasService service;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Asignatura> listado = this.service.listarAsignaturas();

        request.setAttribute("asignaturas", listado);

       /* HttpSession session = request.getSession();
        Long countListAsig = (Long) session.getAttribute("coutListAsig");
        if (countListAsig == null) {
            countListAsig = 0L;
        } else if (countListAsig < 1) {
            countListAsig++;
        } else {
            countListAsig = 0L;
            session.removeAttribute("mensajeExito");
        }
        session.setAttribute("coutListAsig", countListAsig);*/
        HttpSession mensajeerror = request.getSession();
        mensajeerror.removeAttribute("errorSeccion");
        request.getRequestDispatcher("/WEB-INF/vista/privado/asignaturas.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
