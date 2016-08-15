using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TecnoBencina.Negocio
{
    public class Vale
    {
        public int id { get; set; }
        public bool estado { get; set; }
        public CantidadLitros cantidadLitros { get; set; }

        public static Vale BuscarVale(int _id)
        {
            try
            {
                TecnoBencina.DALC.VALE vale = AccesoModelo.modeloTb.VALE.FirstOrDefault(val => val.ID == _id);
                if (vale != null)
                {
                    return GenerarVale(vale);
                }
                throw new ArgumentException("No se ha encontrado el vale de id " + _id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<Vale> BuscarValesPorTalonario(int _idTalonario)
        {
            try
            {
                var vales = AccesoModelo.modeloTb.VALE.Where(val => val.TALONARIO_ID == _idTalonario);
                return GenerarListado(vales.ToList());
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

       

        public static bool Create(int _id, CantidadLitros _cantLitros, int _idTalonario)
        {
            try
            {
                if (Talonario.BuscarTalonario(_idTalonario).estado)
                {
                    if (_id == 0)
                    {
                        _id = Convert.ToInt32(AccesoModelo.modeloTb.VALE.Select(val => val.ID).DefaultIfEmpty().Max() + 1);
                    }
                    TecnoBencina.DALC.VALE vale = new TecnoBencina.DALC.VALE();
                    vale.ID = _id; ;
                    vale.ESTADO = "1";
                    vale.CANTIDAD_LITROS = (int)_cantLitros;
                    vale.TALONARIO_ID = _idTalonario;
                    AccesoModelo.modeloTb.AddToVALE(vale);
                    AccesoModelo.modeloTb.SaveChanges();
                    return true;
                }
                throw new ArgumentException("El estado del talonario se encuentra deshabilitado");

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


        public static List<bool> MassCreate(CantidadLitros _cantLitros, int _idTalonario, int _cantidad)
        {
            try
            {
                List<bool> result = new List<bool>();
                for (int i = 0; i < _cantidad; i++)
                {
                    result.Add(Create(0, _cantLitros, _idTalonario));
                }

                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static bool Update(int _id, CantidadLitros _cantidadLitos)
        {
            try
            {
                TecnoBencina.DALC.VALE vale = AccesoModelo.modeloTb.VALE.FirstOrDefault(val => val.ID == _id);
                if (vale != null)
                {
                    vale.CANTIDAD_LITROS = (int)_cantidadLitos;
                    AccesoModelo.modeloTb.SaveChanges();
                    return true;
                }
                return false;
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

        public static bool SwitchStatus(int _id, bool _enabled)
        {
            try
            {
                TecnoBencina.DALC.VALE vale = AccesoModelo.modeloTb.VALE.FirstOrDefault(val => val.ID == _id);
                if (vale != null)
                {
                    if (_enabled)
                    {
                        Venta vnta = Venta.BuscarVentaConVale(_id);
                        if (vnta!=null && vnta.estado!= EstadoVenta.anulada)
                        {
                            throw new ArgumentException("No se puede rehabilitar un vale que ya esta asignado a una venta no anulada");
                        }        
                        else
                        {
                            vale.ESTADO = "1";
                        }
                    }
                    else
                    {
                        vale.ESTADO = "0";
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

        private static List<Vale> GenerarListado(List<TecnoBencina.DALC.VALE> entidadVale)
        {
            try
            {
                List<Vale> vales = new List<Vale>();
                foreach (TecnoBencina.DALC.VALE val in entidadVale)
                {
                    vales.Add(GenerarVale(val));
                }
                return vales;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private static Vale GenerarVale(TecnoBencina.DALC.VALE _vale)
        {
            try
            {
                Vale vale = new Vale();
                vale.id = Convert.ToInt32(_vale.ID);
                vale.estado = _vale.ESTADO == "1" ? true : false;
                vale.cantidadLitros = (CantidadLitros)Convert.ToInt32(_vale.CANTIDAD_LITROS);

                return vale;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
