using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using TecnoBencina.Negocio;

namespace TecnoBencina.Servicios
{
    [ServiceContract]

    public interface IServicio
    {

        /*
         No se si desde java se pueda usar los enum EstadoVenta y CantidadLitros
         */

        //----------------------------------VENTA----------------------------------
        [OperationContract]
        List<Venta> ListarVentas();

        //Utilizado de forma interna por la clase Beneficiario para el metodo IsOverLimit(). No le encuentro ningun uso práctico, asi que la comentare
        /*[OperationContract]
        List<Venta> ListarVentasNoAnuladasPorBeneficiario(int _idBeneficiario);*/

        [OperationContract]
        Venta BuscarVenta(int _id);

        //utilizado internamente por la clase Vale. a difenrecia de los otros buscar que retornan excepcion si la entidad no es encontrada, esto retrna null
        [OperationContract]
        Venta BuscarVentaConVale(int _idVale);

        [OperationContract]
        Venta CreateVenta(int _id, int _idSurtidor, int _litros, int _idCombustible, int _rutUsuario, int _idVale, int _idBeneficiario);

        [OperationContract]
        bool SwitchStatusVenta(int _id, EstadoVenta _estado, int _rutUsuario, String _razon);

        [OperationContract]
        decimal cantLtsVendidosPorComb(int _idCombustible, DateTime _fechaInicio, DateTime _fechaTermino);

        [OperationContract]
        decimal cantLtsVendidosPorCombuEnSurtidor(int _idCombustible, int _idSurtidor, DateTime _fechaInicio, DateTime _fechaTermino);


        //----------------------------------PERMISO----------------------------------
        [OperationContract]
        List<Permiso> ListarPermisos();

        [OperationContract]
        List<Permiso> ListarPermisosPorRol(int _idRol);


        //----------------------------------ROL----------------------------------
        [OperationContract]
        Rol BuscarRol(int _id);

        [OperationContract]
        List<Rol> ListarRoles();

        //----------------------------------USUARIO----------------------------------
        [OperationContract]
        bool VerificarUsuario(int _rut, String _password);

        [OperationContract]
        List<Usuario> ListarUsuarios();

        [OperationContract]
        Usuario BuscarUsuario(int _rut);

        [OperationContract]
        bool CreateUsuario(int _rut, String _dv, String _nombres, String _apaterno, String _amaterno, String _password, int _rol);

        [OperationContract]
        bool UpdateUsuario(int _rut, String _nombres, String _apaterno, String _amaterno, int _rol);

        [OperationContract]
        bool SwitchStatusUsuario(int _rut, bool _enabled);

        [OperationContract]
        bool UpdatePassword(int _rut, String _passAntigua, String _passNueva);

        [OperationContract]
        bool hasPermission(int _rut, string _permission);

        [OperationContract]
        bool hasRole(int _rut, string _role);


        //----------------------------------RUT----------------------------------
        [OperationContract]
        bool ValidaRut(string _rut, string _dv);


        //----------------------------------EMPRESA----------------------------------
        [OperationContract]
        List<Empresa> ListarEmpresas();

        [OperationContract]
        List<Talonario> ListarTalonariosPorEmpresa(int _rutEmpresa);

        [OperationContract]
        Empresa BuscarEmpresa(int _rut);

        [OperationContract]
        bool CreateEmpresa(int _rut, String _dv, String _nombre, int _rutUsuario);

        [OperationContract]
        bool UpdateEmpresa(int _rut, String _nombre, int _rutUsuario);

        [OperationContract]
        bool SwitchStatusEmpresa(int _rut, bool _enabled);


        //----------------------------------HISTORIAL_PRECIO----------------------------------
        [OperationContract]
        List<HistorialPrecio> ListarHistorialPrecio();

        [OperationContract]
        List<HistorialPrecio> ListarHistorialPrecioPorCombustible(int _idCombustible);

        [OperationContract]
        HistorialPrecio BuscarHistorialPrecio(int _id);

        [OperationContract]
        decimal BuscarPrecioActualDeCombustible(int _idCombustible);

        [OperationContract]
        bool CreateHistorialPrecioCombustible(int _id, DateTime _fecha, Decimal _precio, int _idCombustible);

