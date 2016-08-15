/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package inscripcionramos.service.impl;

import inscripcionramos.service.UsuarioService;
import java.security.MessageDigest;
//import com.sun.istack.logging.Logger;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author MSI GT70 2PE
 */
@Stateless
public class UsuarioBean implements UsuarioService {

    //private static final Logger LOG = Logger.getLogger(UsuarioBean.class);
    @PersistenceContext(unitName = "inscripcionramosPU")
    private EntityManager em;

    @Override
    public boolean isAutenticacionValida(String usuario, String password) {
        boolean autenticado = false;

        try {
            Query query = this.em.createNamedQuery("Alumno.verificarCredenciales");
            query.setParameter("usuario", usuario);
            query.setParameter("password", this.encriptarPassword(password + "lolis"));
            long resultado = (Long) query.getSingleResult();

            if (resultado == 1) {
                autenticado = true;
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return autenticado;
    }

    @Override
    public Long returnCurrentUserID(String login, String password) {
        try {
        Long id =(long) this.em.createNamedQuery("Alumno.returnCurrentUserID")
                .setParameter("usuario", login)
                .setParameter("password", this.encriptarPassword(password + "lolis"))
                .getSingleResult();

        return id;
        } catch (Exception e) {
         return null;
         }
    }

    private Object encriptarPassword(String password) {
        String encriptado;

        //LOG.fine("se procede a encriptar la clave " + password);
        try {
            MessageDigest mDigest = MessageDigest.getInstance("SHA1");
            byte[] result = mDigest.digest(password.getBytes());
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < result.length; i++) {
                sb.append(Integer.toString((result[i] & 0xff) + 0x100, 16).substring(1));
            }

            encriptado = sb.toString();
        } catch (Exception e) {
            encriptado = null;
        }

        //LOG.fine("clave encriptada " + encriptado);
        return encriptado;
    }

}
