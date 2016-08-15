using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TecnoBencina.Negocio
{
    public class Permiso
    {
        public decimal id { get; set; }
        public String nombre { get; set; }

        public static List<Permiso> ListarPermisos()
        {
            try
            {
                var permisos = AccesoModelo.modeloTb.PERMISO;
                return GenerarListado(permisos.ToList());
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<Permiso> ListarPermisosPorRol(int _idRol)
        {
            try
            {
                var permisos = AccesoModelo.modeloTb.PERMISO;
                return GenerarListado(permisos.Where(per => per.ROL.Any(rol => rol.ID == _idRol)).ToList());
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private static List<Permiso> GenerarListado(List<TecnoBencina.DALC.PERMISO> entidadPermiso)
        {
            try
            {
                List<Permiso> permisos = new List<Permiso>();
                foreach (TecnoBencina.DALC.PERMISO per in entidadPermiso)
                {         
                    permisos.Add(GenerarPermiso(per));
                }
                return permisos;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        private static Permiso GenerarPermiso(TecnoBencina.DALC.PERMISO _permiso)
        {
            try
            {
                Permiso permiso = new Permiso();
                permiso.id = Convert.ToInt32(_permiso.ID);
                permiso.nombre = _permiso.NOMBRE;
                return permiso;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

    }
}