        [OperationContract]
        bool UpdateHistorialPrecioCombustible(int _id, decimal _precio, int _idCombustible);


        //----------------------------------COMBUSTIBLE----------------------------------
        [OperationContract]
        List<Combustible> ListarCombustibles();

        [OperationContract]
        Combustible BuscarCombustible(int _idCombustible);

        [OperationContract]
        List<Combustible> BuscarCombustiblesPorSurtidor(int _idSurtidor);

        [OperationContract]
        decimal TotalLitosPorCombustible(int _idCombustible);

        [OperationContract]
        decimal CantidadDeCombustiblePorSurtidor(int _idCombustible, int _idSurtidor);

        [OperationContract]
        bool CreateCombustible(int _id, String _nombre);

        [OperationContract]
        bool SwitchStatusCombustible(int _id, bool _enabled);


        //----------------------------------SURTIDOR----------------------------------
        [OperationContract]
        List<Surtidor> ListarSurtidores();

        [OperationContract]
        Surtidor BuscarSurtidor(int _id);

        [OperationContract]
        bool CreateSurtidor(int _id);

        [OperationContract]
        bool SwitchStatusSurtidor(int _id, bool _enabled);

        [OperationContract]
        bool CargarORemoverCombusible(int _idSurtidor, int _litros, int _idCombustible);


        //----------------------------------TALONARIO----------------------------------
        [OperationContract]
        List<Talonario> ListarTalonarios();

        [OperationContract]
        Talonario BuscarTalonario(int _id);

        [OperationContract]
        Talonario BuscarTalonarioDeVale(int _idVale);

        [OperationContract]
        bool CreateTalonario(int _id, DateTime _fechaEntrega, int _numComprobanteTransaccion, int _rutEmpresa);

        [OperationContract]
        bool UpdateTalonario(int _id, DateTime _fechaEntrega, int _numComprobanteTransaccion, int _rutEmpresa);

        [OperationContract]
        bool SwitchStatusTalonario(int _id, bool _enabled);


        //----------------------------------VALE----------------------------------

        [OperationContract]
        Vale BuscarVale(int _id);

        [OperationContract]
        List<Vale> BuscarValesPorTalonario(int _idTalonario);

        [OperationContract]
        bool CreateVale(int _id, CantidadLitros _cantLitros, int _idTalonario);

        [OperationContract]
        List<bool> MassCreateVale(CantidadLitros _cantLitros, int _idTalonario, int _cantidad);

        [OperationContract]
        bool UpdateVale(int _id, CantidadLitros _cantidadLitos);

        [OperationContract]
        bool SwitchStatusVale(int _id, bool _enabled);


        //----------------------------------BENEFICIARIO_CREDITO----------------------------------
        [OperationContract]
        List<BeneficiarioCredito> ListarBeneficiarios();

        [OperationContract]
        BeneficiarioCredito BuscarBeneficiario(int _id);

        [OperationContract]
        bool CreateBeneficiario(int _id, int _rut, String _dv, int _tope_litros, DateTime _limite_vigencia, String _nombreEmpresa, bool _estado, int _rol);

        [OperationContract]
        bool UpdateBeneficiario(int _id, int _tope_litros, DateTime _limiteVigencia, String _nombreEmpresa);

        [OperationContract]
        bool SwitchStatusBeneficiario(int _id, bool _enabled);

        //Utilizado de forma interna por la clase venta, usarlo de forma indiscriminada no altera ningun registro, por lo que lo dejare sin comentar
        [OperationContract]
        bool BeneficiarioIsOverLimit(int _idBeneficiario, int _cantidadLitros);


        //----------------------------------ANULACION----------------------------------
        [OperationContract]
        List<Anulacion> ListarAnulaciones();

        [OperationContract]
        Anulacion BuscarAnulacion(int _id);

        //Utilizado de forma interna por la clase venta, utilizarlo de forma indiscriminada crea anulaciones no asociadas a ventas
        //Sii sii ahora que lo pienso, una anulacion debe contener como FK la id de la venta para que no pase esto
        /*[OperationContract]
        bool CreateAnulacion(int _id, int _rutUsuario, String _razon);*/

        [OperationContract]
        bool UpdateAnulacion(int _id, String _razon, int _rutUsuario);


        
    }
}
