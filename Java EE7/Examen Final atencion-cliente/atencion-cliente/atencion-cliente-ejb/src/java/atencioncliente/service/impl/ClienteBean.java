/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package atencioncliente.service.impl;

import atencioncliente.entity.Cliente;
import atencioncliente.service.ClienteService;
import javax.ejb.Stateless;
import javax.ejb.LocalBean;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author MSI GT70 2PE
 */
@Stateless

public class ClienteBean implements ClienteService{
      @PersistenceContext(unitName = "atencion-cliente-ejbPU")
    private EntityManager em;

    @Override
    public Cliente buscarCliente(String _rutCliente) {
        try {
            return this.em.find(Cliente.class, _rutCliente);
        } catch (Exception e) {
            return null;
        }
}




}
