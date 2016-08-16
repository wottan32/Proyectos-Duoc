using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Banco.Negocio
{
    public class TransferenciaCollection
    {
        public TransferenciaCollection()
        {

        }
        private List<Transferencia> listarTransferencias(List<Banco.DALC.Transferencia> entidadTransferencia)
        {
            List<Transferencia> transferencias = new List<Transferencia>();
            foreach (var tran in entidadTransferencia)
            {
                try
                {
                    Transferencia transferencia = new Transferencia();
                    transferencia.idTransferencia = tran.IdTransferencia;
                    Cliente cliente = new Cliente(tran.Cliente);
                    cliente.searchByRut();
                    transferencia.cliente = cliente;
                    transferencia.rutDestinatario = tran.RutDestinatario;
                    transferencia.nroCuentaDestinatario = tran.NroCuentaDestinatario;
                    transferencia.monto = tran.Monto;
                    transferencias.Add(transferencia);
                }
                catch (Exception)
                {
                    
                    throw;
                }

            }
            return transferencias;
        }

        public List<Transferencia> ListarPorCliente(String _rutCliente) {
            var transferencaias = AccesoModelo.modeloBc.Transferencia.Where(tran => tran.Cliente == _rutCliente);
            return listarTransferencias(transferencaias.ToList());
        }

    }
}
