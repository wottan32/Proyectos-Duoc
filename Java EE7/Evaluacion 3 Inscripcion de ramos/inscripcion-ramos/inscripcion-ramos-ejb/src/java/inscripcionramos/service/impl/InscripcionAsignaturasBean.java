/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package inscripcionramos.service.impl;

import inscripcionramos.entity.Alumno;
import inscripcionramos.entity.Asignatura;
import inscripcionramos.entity.Seccion;
import inscripcionramos.entity.exception.inscripcionRamosException;
//import inscripcionramos.entity.SeccionesXAlumno;
import inscripcionramos.service.InscripcionAsignaturasService;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author MSI GT70 2PE
 */
@Stateless
public class InscripcionAsignaturasBean implements InscripcionAsignaturasService {

    @PersistenceContext(unitName = "inscripcionramosPU")
    private EntityManager em;

    @Override
    public List<Asignatura> listarAsignaturas() {
        List<Asignatura> listado;
        listado = this.em.createNamedQuery("Asignatura.listarTodas", Asignatura.class).getResultList();
        return listado;
    }

    @Override
    public List<Seccion> SeccionesXAsignaturas(Long idAsignatura) {
        try {
            List<Seccion> listado;
            listado = this.em.createNamedQuery("Seccion.listarPorAsignatura", Seccion.class)
                    .setParameter("idAsignatura", idAsignatura)
                    .getResultList();
            return listado;
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public void inscribirAsignatura(Long idAlumno, Long idSeccion, Long idAsinatura) throws inscripcionRamosException {
        Alumno alumno = this.em.find(Alumno.class, idAlumno);
        Seccion seccion = this.em.find(Seccion.class, idSeccion);

        List<Seccion> seccionesAlumno = alumno.getSecciones();

        if (seccionesAlumno.contains(seccion)) {
            throw new inscripcionRamosException("el alumno ya esta inscrito en la seccion");
        } else {
            
            for(Seccion s:seccionesAlumno) {
                if(s.getAsignatura().equals(seccion.getAsignatura())) {
                    throw new inscripcionRamosException("el alumno ya tiene una seccion registrada para esta asignatura");
                }
            }
            
            seccionesAlumno.add(seccion);
        
            this.em.merge(alumno);
            this.em.flush();
            this.em.clear();
        }

    }

}
