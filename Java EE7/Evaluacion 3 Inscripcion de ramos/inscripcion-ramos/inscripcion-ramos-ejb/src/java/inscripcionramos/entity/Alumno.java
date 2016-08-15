/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package inscripcionramos.entity;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author MSI GT70 2PE
 */
@Entity
@Table(name = "alumno")
@NamedQueries({
    @NamedQuery(name = "Alumno.verificarCredenciales",
            query = "SELECT 1 FROM Alumno a WHERE a.usuario = :usuario AND a.password = :password"),
    @NamedQuery(name = "Alumno.returnCurrentUserID",
            query = "SELECT a.id FROM Alumno a WHERE a.usuario = :usuario AND a.password = :password"),
    @NamedQuery(name = "Alumno.BuscarAlumno",
            query = "SELECT a FROM Alumno a WHERE a.id =:idAlumno"),
    
        

})
public class Alumno implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(nullable = false)
    private Long id;

    @Column(nullable = false, unique = true)
    private String usuario;

    @Column(nullable = false)
    private String password;

    @ManyToMany
    @JoinTable(name = "SeccionesXAlumno",
            joinColumns
            = @JoinColumn(name = "alumno_id", referencedColumnName = "id"),
            inverseJoinColumns
            = @JoinColumn(name = "seccion_id", referencedColumnName = "id")
    )
    private List<Seccion> secciones;

    public Alumno() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<Seccion> getSecciones() {
        return secciones;
    }

    public void setSecciones(List<Seccion> secciones) {
        this.secciones = secciones;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 67 * hash + Objects.hashCode(this.id);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Alumno other = (Alumno) obj;
        if (!Objects.equals(this.id, other.id)) {
            return false;
        }
        return true;
    }

 

    
}
