using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TecnoBencina.Negocio
{
    public class HistorialPrecio
    {
        public int id { get; set; }
        public DateTime fecha { get; set; }
        public decimal precio { get; set; }
        public Combustible combustible { get; set; }

        public static List<HistorialPrecio> ListarHistorialPrecio()
        {
            try
            {
                var HistorialPrecio = AccesoModelo.modeloTb.HISTORIAL_PRECIO;
                return GenerarListado(HistorialPrecio.OrderByDescending(hist => hist.FECHA).ToList());
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public static List<HistorialPrecio> ListarHistorialPrecioPorCombustible(int _idCombustible)
        {
            try
            {
                var HistorialPrecio = AccesoModelo.modeloTb.HISTORIAL_PRECIO;
                return GenerarListado(HistorialPrecio.Where(hist => hist.COMBUSTIBLE_ID == _idCombustible).OrderByDescending(hist => hist.FECHA).ToList());
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static decimal BuscarPrecioActualDeCombustible(int _idCombustible)
        {
            try
            {
                TecnoBencina.DALC.HISTORIAL_PRECIO historialPrecio = AccesoModelo.modeloTb.HISTORIAL_PRECIO.FirstOrDefault(hrp => hrp.COMBUSTIBLE_ID == _idCombustible && hrp.FECHA == DateTime.Today);
                if (historialPrecio != null)
                {
                    return historialPrecio.PRECIO;
                }
                return -1;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static HistorialPrecio BuscarHistorialPrecio(int _id)
        {
            try
            {
                TecnoBencina.DALC.HISTORIAL_PRECIO historialPrecio = AccesoModelo.modeloTb.HISTORIAL_PRECIO.FirstOrDefault(hrp => hrp.ID == _id);
                if (historialPrecio != null)
                {
                    return GenerarHistorialPrecio(historialPrecio);
                }

                throw new ArgumentException("No se ha encontrado el historial de id " + _id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static bool Create(int _id, DateTime _fecha, Decimal _precio, int _idCombustible)
        {

            try
            {

                if (AccesoModelo.modeloTb.HISTORIAL_PRECIO.FirstOrDefault(hsp => hsp.FECHA == _fecha.Date && hsp.COMBUSTIBLE_ID == _idCombustible) != null)
                {
                    throw new ArgumentException("Ya contienes un registro de precio para este dia y combustible");
                }
                else
                {
                    if (_id == 0)
                    {
                        _id = Convert.ToInt32(AccesoModelo.modeloTb.HISTORIAL_PRECIO.Select(val => val.ID).DefaultIfEmpty().Max() + 1);
                    }

                    TecnoBencina.DALC.HISTORIAL_PRECIO historialPrecio = new TecnoBencina.DALC.HISTORIAL_PRECIO();
                    historialPrecio.ID = _id; ;
                    historialPrecio.FECHA = _fecha.Date;
                    historialPrecio.PRECIO = _precio;
                    historialPrecio.COMBUSTIBLE_ID = _idCombustible;
                    AccesoModelo.modeloTb.AddToHISTORIAL_PRECIO(historialPrecio);
                    AccesoModelo.modeloTb.SaveChanges();
                    return true;
                }

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

        public static bool Update(int _id, decimal _precio, int _idCombustible)
        {
            try
            {
                TecnoBencina.DALC.HISTORIAL_PRECIO historialPrecio = AccesoModelo.modeloTb.HISTORIAL_PRECIO.FirstOrDefault(hsp => hsp.ID == _id);
                if (historialPrecio != null)
                {
                    if (historialPrecio.FECHA.Date <= DateTime.Today)
                    {
                        historialPrecio.PRECIO = _precio;
                        historialPrecio.COMBUSTIBLE_ID = _idCombustible;
                        AccesoModelo.modeloTb.SaveChanges();
                        return true;
                    }
                    throw new ArgumentException("No puedes actualizar registros de fechas anteriores a esta");
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
        
        private static List<HistorialPrecio> GenerarListado(List<TecnoBencina.DALC.HISTORIAL_PRECIO> entidadHistorialPrecio)
        {
            try
            {
                List<HistorialPrecio> historialPrecios = new List<HistorialPrecio>();
                foreach (TecnoBencina.DALC.HISTORIAL_PRECIO usr in entidadHistorialPrecio)
                {
                    historialPrecios.Add(GenerarHistorialPrecio(usr));
                }
                return historialPrecios;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        private static HistorialPrecio GenerarHistorialPrecio(TecnoBencina.DALC.HISTORIAL_PRECIO _historialPrecio)
        {
            try
            {
                HistorialPrecio historialPrecio = new HistorialPrecio();
                historialPrecio.id = Convert.ToInt32(_historialPrecio.ID);
                historialPrecio.fecha = _historialPrecio.FECHA;
                historialPrecio.precio = _historialPrecio.PRECIO;
                historialPrecio.combustible = Combustible.BuscarCombustible(Convert.ToInt32(_historialPrecio.COMBUSTIBLE_ID));
                return historialPrecio;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

    }
}
