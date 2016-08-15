using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TecnoBencina.Negocio
{
    public class Venta
    {
        public int id { get; set; }
        public Combustible combustible { get; set; }
        public int monto { get; set; }
        public int litros { get; set; }
        public DateTime fecha { get; set; }
        public EstadoVenta estado { get; set; }
        public Usuario usuario { get; set; }
        public Surtidor surtidor { get; set; }
        public Vale vale { get; set; }
        public BeneficiarioCredito beneficiarioCredito { get; set; }
        public Anulacion anulacion { get; set; }

        public static List<Venta> ListarVentas()
        {
            try
            {
                var ventas = AccesoModelo.modeloTb.VENTA;
                return GenerarListado(ventas.ToList());
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<Venta> ListarVentasNoAnuladasPorBeneficiario(int _idBeneficiario)
        {
            try
            {
                var ventas = AccesoModelo.modeloTb.VENTA.Where(vta => vta.BENEFICIARIO_ID ==_idBeneficiario && vta.ESTADO!="anulada");
                return GenerarListado(ventas.ToList());
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static Venta BuscarVenta(int _id)
        {
            try
            {
                TecnoBencina.DALC.VENTA venta = AccesoModelo.modeloTb.VENTA.FirstOrDefault(vnt => vnt.ID == _id );
                if (venta != null)
                {
                    return GenerarVenta(venta);
                }
                throw new ArgumentException("No se ha encontrado la venta de id " + _id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static Venta BuscarVentaConVale(int _idVale)
        {
            try
            {
                TecnoBencina.DALC.VENTA venta = AccesoModelo.modeloTb.VENTA.FirstOrDefault(vnt => vnt.VALE_ID == _idVale && vnt.ESTADO != "anulada");
                if (venta != null)
                {
                    return GenerarVenta(venta);
                }
                return null;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="_id"></param>
        /// <param name="_idCombustible"></param>
        /// <param name="_monto"></param>
        /// <param name="_litros"></param>
        /// <param name="_fecha"></param>
        /// <param name="_rutUsuario"></param>
        /// <param name="_idSurtidor"></param>
        /// <param name="_idVale">Id de vale; si no posee vale, dejar en 0</param>
        /// <param name="_idBeneficiario">Id Beneficiario; si no posee beneficiario, dejar en 0</param>
        /// <returns></returns>
        public static Venta Create(int _id, int _idSurtidor, int _litros, int _idCombustible, int _rutUsuario, int _idVale, int _idBeneficiario)
        {

            try
            {
                if (_id == 0)
                {
                    _id = Convert.ToInt32(AccesoModelo.modeloTb.VENTA.Select(val => val.ID).DefaultIfEmpty().Max() + 1);
                }

                TecnoBencina.DALC.VENTA venta = new TecnoBencina.DALC.VENTA();
                if (Usuario.hasRole(_rutUsuario, "cajero"))
                {           
                    Combustible comb = Combustible.BuscarCombustible(_idCombustible);
                    Surtidor srt = Surtidor.BuscarSurtidor(_idSurtidor);
                    Usuario usr = Usuario.BuscarUsuario(_rutUsuario);

                    if (comb.precioActual ==-1)
                    {
                        throw new ArgumentException("El precio de el combustible para hoy no ha sido fijado");
                    }
                    else if (!srt.estado)
                    {
                        throw new ArgumentException("El surtidor ingresado se encuentra deshabilitado");
                    }
                    else if (!usr.estado)
                    {
                        throw new ArgumentException("El usuario ingresado se encuentra deshabilitado");
                    }
                    else if (!comb.estado)
                    {
                        throw new ArgumentException("El combustible ingresado se encuentra deshabilitado");
                    }

                    venta.ID = _id; ;
                    venta.MONTO = _litros*comb.precioActual;
                    venta.LITROS = _litros;
                    venta.FECHA = DateTime.Now;
                    venta.ESTADO = EstadoVenta.sin_confirmar.ToString(); 
                    venta.USUARIO_RUT = _rutUsuario;
                    venta.SURTIDOR_ID = _idSurtidor;
                    venta.COMBUSTIBLE_ID = _idCombustible;

                    if (_idVale != 0)
                    {
                        if (Talonario.BuscarTalonarioDeVale(_idVale).estado)
                        {
                            Vale vle = Vale.BuscarVale(_idVale);
                            if (vle.estado)
                            {
                                venta.VALE_ID = _idVale;
                                venta.LITROS = (int)vle.cantidadLitros;
                                Vale.SwitchStatus(_idVale, false);
                            }
                            else
                            {
                                throw new ArgumentException("El vale ingresado ya se encuentra utilizado");
                            }
                        }
                        else
                        {
                            throw new ArgumentException("El talonario del vale se encuentra deshabilitado");
                        }
                    }
                    else if (_idBeneficiario != 0)
                    {
                        BeneficiarioCredito benef = BeneficiarioCredito.BuscarBeneficiario(_idBeneficiario);
                        if (benef.limiteVigencia >= DateTime.Now && benef.estado)
                        {
                            if (!BeneficiarioCredito.isOverLimit(benef.id, _litros))
                            {
                                venta.BENEFICIARIO_ID = _idBeneficiario;
                            }
                            else
                            {
                                throw new ArgumentException("El beneficiario sobrepasa(ra) el limite mensual");                  
                            }                                      
                        }
                        else
                        {
                            throw new ArgumentException("La vigencia del beneficiario a caducado o esta deshabiliatado");
                        }                        
                    }

                    Surtidor.CargarORemoverCombusible(_idSurtidor, _litros * -1, _idCombustible);

                    AccesoModelo.modeloTb.AddToVENTA(venta);
                    AccesoModelo.modeloTb.SaveChanges();
                    return GenerarVenta(venta);
                }
                return null;

            }
            catch (System.Data.UpdateException)
            {
                throw new ArgumentException("System.Data.UpdateException: Las id de FK estan correctas?");

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_id">Id de Venta</param>
        /// <param name="_estado">Estado de venta</param>
        /// <param name="_rutUsuario">Rut del usuario ejecutamdo el cambio</param>
        /// <param name="_razon">Razon de anulacion, esta sera ignorada si el estado es distinto de anulada</param>
        /// <returns></returns>
        public static bool SwitchStatus(int _id, EstadoVenta _estado, int _rutUsuario, String _razon)
        {
            try
            {
                TecnoBencina.DALC.VENTA venta = AccesoModelo.modeloTb.VENTA.FirstOrDefault(vnt => vnt.ID == _id);
                bool sad = Usuario.hasPermission(_rutUsuario, "cambiar_estado_venta");
                if (venta != null && Usuario.hasPermission(_rutUsuario, "cambiar_estado_venta") && venta.ESTADO != _estado.ToString())
                {
                    bool resultado = false;

                    if (venta.ESTADO != EstadoVenta.anulada.ToString())
                    {
                        switch (_estado)
                        {
                            case EstadoVenta.sin_confirmar:
                                throw new ArgumentException("No puedes regresar una venta al estado sin_confrimar");
                            case EstadoVenta.confirmada:
                                if (venta.ESTADO == EstadoVenta.sin_confirmar.ToString())
                                {
                                    venta.ESTADO = EstadoVenta.confirmada.ToString();
                                    resultado = true;
                                }
                                else
                                {
                                    throw new ArgumentException("Para confirmar una venta, antes debe encontrarse sin_confirmar");
                                }
                                break;
                            case EstadoVenta.anulada:
                                if (venta.ESTADO != EstadoVenta.confirmada.ToString())
                                {
                                    if (_razon.Length > 0)
                                    {
                                        if (venta.VALE_ID != null)
                                        {
                                            venta.VALE.ESTADO = "1";
                                        }
                                        Anulacion.Create(0, _rutUsuario, _razon);
                                        venta.ANULACION_ID = Anulacion.BuscarAnulacion(0).id;
                                        venta.ESTADO = _estado.ToString();
                                        resultado = true;
                                    }
                                    else
                                    {
                                        throw new ArgumentException("Debe ser ingresada una razon de anulacion");
                                    }
                                }
                                else
                                {
                                    throw new ArgumentException("No puedes anular una venta confirmada");
                                }

                                break;
                            default:
                                break;
                        }
                    }
                    else
                    {
                        throw new ArgumentException("No puedes cambiar el estado de una venta que ya esta anulada");
                    }

                    AccesoModelo.modeloTb.SaveChanges();
                    return resultado;
                }
                return false;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static decimal cantLtsVendidosPorComb(int _idCombustible, DateTime _fechaInicio, DateTime _fechaTermino) {
            try
            {
                var ventas = AccesoModelo.modeloTb.VENTA;
                return ventas.ToList().Where(vent => vent.ESTADO == "confirmada" && vent.COMBUSTIBLE_ID == _idCombustible && (vent.FECHA >= _fechaInicio && vent.FECHA <= _fechaTermino)).Sum(vent => vent.LITROS); ;
    
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static decimal cantLtsVendidosPorCombuEnSurtidor(int _idCombustible, int _idSurtidor, DateTime _fechaInicio, DateTime _fechaTermino)
        {
            try
            {
                var ventas = AccesoModelo.modeloTb.VENTA;
                return ventas.ToList().Where(vent => vent.ESTADO == "confirmada" && vent.COMBUSTIBLE_ID == _idCombustible && vent.SURTIDOR_ID == _idSurtidor && (vent.FECHA >= _fechaInicio && vent.FECHA <= _fechaTermino)).Sum(vent => vent.LITROS);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private static List<Venta> GenerarListado(List<TecnoBencina.DALC.VENTA> entidadVenta)
        {
            try
            {
                List<Venta> ventas = new List<Venta>();
                foreach (TecnoBencina.DALC.VENTA vent in entidadVenta)
                {
                    ventas.Add(GenerarVenta(vent));
                }
                return ventas;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private static Venta GenerarVenta(TecnoBencina.DALC.VENTA _venta)
        {
            try
            {
                Venta venta = new Venta();
                venta.id = Convert.ToInt32(_venta.ID);
                venta.combustible = Combustible.BuscarCombustible(Convert.ToInt32(_venta.COMBUSTIBLE_ID));
                venta.monto = Convert.ToInt32(_venta.MONTO);
                venta.litros = Convert.ToInt32(_venta.LITROS);
                venta.fecha = _venta.FECHA;
                EstadoVenta est;
                Enum.TryParse(_venta.ESTADO, out est);
                venta.estado = est;
                venta.usuario = Usuario.BuscarUsuario(Convert.ToInt32(_venta.USUARIO_RUT));
                venta.surtidor = Surtidor.BuscarSurtidor(Convert.ToInt32(_venta.SURTIDOR_ID));
                venta.vale = _venta.VALE_ID == null ? null : Vale.BuscarVale(Convert.ToInt32(_venta.VALE_ID));
                venta.beneficiarioCredito = _venta.BENEFICIARIO_ID == null ? null : BeneficiarioCredito.BuscarBeneficiario(Convert.ToInt32(_venta.BENEFICIARIO_ID));
                venta.anulacion = _venta.ANULACION_ID == null ? null : Anulacion.BuscarAnulacion(Convert.ToInt32(_venta.ANULACION_ID));
                return venta;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}
