using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using Banco.Negocio;

namespace Banco.Servicio
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de interfaz "IBancoServ" en el código y en el archivo de configuración a la vez.
    [ServiceContract]
    public interface IBancoServ
    {
        [OperationContract]
        bool VerificarCliente(String _rut, String _password);

        [OperationContract]
        List<Transferencia> buscarTransferenciasPorCliente(String _rut);

        [OperationContract]
        Cliente buscarCliente(String _rut);

        [OperationContract]
        bool AgergarTransferencia(int _idTransferencia, String _rutCliente, String _rutDestinatario, int _nroCuentaDestinatario, int _monto);

        [OperationContract]
        bool UpdateNombreUsuario(String _rutUsuario, String _nombreCompleto);

        [OperationContract]
        bool EliminarTransferencia(int _idTransferencia);
    }
}
