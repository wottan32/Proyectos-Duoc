package org.tempuri;

public class IServicioProxy implements org.tempuri.IServicio {
  private String _endpoint = null;
  private org.tempuri.IServicio iServicio = null;
  
  public IServicioProxy() {
    _initIServicioProxy();
  }
  
  public IServicioProxy(String endpoint) {
    _endpoint = endpoint;
    _initIServicioProxy();
  }
  
  private void _initIServicioProxy() {
    try {
      iServicio = (new org.tempuri.ServicioLocator()).getBasicHttpBinding_IServicio();
      if (iServicio != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)iServicio)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)iServicio)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (iServicio != null)
      ((javax.xml.rpc.Stub)iServicio)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public org.tempuri.IServicio getIServicio() {
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio;
  }
  
  public java.lang.String[] listarIdSurtidoresXCombustible(java.lang.Integer idCombustible) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.listarIdSurtidoresXCombustible(idCombustible);
  }
  
  public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Venta[] listarVentas() throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.listarVentas();
  }
  
  public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Venta buscarVenta(java.lang.Integer _id) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.buscarVenta(_id);
  }
  
  public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Venta buscarVentaConVale(java.lang.Integer _idVale) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.buscarVentaConVale(_idVale);
  }
  
  public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Venta createVenta(java.lang.Integer _id, java.lang.Integer _idSurtidor, java.lang.Integer _litros, java.lang.Integer _idCombustible, java.lang.Integer _rutUsuario, java.lang.Integer _idVale, java.lang.Integer _idBeneficiario) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.createVenta(_id, _idSurtidor, _litros, _idCombustible, _rutUsuario, _idVale, _idBeneficiario);
  }
  
  public java.lang.Boolean switchStatusVenta(java.lang.Integer _id, org.datacontract.schemas._2004._07.TecnoBencina_Negocio.EstadoVenta _estado, java.lang.Integer _rutUsuario, java.lang.String _razon) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.switchStatusVenta(_id, _estado, _rutUsuario, _razon);
  }
  
  public java.math.BigDecimal cantLtsVendidosPorComb(java.lang.Integer _idCombustible, java.util.Calendar _fechaInicio, java.util.Calendar _fechaTermino) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.cantLtsVendidosPorComb(_idCombustible, _fechaInicio, _fechaTermino);
  }
  
  public java.math.BigDecimal cantLtsVendidosPorCombuEnSurtidor(java.lang.Integer _idCombustible, java.lang.Integer _idSurtidor, java.util.Calendar _fechaInicio, java.util.Calendar _fechaTermino) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.cantLtsVendidosPorCombuEnSurtidor(_idCombustible, _idSurtidor, _fechaInicio, _fechaTermino);
  }
  
  public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Permiso[] listarPermisos() throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.listarPermisos();
  }
  
  public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Permiso[] listarPermisosPorRol(java.lang.Integer _idRol) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.listarPermisosPorRol(_idRol);
  }
  
  public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Rol buscarRol(java.lang.Integer _id) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.buscarRol(_id);
  }
  
  public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Rol[] listarRoles() throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.listarRoles();
  }
  
  public java.lang.Boolean verificarUsuario(java.lang.Integer _rut, java.lang.String _password) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.verificarUsuario(_rut, _password);
  }
  
  public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Usuario[] listarUsuarios() throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.listarUsuarios();
  }
  
  public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Usuario buscarUsuario(java.lang.Integer _rut) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.buscarUsuario(_rut);
  }
  
  public java.lang.Boolean createUsuario(java.lang.Integer _rut, java.lang.String _dv, java.lang.String _nombres, java.lang.String _apaterno, java.lang.String _amaterno, java.lang.String _password, java.lang.Integer _rol) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.createUsuario(_rut, _dv, _nombres, _apaterno, _amaterno, _password, _rol);
  }
  
  public java.lang.Boolean updateUsuario(java.lang.Integer _rut, java.lang.String _nombres, java.lang.String _apaterno, java.lang.String _amaterno, java.lang.Integer _rol) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.updateUsuario(_rut, _nombres, _apaterno, _amaterno, _rol);
  }
  
  public java.lang.Boolean switchStatusUsuario(java.lang.Integer _rut, java.lang.Boolean _enabled) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.switchStatusUsuario(_rut, _enabled);
  }
  
  public java.lang.Boolean updatePassword(java.lang.Integer _rut, java.lang.String _passAntigua, java.lang.String _passNueva) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.updatePassword(_rut, _passAntigua, _passNueva);
  }
  
  public java.lang.Boolean hasPermission(java.lang.Integer _rut, java.lang.String _permission) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.hasPermission(_rut, _permission);
  }
  
  public java.lang.Boolean hasRole(java.lang.Integer _rut, java.lang.String _role) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.hasRole(_rut, _role);
  }
  
  public java.lang.Boolean validaRut(java.lang.String _rut, java.lang.String _dv) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.validaRut(_rut, _dv);
  }
  
  public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Empresa[] listarEmpresas() throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.listarEmpresas();
  }
  
  public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Talonario[] listarTalonariosPorEmpresa(java.lang.Integer _rutEmpresa) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.listarTalonariosPorEmpresa(_rutEmpresa);
  }
  
  public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Empresa buscarEmpresa(java.lang.Integer _rut) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.buscarEmpresa(_rut);
  }
  
  public java.lang.Boolean createEmpresa(java.lang.Integer _rut, java.lang.String _dv, java.lang.String _nombre, java.lang.Integer _rutUsuario) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.createEmpresa(_rut, _dv, _nombre, _rutUsuario);
  }
  
  public java.lang.Boolean updateEmpresa(java.lang.Integer _rut, java.lang.String _nombre, java.lang.Integer _rutUsuario) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.updateEmpresa(_rut, _nombre, _rutUsuario);
  }
  
  public java.lang.Boolean switchStatusEmpresa(java.lang.Integer _rut, java.lang.Boolean _enabled) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.switchStatusEmpresa(_rut, _enabled);
  }
  
  public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.HistorialPrecio[] listarHistorialPrecio() throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.listarHistorialPrecio();
  }
  
  public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.HistorialPrecio[] listarHistorialPrecioPorCombustible(java.lang.Integer _idCombustible) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.listarHistorialPrecioPorCombustible(_idCombustible);
  }
  
  public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.HistorialPrecio buscarHistorialPrecio(java.lang.Integer _id) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.buscarHistorialPrecio(_id);
  }
  
  public java.math.BigDecimal buscarPrecioActualDeCombustible(java.lang.Integer _idCombustible) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.buscarPrecioActualDeCombustible(_idCombustible);
  }
  
  public java.lang.Boolean createHistorialPrecioCombustible(java.lang.Integer _id, java.util.Calendar _fecha, java.math.BigDecimal _precio, java.lang.Integer _idCombustible) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.createHistorialPrecioCombustible(_id, _fecha, _precio, _idCombustible);
  }
  
  public java.lang.Boolean updateHistorialPrecioCombustible(java.lang.Integer _id, java.math.BigDecimal _precio, java.lang.Integer _idCombustible) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.updateHistorialPrecioCombustible(_id, _precio, _idCombustible);
  }
  
  public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Combustible[] listarCombustibles() throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.listarCombustibles();
  }
  
  public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Combustible buscarCombustible(java.lang.Integer _idCombustible) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.buscarCombustible(_idCombustible);
  }
  
  public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Combustible[] buscarCombustiblesPorSurtidor(java.lang.Integer _idSurtidor) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.buscarCombustiblesPorSurtidor(_idSurtidor);
  }
  
  public java.math.BigDecimal totalLitosPorCombustible(java.lang.Integer _idCombustible) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.totalLitosPorCombustible(_idCombustible);
  }
  
  public java.math.BigDecimal cantidadDeCombustiblePorSurtidor(java.lang.Integer _idCombustible, java.lang.Integer _idSurtidor) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.cantidadDeCombustiblePorSurtidor(_idCombustible, _idSurtidor);
  }
  
  public java.lang.Boolean createCombustible(java.lang.Integer _id, java.lang.String _nombre) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.createCombustible(_id, _nombre);
  }
  
  public java.lang.Boolean switchStatusCombustible(java.lang.Integer _id, java.lang.Boolean _enabled) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.switchStatusCombustible(_id, _enabled);
  }
  
  public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Surtidor[] listarSurtidores() throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.listarSurtidores();
  }
  
  public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Surtidor buscarSurtidor(java.lang.Integer _id) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.buscarSurtidor(_id);
  }
  
  public java.lang.Boolean createSurtidor(java.lang.Integer _id) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.createSurtidor(_id);
  }
  
  public java.lang.Boolean switchStatusSurtidor(java.lang.Integer _id, java.lang.Boolean _enabled) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.switchStatusSurtidor(_id, _enabled);
  }
  
  public java.lang.Boolean cargarORemoverCombusible(java.lang.Integer _idSurtidor, java.lang.Integer _litros, java.lang.Integer _idCombustible) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.cargarORemoverCombusible(_idSurtidor, _litros, _idCombustible);
  }
  
  public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Talonario[] listarTalonarios() throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.listarTalonarios();
  }
  
  public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Talonario buscarTalonario(java.lang.Integer _id) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.buscarTalonario(_id);
  }
  
  public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Talonario buscarTalonarioDeVale(java.lang.Integer _idVale) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.buscarTalonarioDeVale(_idVale);
  }
  
  public java.lang.Boolean createTalonario(java.lang.Integer _id, java.util.Calendar _fechaEntrega, java.lang.Integer _numComprobanteTransaccion, java.lang.Integer _rutEmpresa) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.createTalonario(_id, _fechaEntrega, _numComprobanteTransaccion, _rutEmpresa);
  }
  
  public java.lang.Boolean updateTalonario(java.lang.Integer _id, java.util.Calendar _fechaEntrega, java.lang.Integer _numComprobanteTransaccion, java.lang.Integer _rutEmpresa) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.updateTalonario(_id, _fechaEntrega, _numComprobanteTransaccion, _rutEmpresa);
  }
  
  public java.lang.Boolean switchStatusTalonario(java.lang.Integer _id, java.lang.Boolean _enabled) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.switchStatusTalonario(_id, _enabled);
  }
  
  public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Vale buscarVale(java.lang.Integer _id) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.buscarVale(_id);
  }
  
  public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Vale[] buscarValesPorTalonario(java.lang.Integer _idTalonario) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.buscarValesPorTalonario(_idTalonario);
  }
  
  public java.lang.Boolean createVale(java.lang.Integer _id, org.datacontract.schemas._2004._07.TecnoBencina_Negocio.CantidadLitros _cantLitros, java.lang.Integer _idTalonario) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.createVale(_id, _cantLitros, _idTalonario);
  }
  
  public boolean[] massCreateVale(org.datacontract.schemas._2004._07.TecnoBencina_Negocio.CantidadLitros _cantLitros, java.lang.Integer _idTalonario, java.lang.Integer _cantidad) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.massCreateVale(_cantLitros, _idTalonario, _cantidad);
  }
  
  public java.lang.Boolean updateVale(java.lang.Integer _id, org.datacontract.schemas._2004._07.TecnoBencina_Negocio.CantidadLitros _cantidadLitos) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.updateVale(_id, _cantidadLitos);
  }
  
  public java.lang.Boolean switchStatusVale(java.lang.Integer _id, java.lang.Boolean _enabled) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.switchStatusVale(_id, _enabled);
  }
  
  public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.BeneficiarioCredito[] listarBeneficiarios() throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.listarBeneficiarios();
  }
  
  public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.BeneficiarioCredito buscarBeneficiario(java.lang.Integer _id) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.buscarBeneficiario(_id);
  }
  
  public java.lang.Boolean createBeneficiario(java.lang.Integer _id, java.lang.Integer _rut, java.lang.String _dv, java.lang.Integer _tope_litros, java.util.Calendar _limite_vigencia, java.lang.String _nombreEmpresa, java.lang.Boolean _estado, java.lang.Integer _rol) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.createBeneficiario(_id, _rut, _dv, _tope_litros, _limite_vigencia, _nombreEmpresa, _estado, _rol);
  }
  
  public java.lang.Boolean updateBeneficiario(java.lang.Integer _id, java.lang.Integer _tope_litros, java.util.Calendar _limiteVigencia, java.lang.String _nombreEmpresa) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.updateBeneficiario(_id, _tope_litros, _limiteVigencia, _nombreEmpresa);
  }
  
  public java.lang.Boolean switchStatusBeneficiario(java.lang.Integer _id, java.lang.Boolean _enabled) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.switchStatusBeneficiario(_id, _enabled);
  }
  
  public java.lang.Boolean beneficiarioIsOverLimit(java.lang.Integer _idBeneficiario, java.lang.Integer _cantidadLitros) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.beneficiarioIsOverLimit(_idBeneficiario, _cantidadLitros);
  }
  
  public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Anulacion[] listarAnulaciones() throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.listarAnulaciones();
  }
  
  public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Anulacion buscarAnulacion(java.lang.Integer _id) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.buscarAnulacion(_id);
  }
  
  public java.lang.Boolean updateAnulacion(java.lang.Integer _id, java.lang.String _razon, java.lang.Integer _rutUsuario) throws java.rmi.RemoteException{
    if (iServicio == null)
      _initIServicioProxy();
    return iServicio.updateAnulacion(_id, _razon, _rutUsuario);
  }
  
  
}