using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using Banco.Negocio;

namespace Banco.Servicio
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "BancoServ" en el código, en svc y en el archivo de configuración a la vez.
    public class BancoServ : IBancoServ
    {


        bool IBancoServ.VerificarCliente(string _rut, string _password)
        {
            Cliente cliente = new Cliente();
            return cliente.verificarCliente(_rut, _password);
        }


        public List<Transferencia> buscarTransferenciasPorCliente(string _rut)
        {
            TransferenciaCollection transferencias = new TransferenciaCollection();
            return transferencias.ListarPorCliente(_rut);
        }


        public Cliente buscarCliente(string _rut)
        {
            Cliente cliente = new Cliente(_rut);
            cliente.searchByRut();
            return cliente;
        }


        public bool AgergarTransferencia(int _idTransferencia, String _rutCliente, String _rutDestinatario, int _nroCuentaDestinatario, int _monto)
        {
            Transferencia t = new Transferencia();
            t.idTransferencia = _idTransferencia;
            Cliente c = new Cliente(_rutCliente);
            c.searchByRut();
            t.cliente = c;
            t.rutDestinatario = _rutDestinatario;
            t.nroCuentaDestinatario = _nroCuentaDestinatario;
            t.monto = _monto;
            return t.create();
        }


        public bool UpdateNombreUsuario(string _rutUsuario, string _nombreCompleto)
        {
            Cliente c = new Cliente(_rutUsuario);
            c.searchByRut();
            c.nombreCompleto = _nombreCompleto;
            return c.update();
        }


        public bool EliminarTransferencia(int _idTransferencia)
        {
            Transferencia t = new Transferencia(_idTransferencia);
            return t.delete();
        }
    }
}
