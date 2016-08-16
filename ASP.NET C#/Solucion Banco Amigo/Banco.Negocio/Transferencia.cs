using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Banco.Negocio
{
    public class Transferencia
    {
        public int idTransferencia { get; set; }
        public Cliente cliente { get; set; }
        public String rutDestinatario { get; set; }
        public int nroCuentaDestinatario { get; set; }
        public int monto { get; set; }

        public Transferencia()
        {

        }
        public Transferencia(int _idTransferencia)
        {
            this.idTransferencia =_idTransferencia;
        }

        public bool serachById() {
            try
            {
                Banco.DALC.Transferencia transferenia = AccesoModelo.modeloBc.Transferencia.First(tran => tran.IdTransferencia == this.idTransferencia);
                this.idTransferencia = transferenia.IdTransferencia;
                Cliente cli = new Cliente(transferenia.Cliente);
                cli.searchByRut();
                this.cliente = cli;
                this.rutDestinatario = transferenia.RutDestinatario;
                this.nroCuentaDestinatario = transferenia.NroCuentaDestinatario;
                this.monto = transferenia.Monto;
                return true;

            }
            catch (Exception)
            {                
                throw;
            }
        }

        public bool create() {
            try
            {
                Banco.DALC.Transferencia transferencia = new DALC.Transferencia();
                transferencia.IdTransferencia = this.idTransferencia;
                transferencia.Cliente = this.cliente.rutCliente;
                transferencia.RutDestinatario = this.rutDestinatario;
                transferencia.NroCuentaDestinatario = this.nroCuentaDestinatario;
                transferencia.Monto = this.monto;
                AccesoModelo.modeloBc.AddToTransferencia(transferencia);
                AccesoModelo.modeloBc.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                
                throw;
            }
        
        }

        public bool delete() {
            try
            {
                Banco.DALC.Transferencia transferencia = AccesoModelo.modeloBc.Transferencia.First(tran => tran.IdTransferencia == this.idTransferencia);
                AccesoModelo.modeloBc.Transferencia.DeleteObject(transferencia);
                AccesoModelo.modeloBc.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                
                throw;
            }


        
        }

    }
}
