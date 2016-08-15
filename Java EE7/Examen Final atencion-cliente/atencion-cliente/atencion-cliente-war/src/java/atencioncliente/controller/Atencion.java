/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package atencioncliente.controller;

import atencioncliente.entity.Cliente;
import atencioncliente.entity.Servicio;
import atencioncliente.service.AtencionService;
import atencioncliente.service.ClienteService;
import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MSI GT70 2PE
 */
public class Atencion extends HttpServlet {

    @EJB
    private AtencionService serviceAtencion;
    private ClienteService serviceUsuerio;
    private final String VISTA_ATENCION="/WEB-INF/jsp/Atencion.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher(VISTA_ATENCION).forward(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Servicio> servicios = serviceAtencion.listaServicios();
        request.setAttribute("servicios", servicios);

        request.getRequestDispatcher(VISTA_ATENCION).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int idServicio = Integer.parseInt(request.getParameter("idServicio"));
            int isRegistred = Integer.parseInt(request.getParameter("isRegistred"));
            String rutUsuario = request.getParameter("rutUsuario");
            Cliente cliente = null;
            
            if (isRegistred>0) {
                cliente = serviceUsuerio.buscarCliente(rutUsuario);
            }
            
            
            
            
            
        } catch (Exception e) {
        }
        
        
        
   
        
        
       // processRequest(request, response);
    }

}
