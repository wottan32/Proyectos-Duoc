/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package atencioncliente.service;

import atencioncliente.entity.Cliente;
import atencioncliente.entity.Servicio;
import atencioncliente.exception.AtencionClienteException;
import java.util.List;

/**
 *
 * @author MSI GT70 2PE
 */
public interface AtencionService {
    public List<Servicio> listaServicios();
    public void registarAtencion(Integer _rutClietne, int _idServicio, String _comentario, int _isRegistred , String _nombreCliente) throws AtencionClienteException;
    
}
