/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package inscripcionramos.service;

import javax.ejb.Local;

/**
 *
 * @author MSI GT70 2PE
 */

@Local
public interface  UsuarioService {

    public boolean isAutenticacionValida(String login, String password);
    public Long returnCurrentUserID(String login, String password);



}
