using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TecnoBencina.Negocio
{
    public class Talonario
    {
        public int id { get; set; }
        public DateTime fechaEntrega { get; set; }
        public int numComprobanteTransaccion { get; set; }
        public Empresa empresa { get; set; }
        public bool estado { get; set; }
        public List<Vale> vales { get; set; }

        public static List<Talonario> ListarTalonarios()
        {
            try
            {
                var talonarios = AccesoModelo.modeloTb.TALONARIO;
                return GenerarListado(talonarios.ToList());
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<Talonario> ListarTalonariosPorEmpresa(int _rutEmpresa)
        {
            try
            {
                var talonarios = AccesoModelo.modeloTb.TALONARIO.Where(talo => talo.EMPRESA_RUT == _rutEmpresa);
                return GenerarListado(talonarios.ToList());
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public static Talonario BuscarTalonario(int _id)
        {
            try
            {
                TecnoBencina.DALC.TALONARIO talonario = AccesoModelo.modeloTb.TALONARIO.FirstOrDefault(tal => tal.ID == _id);
                if (talonario == null)
                {
                    throw new ArgumentException("No se ha encontrado el talonario de id " + _id);
                }
                else
                {
                    return GenerarTalonario(talonario);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static Talonario BuscarTalonarioDeVale(int _idVale)
        {
            try
            {
                TecnoBencina.DALC.VALE vale = AccesoModelo.modeloTb.VALE.FirstOrDefault(val => val.ID == _idVale);
                if (vale != null)
                {
                    return BuscarTalonario(Convert.ToInt32(vale.TALONARIO_ID));
                }
                throw new ArgumentException("No se ha encontrado el vale de id " + _idVale);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static bool SwitchStatus(int _id, bool _enabled)
        {
            try
            {
                TecnoBencina.DALC.TALONARIO talonario = AccesoModelo.modeloTb.TALONARIO.FirstOrDefault(tal => tal.ID == _id);
                if (talonario != null)
                {
                    if (_enabled)
                    {
                        talonario.ESTADO = "1";
                    }
                    else
                    {
                        talonario.ESTADO = "0";
                    }
                    AccesoModelo.modeloTb.SaveChanges();
                    return true;
                }
                return false;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static bool Create(int _id, DateTime _fechaEntrega, int _numComprobanteTransaccion, int _rutEmpresa)
        {
            try
            {
                if (Empresa.BuscarEmpresa(_rutEmpresa).estado)
                {

                    if (_id == 0)
                    {
                        _id = Convert.ToInt32(AccesoModelo.modeloTb.TALONARIO.Select(val => val.ID).DefaultIfEmpty().Max() + 1);
                    }

                    TecnoBencina.DALC.TALONARIO talonario = new TecnoBencina.DALC.TALONARIO();
                    talonario.ID = _id; ;
                    talonario.FECHA_ENTRGA = _fechaEntrega;
                    talonario.NUMERO_COMPROBANTE_TRANSACCION = _numComprobanteTransaccion;
                    talonario.EMPRESA_RUT = _rutEmpresa;
                    talonario.ESTADO = "1";

                    AccesoModelo.modeloTb.AddToTALONARIO(talonario);
                    AccesoModelo.modeloTb.SaveChanges();
                    return true;
                }
                throw new ArgumentException("La empresa ingresada se encuentra deshabilitada");
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
        
        public static bool Update(int _id, DateTime _fechaEntrega, int _numComprobanteTransaccion, int _rutEmpresa)
        {
            try
            {
                if (Empresa.BuscarEmpresa(_rutEmpresa).estado)
                {
                    TecnoBencina.DALC.TALONARIO talonario = AccesoModelo.modeloTb.TALONARIO.FirstOrDefault(tal => tal.ID == _id);
                    if (talonario != null)
                    {
                        talonario.FECHA_ENTRGA = _fechaEntrega;
                        talonario.NUMERO_COMPROBANTE_TRANSACCION = _numComprobanteTransaccion;
                        talonario.EMPRESA_RUT = _rutEmpresa;
                        AccesoModelo.modeloTb.SaveChanges();
                        return true;
                    }
                    return false;
                }
                throw new ArgumentException("La empresa ingresada se encuentra deshabilitada");

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

        private static List<Talonario> GenerarListado(List<TecnoBencina.DALC.TALONARIO> entidadTalonario)
        {
            try
            {
                List<Talonario> talonarios = new List<Talonario>();
                foreach (TecnoBencina.DALC.TALONARIO tal in entidadTalonario)
                {
                    talonarios.Add(GenerarTalonario(tal));
                }
                return talonarios;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private static Talonario GenerarTalonario(TecnoBencina.DALC.TALONARIO _talonario)
        {
            try
            {
                Talonario talonario = new Talonario();
                talonario.id = Convert.ToInt32(_talonario.ID);
                talonario.fechaEntrega = _talonario.FECHA_ENTRGA;
                talonario.numComprobanteTransaccion = Convert.ToInt32(_talonario.NUMERO_COMPROBANTE_TRANSACCION);
                talonario.empresa = Empresa.BuscarEmpresa(Convert.ToInt32(_talonario.EMPRESA_RUT));
                talonario.estado = _talonario.ESTADO == "1" ? true : false;
                talonario.vales = Vale.BuscarValesPorTalonario(Convert.ToInt32(_talonario.ID));
                return talonario;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
