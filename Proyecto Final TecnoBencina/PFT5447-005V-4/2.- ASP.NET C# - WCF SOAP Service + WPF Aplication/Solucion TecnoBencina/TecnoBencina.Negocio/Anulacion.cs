using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TecnoBencina.Negocio
{
    public class Anulacion
    {
        public int id { get; set; }
        public Usuario usuario { get; set; }
        public String razon { get; set; }


        public static List<Anulacion> ListarAnulaciones()
        {
            try
            {
                var anulaciones = AccesoModelo.modeloTb.ANULACION;
                return GenerarListado(anulaciones.ToList());
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static Anulacion BuscarAnulacion(int _id)
        {
            try
            {
                if (_id == 0)
                {
                    _id = Convert.ToInt32(AccesoModelo.modeloTb.ANULACION.Select(val => val.ID).DefaultIfEmpty().Max());
                }

                TecnoBencina.DALC.ANULACION anulacion = AccesoModelo.modeloTb.ANULACION.FirstOrDefault(anul => anul.ID == _id);
                if (anulacion != null)
                {
                    return GenerarAnulacion(anulacion);
                }
                throw new ArgumentException("No se ha encontrado la anulacion de id " + _id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static bool Create(int _id, int _rutUsuario, String _razon)
        {
            try
            {
                if (_id == 0)
                {
                    _id = Convert.ToInt32(AccesoModelo.modeloTb.ANULACION.Select(val => val.ID).DefaultIfEmpty().Max() + 1);
                }

                TecnoBencina.DALC.ANULACION anulacion = new TecnoBencina.DALC.ANULACION();
                anulacion.ID = _id; ;
                anulacion.USUARIO_RUT = _rutUsuario;
                anulacion.RAZON = _razon;

                AccesoModelo.modeloTb.AddToANULACION(anulacion);
                AccesoModelo.modeloTb.SaveChanges();
                return true;

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

        public static bool Update(int _id, String _razon, int _rutUsuario)
        {
            try
            {
                TecnoBencina.DALC.ANULACION anulacion = AccesoModelo.modeloTb.ANULACION.FirstOrDefault(anul => anul.ID == _id);
                if (anulacion != null)
                {
                    anulacion.RAZON = _razon;
                    anulacion.USUARIO_RUT = _rutUsuario;
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

        private static List<Anulacion> GenerarListado(List<TecnoBencina.DALC.ANULACION> entidadAnulacion)
        {
            try
            {
                List<Anulacion> anulaciones = new List<Anulacion>();
                foreach (TecnoBencina.DALC.ANULACION anl in entidadAnulacion)
                {
                    anulaciones.Add(GenerarAnulacion(anl));
                }
                return anulaciones;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private static Anulacion GenerarAnulacion(TecnoBencina.DALC.ANULACION _anulacion)
        {
            try
            {
                Anulacion anulacion = new Anulacion();
                anulacion.id = Convert.ToInt32(_anulacion.ID);
                anulacion.usuario = Usuario.BuscarUsuario(Convert.ToInt32(_anulacion.USUARIO_RUT));
                anulacion.razon = _anulacion.RAZON;
                return anulacion;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}
