/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package inscripcionramos.controller;

import inscripcionramos.entity.Seccion;
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
public class ListadoSecciones extends HttpServlet {

    private final String VISTA_LISTAR_ASIGNATURAS = "/WEB-INF/vista/privado/asignaturas.jsp";
    private final String VISTA_LISTAR_SECCIONES = "/WEB-INF/vista/privado/secciones.jsp";

    @EJB
    private InscripcionAsignaturasService service;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.procesarVistaListarSecciones(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private void procesarVistaListarSecciones(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        long idAsignatura = 0L;

        try {
            idAsignatura = Long.parseLong(request.getParameter("id"));
            List<Seccion> secciones = this.service.SeccionesXAsignaturas(idAsignatura);

            HttpSession session = request.getSession();
            session.removeAttribute("mensajeExito");
            /* Long countListSecc = (Long) session.getAttribute("errorSeccion");
             if (countListSecc == null) {
             countListSecc = 0L;
             } else if (countListSecc < 1) {
             countListSecc++;
             } else {
             countListSecc = 0L;
             session.removeAttribute("errorSeccion");
             }
             session.setAttribute("coutListAsig", countListSecc);*/

            if (secciones.size() > 0) {
                //session.removeAttribute("mensajesdeerrores");
                request.setAttribute("secciones", secciones);
                request.setAttribute("idAsignatura", idAsignatura);
                request.getRequestDispatcher(VISTA_LISTAR_SECCIONES).forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/privado/ListarAsignaturas");
                //HttpSession mensajeerror = request.getSession();
                //mensajeerror.setAttribute("mensajesdeerrores", "Esta asignatura no contiene secciones");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/privado/ListarAsignaturas");
            HttpSession mensajeerror = request.getSession();
            mensajeerror.setAttribute("mensajesdeerrores", "Id de asignatura inválida");
            //  request.getRequestDispatcher(VISTA_LISTAR_ASIGNATURAS).forward(request, response);
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/privado/ListarAsignaturas");
            // request.setAttribute("error", "Error inesperado : "+e);
            // request.getRequestDispatcher(VISTA_LISTAR_ASIGNATURAS).forward(request, response);
        }

    }

}
