using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Banco.Negocio
{
    public class Cliente
    {
        public String rutCliente { get; set; }
        public String nombreCompleto { get; set; }
        public String password { get; set; }

        public Cliente()
        {

        }

        public Cliente(String _rut)
        {
            this.rutCliente = _rut;
        }

        public bool searchByRut()
        {
            try
            {
                Banco.DALC.Cliente cliente = AccesoModelo.modeloBc.Cliente.First(cli => cli.RutCliente == this.rutCliente);
                this.nombreCompleto = cliente.NombreCompleto;
                this.password = cliente.Password;
                return true;
            }
            catch (Exception)
            {                
                throw;
            }
        }

        public bool update() {
            try
            {
                Banco.DALC.Cliente cliente = AccesoModelo.modeloBc.Cliente.First(cli => cli.RutCliente == this.rutCliente);
                cliente.RutCliente = this.rutCliente;
                cliente.NombreCompleto = this.nombreCompleto;
                cliente.Password = this.password;
                AccesoModelo.modeloBc.SaveChanges();
                return true;
            }
            catch (Exception)
            {                
                throw;
            }
        }

        public bool verificarCliente(String _rut, String _password) {
            try
            {
                Banco.DALC.Cliente cliente = AccesoModelo.modeloBc.Cliente.First(cli => cli.RutCliente == _rut);
                if (cliente.Password == _password)
                {
                    return true;
                }
                return false;
               
            }
            catch (Exception)
            {
                
                throw;
            }
        }

    }


}
