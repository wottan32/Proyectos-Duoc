using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TecnoBencina.Negocio
{
    public class Surtidor
    {
        public int id { get; set; }
        public bool estado { get; set; }
        public List<Combustible> combustibles { get; set; }

        public static List<Surtidor> ListarSurtidores()
        {
            try
            {
                var surtidores = AccesoModelo.modeloTb.SURTIDOR;
                return GenerarListado(surtidores.ToList());
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static Surtidor BuscarSurtidor(int _id)
        {
            try
            {
                TecnoBencina.DALC.SURTIDOR surtior = AccesoModelo.modeloTb.SURTIDOR.FirstOrDefault(surt => surt.ID == _id);
                if (surtior != null)
                {
                    return GenerarSurtidor(surtior);
                }

                throw new ArgumentException("No se ha encontrado el surtidor de id " + _id);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static bool Create(int _id)
        {
            try
            {
                if (_id == 0)
                {
                    _id = Convert.ToInt32(AccesoModelo.modeloTb.SURTIDOR.Select(val => val.ID).DefaultIfEmpty().Max() + 1);
                }

                TecnoBencina.DALC.SURTIDOR surtidor = new TecnoBencina.DALC.SURTIDOR();
                surtidor.ID = _id;
                surtidor.ESTADO = "1";
                AccesoModelo.modeloTb.AddToSURTIDOR(surtidor);
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
                TecnoBencina.DALC.SURTIDOR surtidor = AccesoModelo.modeloTb.SURTIDOR.FirstOrDefault(surt => surt.ID == _id);
                if (surtidor != null)
                {
                    if (_enabled)
                    {
                        surtidor.ESTADO = "1";
                    }
                    else
                    {
                        surtidor.ESTADO = "0";
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

        public static bool CargarORemoverCombusible(int _idSurtidor, int _litros, int _idCombustible)
        {
            try
            {
                TecnoBencina.DALC.COMBUSTIBLESXSURTIDOR combustibleXsurtidor = AccesoModelo.modeloTb.COMBUSTIBLESXSURTIDOR.FirstOrDefault(combXsurt => combXsurt.SURTIDOR_ID == _idSurtidor && combXsurt.COMBUSTIBLE_ID == _idCombustible);

                if (combustibleXsurtidor != null)
                {

                    if (_litros < 0 && !((combustibleXsurtidor.CANTIDAD_LITROS + _litros) >= 0))
                    {
                        throw new ArgumentException("El valor ingresado esta por sobre la cantidad actual disponible");
                    }

                    combustibleXsurtidor.CANTIDAD_LITROS += _litros;
                    AccesoModelo.modeloTb.SaveChanges();
                    return true;
                }
                else
                {
                    combustibleXsurtidor = new TecnoBencina.DALC.COMBUSTIBLESXSURTIDOR();
                    combustibleXsurtidor.COMBUSTIBLE_ID = _idCombustible;
                    combustibleXsurtidor.SURTIDOR_ID = _idSurtidor;
                    combustibleXsurtidor.CANTIDAD_LITROS = _litros;
                    AccesoModelo.modeloTb.AddToCOMBUSTIBLESXSURTIDOR(combustibleXsurtidor);
                    AccesoModelo.modeloTb.SaveChanges();
                }

                return false;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        private static List<Surtidor> GenerarListado(List<TecnoBencina.DALC.SURTIDOR> entidadSurtidor)
        {
            try
            {
                List<Surtidor> surtidores = new List<Surtidor>();
                foreach (TecnoBencina.DALC.SURTIDOR usr in entidadSurtidor)
                {
                    surtidores.Add(GenerarSurtidor(usr));
                }
                return surtidores;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private static Surtidor GenerarSurtidor(TecnoBencina.DALC.SURTIDOR _surtidor)
        {
            try
            {
                Surtidor surtidor = new Surtidor();
                surtidor.id = Convert.ToInt32(_surtidor.ID);
                surtidor.estado = _surtidor.ESTADO == "1" ? true : false;
                surtidor.combustibles = Combustible.BuscarCombustiblesPorSurtidor(Convert.ToInt32(_surtidor.ID));
                return surtidor;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

    }
}

