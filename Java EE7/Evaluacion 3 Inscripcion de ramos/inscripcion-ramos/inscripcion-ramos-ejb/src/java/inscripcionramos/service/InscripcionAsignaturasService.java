/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package inscripcionramos.service;

import inscripcionramos.entity.Asignatura;
import inscripcionramos.entity.Seccion;
import inscripcionramos.entity.exception.inscripcionRamosException;
import java.util.List;

/**
 *
 * @author MSI GT70 2PE
 */

public interface InscripcionAsignaturasService {
        public List<Asignatura> listarAsignaturas();
        public List<Seccion> SeccionesXAsignaturas(Long idAsignatura);
        public void inscribirAsignatura (Long idAlumno, Long idSeccion, Long idAsinatura) throws inscripcionRamosException;
}
