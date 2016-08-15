/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package inscripcionramos.controller;

import inscripcionramos.entity.exception.inscripcionRamosException;
//import inscripcionramos.entity.SeccionesXAlumno;
import inscripcionramos.service.InscripcionAsignaturasService;
import java.io.IOException;

import java.util.logging.Level;
import java.util.logging.Logger;
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
public class InscripcionAsignatura extends HttpServlet {

    private final String URL_LISTAR_ASIGNATURAS = "/privado/ListarAsignaturas";
    private final String URL_LISTAR_SECCIONES = "/privado/ListadoSecciones";

    private static final Logger LOG = Logger.getLogger(InscripcionAsignatura.class.getName());
    @EJB
    private InscripcionAsignaturasService service;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
    /*@Override
     protected void doGet(HttpServletRequest request, HttpServletResponse response)
     throws ServletException, IOException {
     processRequest(request, response);
     }*/     
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

      Long idAsignatura = -1L;
        try {

            idAsignatura = Long.parseLong(request.getParameter("idAsignatura"));
            Long idAlumno = Long.parseLong(request.getParameter("idAlumno"));
            Long idSeccion = Long.parseLong(request.getParameter("idSeccion"));

            this.service.inscribirAsignatura(idAlumno, idSeccion, idAsignatura);
            session.setAttribute("mensajeExito", "Asignatura Inscrita Exitosamente");
            session.removeAttribute("errorSeccion");
            response.sendRedirect(request.getContextPath() + URL_LISTAR_ASIGNATURAS);

        } catch (inscripcionRamosException e) {
            LOG.log(Level.SEVERE, "No se pudo inscribir la asignatura", e);       
            session.setAttribute("errorSeccion", e.getMessage());
            response.sendRedirect(request.getContextPath() + URL_LISTAR_SECCIONES+"?accion=listarSecciones&id="+idAsignatura);
        } catch (NumberFormatException ex) {      
            session.setAttribute("errorSeccion", "No selecciono ninguna seccion"); 
            response.sendRedirect(request.getContextPath() + URL_LISTAR_SECCIONES+"?accion=listarSecciones&id="+idAsignatura);

        }

        //processRequest(request, response);
    }

}
