using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TecnoBencina.Negocio
{
    public class Rol
    {
        public int id { get; set; }
        public String nombre { get; set; }
        public List<Permiso> permisos { get; set; }

        public static Rol BuscarRol(int _id)
        {
            try
            {
                TecnoBencina.DALC.ROL rol = AccesoModelo.modeloTb.ROL.FirstOrDefault(rl => rl.ID == _id);

                if (rol != null)
                {
                    return GenerarRol(rol);                    
                }
                throw new ArgumentException("No se ha encontrado el rol de id " + _id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<Rol> ListarRoles()
        {
            try
            {
                var roles = AccesoModelo.modeloTb.ROL;
                return GenerarListado(roles.ToList());
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private static List<Rol> GenerarListado(List<TecnoBencina.DALC.ROL> entidadRol)
        {
            try
            {
                List<Rol> roles = new List<Rol>();
                foreach (TecnoBencina.DALC.ROL rl in entidadRol)
                {
                    roles.Add(GenerarRol(rl));
                }
                return roles;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private static Rol GenerarRol(TecnoBencina.DALC.ROL _rol)
        {
            try
            {
                Rol rol = new Rol();
                rol.id = Convert.ToInt32(_rol.ID); 
                rol.nombre = _rol.NOMBRE;
                rol.permisos = Permiso.ListarPermisosPorRol(Convert.ToInt32(_rol.ID));
                return rol;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

    }
}
