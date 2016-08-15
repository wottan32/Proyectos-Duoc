/**
 * IServicio.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package org.tempuri;

public interface IServicio extends java.rmi.Remote {
    public java.lang.String[] listarIdSurtidoresXCombustible(java.lang.Integer idCombustible) throws java.rmi.RemoteException;
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Venta[] listarVentas() throws java.rmi.RemoteException;
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Venta buscarVenta(java.lang.Integer _id) throws java.rmi.RemoteException;
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Venta buscarVentaConVale(java.lang.Integer _idVale) throws java.rmi.RemoteException;
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Venta createVenta(java.lang.Integer _id, java.lang.Integer _idSurtidor, java.lang.Integer _litros, java.lang.Integer _idCombustible, java.lang.Integer _rutUsuario, java.lang.Integer _idVale, java.lang.Integer _idBeneficiario) throws java.rmi.RemoteException;
    public java.lang.Boolean switchStatusVenta(java.lang.Integer _id, org.datacontract.schemas._2004._07.TecnoBencina_Negocio.EstadoVenta _estado, java.lang.Integer _rutUsuario, java.lang.String _razon) throws java.rmi.RemoteException;
    public java.math.BigDecimal cantLtsVendidosPorComb(java.lang.Integer _idCombustible, java.util.Calendar _fechaInicio, java.util.Calendar _fechaTermino) throws java.rmi.RemoteException;
    public java.math.BigDecimal cantLtsVendidosPorCombuEnSurtidor(java.lang.Integer _idCombustible, java.lang.Integer _idSurtidor, java.util.Calendar _fechaInicio, java.util.Calendar _fechaTermino) throws java.rmi.RemoteException;
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Permiso[] listarPermisos() throws java.rmi.RemoteException;
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Permiso[] listarPermisosPorRol(java.lang.Integer _idRol) throws java.rmi.RemoteException;
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Rol buscarRol(java.lang.Integer _id) throws java.rmi.RemoteException;
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Rol[] listarRoles() throws java.rmi.RemoteException;
    public java.lang.Boolean verificarUsuario(java.lang.Integer _rut, java.lang.String _password) throws java.rmi.RemoteException;
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Usuario[] listarUsuarios() throws java.rmi.RemoteException;
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Usuario buscarUsuario(java.lang.Integer _rut) throws java.rmi.RemoteException;
    public java.lang.Boolean createUsuario(java.lang.Integer _rut, java.lang.String _dv, java.lang.String _nombres, java.lang.String _apaterno, java.lang.String _amaterno, java.lang.String _password, java.lang.Integer _rol) throws java.rmi.RemoteException;
    public java.lang.Boolean updateUsuario(java.lang.Integer _rut, java.lang.String _nombres, java.lang.String _apaterno, java.lang.String _amaterno, java.lang.Integer _rol) throws java.rmi.RemoteException;
    public java.lang.Boolean switchStatusUsuario(java.lang.Integer _rut, java.lang.Boolean _enabled) throws java.rmi.RemoteException;
    public java.lang.Boolean updatePassword(java.lang.Integer _rut, java.lang.String _passAntigua, java.lang.String _passNueva) throws java.rmi.RemoteException;
    public java.lang.Boolean hasPermission(java.lang.Integer _rut, java.lang.String _permission) throws java.rmi.RemoteException;
    public java.lang.Boolean hasRole(java.lang.Integer _rut, java.lang.String _role) throws java.rmi.RemoteException;
    public java.lang.Boolean validaRut(java.lang.String _rut, java.lang.String _dv) throws java.rmi.RemoteException;
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Empresa[] listarEmpresas() throws java.rmi.RemoteException;
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Talonario[] listarTalonariosPorEmpresa(java.lang.Integer _rutEmpresa) throws java.rmi.RemoteException;
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Empresa buscarEmpresa(java.lang.Integer _rut) throws java.rmi.RemoteException;
    public java.lang.Boolean createEmpresa(java.lang.Integer _rut, java.lang.String _dv, java.lang.String _nombre, java.lang.Integer _rutUsuario) throws java.rmi.RemoteException;
    public java.lang.Boolean updateEmpresa(java.lang.Integer _rut, java.lang.String _nombre, java.lang.Integer _rutUsuario) throws java.rmi.RemoteException;
    public java.lang.Boolean switchStatusEmpresa(java.lang.Integer _rut, java.lang.Boolean _enabled) throws java.rmi.RemoteException;
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.HistorialPrecio[] listarHistorialPrecio() throws java.rmi.RemoteException;
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.HistorialPrecio[] listarHistorialPrecioPorCombustible(java.lang.Integer _idCombustible) throws java.rmi.RemoteException;
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.HistorialPrecio buscarHistorialPrecio(java.lang.Integer _id) throws java.rmi.RemoteException;
    public java.math.BigDecimal buscarPrecioActualDeCombustible(java.lang.Integer _idCombustible) throws java.rmi.RemoteException;
    public java.lang.Boolean createHistorialPrecioCombustible(java.lang.Integer _id, java.util.Calendar _fecha, java.math.BigDecimal _precio, java.lang.Integer _idCombustible) throws java.rmi.RemoteException;
    public java.lang.Boolean updateHistorialPrecioCombustible(java.lang.Integer _id, java.math.BigDecimal _precio, java.lang.Integer _idCombustible) throws java.rmi.RemoteException;
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Combustible[] listarCombustibles() throws java.rmi.RemoteException;
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Combustible buscarCombustible(java.lang.Integer _idCombustible) throws java.rmi.RemoteException;
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Combustible[] buscarCombustiblesPorSurtidor(java.lang.Integer _idSurtidor) throws java.rmi.RemoteException;
    public java.math.BigDecimal totalLitosPorCombustible(java.lang.Integer _idCombustible) throws java.rmi.RemoteException;
    public java.math.BigDecimal cantidadDeCombustiblePorSurtidor(java.lang.Integer _idCombustible, java.lang.Integer _idSurtidor) throws java.rmi.RemoteException;
    public java.lang.Boolean createCombustible(java.lang.Integer _id, java.lang.String _nombre) throws java.rmi.RemoteException;
    public java.lang.Boolean switchStatusCombustible(java.lang.Integer _id, java.lang.Boolean _enabled) throws java.rmi.RemoteException;
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Surtidor[] listarSurtidores() throws java.rmi.RemoteException;
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Surtidor buscarSurtidor(java.lang.Integer _id) throws java.rmi.RemoteException;
    public java.lang.Boolean createSurtidor(java.lang.Integer _id) throws java.rmi.RemoteException;
    public java.lang.Boolean switchStatusSurtidor(java.lang.Integer _id, java.lang.Boolean _enabled) throws java.rmi.RemoteException;
    public java.lang.Boolean cargarORemoverCombusible(java.lang.Integer _idSurtidor, java.lang.Integer _litros, java.lang.Integer _idCombustible) throws java.rmi.RemoteException;
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Talonario[] listarTalonarios() throws java.rmi.RemoteException;
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Talonario buscarTalonario(java.lang.Integer _id) throws java.rmi.RemoteException;
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Talonario buscarTalonarioDeVale(java.lang.Integer _idVale) throws java.rmi.RemoteException;
    public java.lang.Boolean createTalonario(java.lang.Integer _id, java.util.Calendar _fechaEntrega, java.lang.Integer _numComprobanteTransaccion, java.lang.Integer _rutEmpresa) throws java.rmi.RemoteException;
    public java.lang.Boolean updateTalonario(java.lang.Integer _id, java.util.Calendar _fechaEntrega, java.lang.Integer _numComprobanteTransaccion, java.lang.Integer _rutEmpresa) throws java.rmi.RemoteException;
    public java.lang.Boolean switchStatusTalonario(java.lang.Integer _id, java.lang.Boolean _enabled) throws java.rmi.RemoteException;
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Vale buscarVale(java.lang.Integer _id) throws java.rmi.RemoteException;
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Vale[] buscarValesPorTalonario(java.lang.Integer _idTalonario) throws java.rmi.RemoteException;
    public java.lang.Boolean createVale(java.lang.Integer _id, org.datacontract.schemas._2004._07.TecnoBencina_Negocio.CantidadLitros _cantLitros, java.lang.Integer _idTalonario) throws java.rmi.RemoteException;
    public boolean[] massCreateVale(org.datacontract.schemas._2004._07.TecnoBencina_Negocio.CantidadLitros _cantLitros, java.lang.Integer _idTalonario, java.lang.Integer _cantidad) throws java.rmi.RemoteException;
    public java.lang.Boolean updateVale(java.lang.Integer _id, org.datacontract.schemas._2004._07.TecnoBencina_Negocio.CantidadLitros _cantidadLitos) throws java.rmi.RemoteException;
    public java.lang.Boolean switchStatusVale(java.lang.Integer _id, java.lang.Boolean _enabled) throws java.rmi.RemoteException;
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.BeneficiarioCredito[] listarBeneficiarios() throws java.rmi.RemoteException;
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.BeneficiarioCredito buscarBeneficiario(java.lang.Integer _id) throws java.rmi.RemoteException;
    public java.lang.Boolean createBeneficiario(java.lang.Integer _id, java.lang.Integer _rut, java.lang.String _dv, java.lang.Integer _tope_litros, java.util.Calendar _limite_vigencia, java.lang.String _nombreEmpresa, java.lang.Boolean _estado, java.lang.Integer _rol) throws java.rmi.RemoteException;
    public java.lang.Boolean updateBeneficiario(java.lang.Integer _id, java.lang.Integer _tope_litros, java.util.Calendar _limiteVigencia, java.lang.String _nombreEmpresa) throws java.rmi.RemoteException;
    public java.lang.Boolean switchStatusBeneficiario(java.lang.Integer _id, java.lang.Boolean _enabled) throws java.rmi.RemoteException;
    public java.lang.Boolean beneficiarioIsOverLimit(java.lang.Integer _idBeneficiario, java.lang.Integer _cantidadLitros) throws java.rmi.RemoteException;
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Anulacion[] listarAnulaciones() throws java.rmi.RemoteException;
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Anulacion buscarAnulacion(java.lang.Integer _id) throws java.rmi.RemoteException;
    public java.lang.Boolean updateAnulacion(java.lang.Integer _id, java.lang.String _razon, java.lang.Integer _rutUsuario) throws java.rmi.RemoteException;
}
