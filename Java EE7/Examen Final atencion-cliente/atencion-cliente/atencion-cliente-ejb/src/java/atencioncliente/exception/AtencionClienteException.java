/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package atencioncliente.exception;

/**
 *
 * @author MSI GT70 2PE
 */
public class AtencionClienteException extends Exception{
        public AtencionClienteException(String message) {
        super(message);
    }

    public AtencionClienteException(String message, Throwable cause) {
        super(message, cause);
    }
}
