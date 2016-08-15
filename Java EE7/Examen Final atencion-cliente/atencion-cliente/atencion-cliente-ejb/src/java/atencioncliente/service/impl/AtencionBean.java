/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package atencioncliente.service.impl;

import atencioncliente.entity.Atencion;
import atencioncliente.entity.Cliente;
import atencioncliente.entity.Modulo;
import atencioncliente.entity.Servicio;
import atencioncliente.exception.AtencionClienteException;
import atencioncliente.service.AtencionService;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityExistsException;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author MSI GT70 2PE
 */
@Stateless

public class AtencionBean implements AtencionService {

    @PersistenceContext(unitName = "atencion-cliente-ejbPU")
    private EntityManager em;

    @Override
    public List<Servicio> listaServicios() {
        try {
            List<Servicio> servicios;
            servicios = this.em.createNamedQuery("Servicio.findAll", Servicio.class).getResultList();
            return servicios;
        } catch (Exception e) {
            return null;
        }

    }

    @Override
    public void registarAtencion(Integer _rutClietne, int _idServicio, String _comentario, int _isRegistred, String _nombreCliente) throws AtencionClienteException {
        try {
            Date currentDate = new Date();

            //Verificar que no existan mas atenciones para el mismo servicio dentro del dia
            List<Atencion> atenciones = em.createNamedQuery("Atencion.findByClienteAndMod", Atencion.class)
                    .setParameter("rutCliente", this)
                    .setParameter("idServicio", this)
                    .getResultList();
            if (!atenciones.isEmpty()) {
                Date dteMax = null;
                for (Atencion aten : atenciones) {
                    if (dteMax == null) {
                        dteMax = aten.getFechaCreacion();
                    }
                    if (aten.getFechaCreacion().after(dteMax)) {
                        dteMax = aten.getFechaCreacion();
                    }
                }

                long diff = Math.abs(currentDate.getTime() - dteMax.getTime());
                long diffDays = diff / (24 * 60 * 60 * 1000);
                if (diffDays>1) {
                    throw new AtencionClienteException("No puedes pedir mas de una atencion para el mismo servicio dentro de este día");
                }

            }

            Atencion aten = new Atencion();

            //recuperacion Max id Atencion
            Integer MaxNroAtencion = (Integer) this.em.createNamedQuery("Atencion.findMaxNroAtencion").getSingleResult();
            if (MaxNroAtencion == null) {
                MaxNroAtencion = 1;
            } else {
                MaxNroAtencion++;
            }
            aten.setNroAtencion(MaxNroAtencion);

            //recuperacion de servicio
            Servicio serv = this.em.find(Servicio.class, _idServicio);
            aten.setIdServicio(serv);

            //registro o recuperacion de cliente
            Cliente cli = new Cliente();
            if (_isRegistred == 1) {
                cli = this.em.find(Cliente.class, _rutClietne);
            } else {
                cli.setNombre(_comentario);
                cli.setRut(_rutClietne);
                em.persist(cli);
            }
            aten.setRut(cli);
            aten.setEsCliente(true);

            //Recuperacion de modulo con menor carga
            List<Modulo> modulos = this.em.createNamedQuery("Modulo.findAll", Modulo.class).getResultList();
            if (modulos.isEmpty()) {
                throw new AtencionClienteException("No hay modulos registrados");
            }
            Modulo modulo = null;
            for (Modulo modl : modulos) {
                if (modulo == null) {
                    modulo = modl;
                }
                if (modl.getCargaActual() > modulo.getCargaActual()) {
                    modulo = modl;
                }
            }
            modulo.setCargaActual(modulo.getCargaActual() + 1);
            em.merge(modulo);
            aten.setNroModulo(modulo);

            //tiempo espera
            aten.setTiempoEspera(modulo.getCargaActual() * 5);

            //fecha creacion
            Date date = new Date();
            aten.setFechaCreacion(date);

            //comentario
            if (serv.getSolicitarComentario()) {
                aten.setComentario(_comentario);
            }

        } catch (EntityExistsException e) {
            throw new AtencionClienteException("El usuario ya estaba registrado", e);
        } catch (IllegalArgumentException e) {
            throw new AtencionClienteException("El usuario no esta registrado", e);
        } catch (Exception e) {

        }

    }

}
