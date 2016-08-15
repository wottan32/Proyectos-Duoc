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
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "Service1" en el código, en svc y en el archivo de configuración.
    public class Servicio : IServicio
    {

        //----------------------------------VENTA----------------------------------
        public List<Venta> ListarVentas()
        {
            try
            {
                return Venta.ListarVentas();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /*public List<Venta> ListarVentasNoAnuladasPorBeneficiario(int _idBeneficiario)
        {
            try
            {
                return Venta.ListarVentasNoAnuladasPorBeneficiario(_idBeneficiario);
            }
            catch (Exception ex)
            {
                throw ex;
            } 
        }*/

        public Venta BuscarVenta(int _id)
        {
            try
            {
                return Venta.BuscarVenta(_id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Venta BuscarVentaConVale(int _idVale)
        {
            try
            {
                return Venta.BuscarVentaConVale(_idVale);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Venta CreateVenta(int _id, int _idSurtidor, int _litros, int _idCombustible, int _rutUsuario, int _idVale, int _idBeneficiario)
        {
            try
            {
                return Venta.Create(_id, _idSurtidor, _litros, _idCombustible, _rutUsuario, _idVale, _idBeneficiario);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool SwitchStatusVenta(int _id, EstadoVenta _estado, int _rutUsuario, string _razon)
        {
            try
            {
                return Venta.SwitchStatus(_id, _estado, _rutUsuario, _razon);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public decimal cantLtsVendidosPorComb(int _idCombustible, DateTime _fechaInicio, DateTime _fechaTermino)
        {
            return Venta.cantLtsVendidosPorComb(_idCombustible, _fechaInicio, _fechaTermino);
        }

        public decimal cantLtsVendidosPorCombuEnSurtidor(int _idCombustible, int _idSurtidor, DateTime _fechaInicio, DateTime _fechaTermino)
        {
            return Venta.cantLtsVendidosPorCombuEnSurtidor(_idCombustible, _idSurtidor, _fechaInicio, _fechaTermino);
        }

        //----------------------------------PERMISO---------------------------------
        public List<Permiso> ListarPermisos()
        {
            try
            {
                return Permiso.ListarPermisos();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<Permiso> ListarPermisosPorRol(int _idRol)
        {
            try
            {
                return Permiso.ListarPermisosPorRol(_idRol);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        //----------------------------------ROL----------------------------------
        public Rol BuscarRol(int _id)
        {
            try
            {
                return Rol.BuscarRol(_id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<Rol> ListarRoles()
        {
            try
            {
                return Rol.ListarRoles();
            }
            catch (Exception)
            {                
                throw;
            }
        }
        //----------------------------------USUARIO----------------------------------
        public bool VerificarUsuario(int _rut, string _password)
        {
            try
            {
                return Usuario.VerificarUsuario(_rut, _password);
                //string sessionId = OperationContext.Current.SessionId;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<Usuario> ListarUsuarios()
        {
            try
            {
                return Usuario.ListarUsuarios();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Usuario BuscarUsuario(int _rut)
        {
            try
            {
                return Usuario.BuscarUsuario(_rut);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool CreateUsuario(int _rut, string _dv, string _nombres, string _apaterno, string _amaterno, string _password, int _rol)
        {
            try
            {
                return Usuario.Create(_rut, _dv, _nombres, _apaterno, _amaterno, _password, _rol);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool UpdateUsuario(int _rut, string _nombres, string _apaterno, string _amaterno, int _rol)
        {
            try
            {
                return Usuario.Update(_rut, _nombres, _apaterno, _amaterno, _rol);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool SwitchStatusUsuario(int _rut, bool _enabled)
        {
            try
            {
                return Usuario.SwitchStatus(_rut, _enabled);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool UpdatePassword(int _rut, String _passAntigua, String _passNueva)
        {
            try
            {
                return Usuario.UpdatePassword(_rut, _passAntigua, _passNueva);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool hasPermission(int _rut, string _permission)
        {
            try
            {
                return Usuario.hasPermission(_rut, _permission);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool hasRole(int _rut, string _role)
        {
            try
            {
                return Usuario.hasRole(_rut, _role);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        //----------------------------------RUT----------------------------------
        public bool ValidaRut(string _rut, string _dv)
        {
            try
            {
                return Rut.ValidaRut(_rut, _dv);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        //----------------------------------EMPRESA----------------------------------
        public List<Empresa> ListarEmpresas()
        {
            return Empresa.ListarEmpresas();
        }

        public Empresa BuscarEmpresa(int _rut)
        {
            try
            {
                return Empresa.BuscarEmpresa(_rut);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool CreateEmpresa(int _rut, string _dv, string _nombre, int _rutUsuario)
        {
            try
            {
                return Empresa.Create(_rut, _dv, _nombre, _rutUsuario);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool UpdateEmpresa(int _rut, string _nombre, int _rutUsuario)
        {
            try
            {
                return Empresa.Update(_rut, _nombre, _rutUsuario);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool SwitchStatusEmpresa(int _rut, bool _enabled)
        {
            try
            {
                return Empresa.SwitchStatus(_rut, _enabled);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        //----------------------------------HISTORIAL_PRECIO----------------------------------
        public List<HistorialPrecio> ListarHistorialPrecio()
        {
            try
            {
                return HistorialPrecio.ListarHistorialPrecio();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<HistorialPrecio> ListarHistorialPrecioPorCombustible(int _idCombustible)
        {
            try
            {
                return HistorialPrecio.ListarHistorialPrecioPorCombustible(_idCombustible);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public HistorialPrecio BuscarHistorialPrecio(int _id)
        {
            try
            {
                return HistorialPrecio.BuscarHistorialPrecio(_id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public decimal BuscarPrecioActualDeCombustible(int _idCombustible)
        {
            try
            {
                return HistorialPrecio.BuscarPrecioActualDeCombustible(_idCombustible);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool CreateHistorialPrecioCombustible(int _id, DateTime _fecha, decimal _precio, int _idCombustible)
        {
            try
            {
                return HistorialPrecio.Create(_id, _fecha, _precio, _idCombustible);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool UpdateHistorialPrecioCombustible(int _id, decimal _precio, int _idCombustible)
        {
            try
            {
                return HistorialPrecio.Update(_id, _precio, _idCombustible);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        //----------------------------------COMBUSTIBLE----------------------------------
        public List<Combustible> ListarCombustibles()
        {
            try
            {
                return Combustible.ListarCombustibles();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Combustible BuscarCombustible(int _idCombustible)
        {
            try
            {
                return Combustible.BuscarCombustible(_idCombustible);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<Combustible> BuscarCombustiblesPorSurtidor(int _idSurtidor)
        {
            try
            {
                return Combustible.BuscarCombustiblesPorSurtidor(_idSurtidor);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public decimal TotalLitosPorCombustible(int _idCombustible)
        {
            try
            {
                return Combustible.TotalLitosPorCombustible(_idCombustible);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public decimal CantidadDeCombustiblePorSurtidor(int _idCombustible, int _idSurtidor)
        {
            try
            {
                return Combustible.CantidadDeCombustiblePorSurtidor(_idCombustible, _idSurtidor);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool CreateCombustible(int _id, string _nombre)
        {
            try
            {
                return Combustible.Create(_id, _nombre);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool SwitchStatusCombustible(int _id, bool _enabled)
        {
            try
            {
                return Combustible.SwitchStatus(_id, _enabled);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        //----------------------------------SURTIDOR----------------------------------
        public List<Surtidor> ListarSurtidores()
        {
            try
            {
                return Surtidor.ListarSurtidores();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Surtidor BuscarSurtidor(int _id)
        {
            try
            {
                return Surtidor.BuscarSurtidor(_id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool CreateSurtidor(int _id)
        {
            try
            {
                return Surtidor.Create(_id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool SwitchStatusSurtidor(int _id, bool _enabled)
        {
            try
            {
                return Surtidor.SwitchStatus(_id, _enabled);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool CargarORemoverCombusible(int _idSurtidor, int _litros, int _idCombustible)
        {
            try
            {
                return Surtidor.CargarORemoverCombusible(_idSurtidor, _litros, _idCombustible);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        //----------------------------------TALONARIO----------------------------------
        public List<Talonario> ListarTalonarios()
        {
            try
            {
                return Talonario.ListarTalonarios();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<Talonario> ListarTalonariosPorEmpresa(int _rutEmpresa)
        {
            try
            {
                return Talonario.ListarTalonariosPorEmpresa(_rutEmpresa);
            }
            catch (Exception)
            {

                throw;
            }
        }

        public Talonario BuscarTalonario(int _id)
        {
            try
            {
                return Talonario.BuscarTalonario(_id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Talonario BuscarTalonarioDeVale(int _idVale)
        {
            try
            {
                return Talonario.BuscarTalonarioDeVale(_idVale);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool CreateTalonario(int _id, DateTime _fechaEntrega, int _numComprobanteTransaccion, int _rutEmpresa)
        {
            try
            {
                return Talonario.Create(_id, _fechaEntrega, _numComprobanteTransaccion, _rutEmpresa);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool UpdateTalonario(int _id, DateTime _fechaEntrega, int _numComprobanteTransaccion, int _rutEmpresa)
        {
            try
            {
                return Talonario.Update(_id, _fechaEntrega, _numComprobanteTransaccion, _rutEmpresa);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool SwitchStatusTalonario(int _id, bool _enabled)
        {
            try
            {
                return Talonario.SwitchStatus(_id, _enabled);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        //----------------------------------VALE----------------------------------
        public Vale BuscarVale(int _id)
        {
            try
            {
                return Vale.BuscarVale(_id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<Vale> BuscarValesPorTalonario(int _idTalonario)
        {
            try
            {
                return Vale.BuscarValesPorTalonario(_idTalonario);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool CreateVale(int _id, CantidadLitros _cantLitros, int _idTalonario)
        {
            try
            {
                return Vale.Create(_id, _cantLitros, _idTalonario);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<bool> MassCreateVale(CantidadLitros _cantLitros, int _idTalonario, int _cantidad)
        {
            try
            {
                return Vale.MassCreate(_cantLitros, _idTalonario, _cantidad);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool UpdateVale(int _id, CantidadLitros _cantidadLitos)
        {
            try
            {
                return Vale.Update(_id, _cantidadLitos);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool SwitchStatusVale(int _id, bool _enabled)
        {
            try
            {
                return Vale.SwitchStatus(_id, _enabled);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //----------------------------------BENEFICIARIO_CREDITO----------------------------------

        public List<BeneficiarioCredito> ListarBeneficiarios()
        {
            try
            {
                return BeneficiarioCredito.ListarBeneficiarios();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public BeneficiarioCredito BuscarBeneficiario(int _id)
        {
            try
            {
                return BeneficiarioCredito.BuscarBeneficiario(_id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool CreateBeneficiario(int _id, int _rut, string _dv, int _tope_litros, DateTime _limite_vigencia, string _nombreEmpresa, bool _estado, int _rol)
        {
            try
            {
                return BeneficiarioCredito.Create(_id, _rut, _dv, _tope_litros, _limite_vigencia, _nombreEmpresa, _estado, _rol);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool UpdateBeneficiario(int _id, int _tope_litros, DateTime _limiteVigencia, string _nombreEmpresa)
        {
            try
            {
                return BeneficiarioCredito.Update(_id, _tope_litros, _limiteVigencia, _nombreEmpresa);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool SwitchStatusBeneficiario(int _id, bool _enabled)
        {
            try
            {
                return BeneficiarioCredito.SwitchStatus(_id, _enabled);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool BeneficiarioIsOverLimit(int _idBeneficiario, int _cantidadLitros)
        {
            try
            {
                return BeneficiarioCredito.isOverLimit(_idBeneficiario, _cantidadLitros);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        //----------------------------------ANULACION----------------------------------
        public List<Anulacion> ListarAnulaciones()
        {
            try
            {
                return Anulacion.ListarAnulaciones();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Anulacion BuscarAnulacion(int _id)
        {
            try
            {
                return Anulacion.BuscarAnulacion(_id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /*public bool CreateAnulacion(int _id, int _rutUsuario, string _razon)
        {
            try
            {
                return Anulacion.Create( _id,  _rutUsuario,  _razon);
            }
            catch (Exception ex)
            {
                throw ex;
            } 
        }*/

        public bool UpdateAnulacion(int _id, string _razon, int _rutUsuario)
        {
            try
            {
                return Anulacion.Update(_id, _razon, _rutUsuario);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



    }
}
