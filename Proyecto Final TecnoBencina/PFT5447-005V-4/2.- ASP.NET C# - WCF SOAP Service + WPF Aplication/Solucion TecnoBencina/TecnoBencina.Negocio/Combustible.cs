using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TecnoBencina.Negocio
{
    public class Combustible
    {
        public int id { get; set; }
        public String nombre { get; set; }
        public Boolean estado { get; set; }
        public decimal precioActual { get; set; }
        public decimal cantidadTotal { get; set; }
        public decimal cantidadPorSurtidor { get; set; }
        
        public static List<Combustible> ListarCombustibles()
        {
            try
            {
                var combustibles = AccesoModelo.modeloTb.COMBUSTIBLE;
                return GenerarListado(combustibles.ToList());
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public static Combustible BuscarCombustible(int _idCombustible)
        {
            try
            {

                TecnoBencina.DALC.COMBUSTIBLE combustible = AccesoModelo.modeloTb.COMBUSTIBLE.FirstOrDefault(comb => comb.ID == _idCombustible);
                if (combustible != null)
                {
                    return GenerarCombustible(combustible);
                }

                throw new ArgumentException("No se ha encontrado el combustible de id " + _idCombustible);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<Combustible> BuscarCombustiblesPorSurtidor(int _idSurtidor)
        {
            try
            {
                var combustiblesEntity= (from combustible in AccesoModelo.modeloTb.COMBUSTIBLE
                          where combustible.COMBUSTIBLESXSURTIDOR.Any(s => s.SURTIDOR_ID == _idSurtidor)
                          select combustible).ToList();
                List<Combustible> combustibles = GenerarListado(combustiblesEntity);
                foreach (Combustible comb in combustibles)
                {
                    comb.cantidadPorSurtidor = CantidadDeCombustiblePorSurtidor(comb.id, _idSurtidor);
                }
                return combustibles;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static decimal TotalLitosPorCombustible(int _idCombustible)
        {
            try
            {
                return AccesoModelo.modeloTb.COMBUSTIBLESXSURTIDOR.Where(comb => comb.COMBUSTIBLE_ID == _idCombustible).Select(comb => comb.CANTIDAD_LITROS).DefaultIfEmpty(0).Sum();
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        /// <summary>
        /// Busca la cantidad de un tipo de combustible en el surtidor ingresado
        /// </summary>
        /// <param name="_idCombustible"></param>
        /// <param name="_idSurtidor"></param>
        /// <returns></returns>
        public static decimal CantidadDeCombustiblePorSurtidor(int _idCombustible, int _idSurtidor)
        {
            try
            {
                return AccesoModelo.modeloTb.COMBUSTIBLESXSURTIDOR.Where(comb => comb.COMBUSTIBLE_ID == _idCombustible && comb.SURTIDOR_ID == _idSurtidor).Select(comb => comb.CANTIDAD_LITROS).DefaultIfEmpty(0).Sum();
            }
            catch (Exception)
            {
                throw;
            }

        }


        public static bool Create(int _id, String _nombre)
        {

            try
            {
                if (_id == 0)
                {
                    _id = Convert.ToInt32(AccesoModelo.modeloTb.VENTA.Select(val => val.ID).DefaultIfEmpty().Max() + 1);
                }

                TecnoBencina.DALC.COMBUSTIBLE combustible = new TecnoBencina.DALC.COMBUSTIBLE();
                combustible.ID = _id; ;
                combustible.NOMBRE = _nombre;
                combustible.ESTADO = "1";
                AccesoModelo.modeloTb.AddToCOMBUSTIBLE(combustible);
                AccesoModelo.modeloTb.SaveChanges();
                return true;
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
                TecnoBencina.DALC.COMBUSTIBLE combustible = AccesoModelo.modeloTb.COMBUSTIBLE.FirstOrDefault(comb => comb.ID == _id);
                if (combustible != null)
                {
                    if (_enabled)
                    {
                        combustible.ESTADO = "1";
                    }
                    else
                    {
                        combustible.ESTADO = "0";
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
        private static List<Combustible> GenerarListado(List<TecnoBencina.DALC.COMBUSTIBLE> entidadCombustible)
        {
            try
            {
                List<Combustible> combustibles = new List<Combustible>();
                foreach (TecnoBencina.DALC.COMBUSTIBLE comb in entidadCombustible)
                {
                    combustibles.Add(GenerarCombustible(comb));
                }
                return combustibles;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        private static Combustible GenerarCombustible(TecnoBencina.DALC.COMBUSTIBLE _combustible)
        {
            try
            {
                Combustible combustible = new Combustible();
                combustible.id = Convert.ToInt32(_combustible.ID);
                combustible.nombre = _combustible.NOMBRE;
                combustible.precioActual = HistorialPrecio.BuscarPrecioActualDeCombustible(Convert.ToInt32(_combustible.ID));
                combustible.cantidadTotal = TotalLitosPorCombustible(Convert.ToInt32(_combustible.ID));
                combustible.estado = _combustible.ESTADO == "1" ? true : false;
                return combustible;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }


    }
}
