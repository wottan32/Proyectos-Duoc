using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TecnoBencina.Negocio
{
    public class Usuario
    {
        public decimal rut { get; set; }
        public String dv { get; set; }
        public String nombres { get; set; }
        public String apatrno { get; set; }
        public String amaterno { get; set; }
        public String password { get; set; }
        public Boolean estado { get; set; }
        public Rol rol { get; set; }

        public static bool VerificarUsuario(int _rut, String _password)
        {
            try
            {
                TecnoBencina.DALC.USUARIO usuario = AccesoModelo.modeloTb.USUARIO.FirstOrDefault(usr => usr.RUT == _rut);
                if (usuario != null && usuario.PASSWORD == _password && usuario.ESTADO == "1")
                {
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<Usuario> ListarUsuarios()
        {
            try
            {
                var usuarios = AccesoModelo.modeloTb.USUARIO;
                return GenerarListado(usuarios.ToList());
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static Usuario BuscarUsuario(int _rut)
        {
            try
            {
                TecnoBencina.DALC.USUARIO usuario = AccesoModelo.modeloTb.USUARIO.FirstOrDefault(usr => usr.RUT == _rut);
                if (usuario != null)
                {
                    return GenerarUsuario(usuario);
                }
                throw new ArgumentException("No se ha encontrado el usuario de rut " + _rut);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static bool Create(int _rut, String _dv, String _nombres, String _apaterno, String _amaterno, String _password, int _rol)
        {

            try
            {
                if (Rut.ValidaRut(_rut.ToString(), _dv))
                {
                    TecnoBencina.DALC.USUARIO usuario = new TecnoBencina.DALC.USUARIO();
                    usuario.RUT = _rut; ;
                    usuario.DV = _dv;
                    usuario.NOMBRES = _nombres;
                    usuario.APATERNO = _apaterno;
                    usuario.AMATERNO = _amaterno;
                    usuario.PASSWORD = _password;
                    usuario.ESTADO = "1";
                    usuario.ROL_ID = _rol;

                    AccesoModelo.modeloTb.AddToUSUARIO(usuario);
                    AccesoModelo.modeloTb.SaveChanges();
                    return true;
                }

                else
                {
                    throw new ArgumentException("El rut ingresado no es válido");
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

        public static bool SwitchStatus(int _rut, bool _enabled)
        {
            try
            {
                TecnoBencina.DALC.USUARIO usuario = AccesoModelo.modeloTb.USUARIO.FirstOrDefault(usr => usr.RUT == _rut);
                if (usuario != null)
                {
                    if (_enabled)
                    {
                        usuario.ESTADO = "1";
                    }
                    else
                    {
                        usuario.ESTADO = "0";
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

        public static bool Update(int _rut, String _nombres, String _apaterno, String _amaterno, int _rol)
        {
            try
            {
                TecnoBencina.DALC.USUARIO usuario = AccesoModelo.modeloTb.USUARIO.FirstOrDefault(usr => usr.RUT == _rut);
                if (usuario != null)
                {
                    usuario.NOMBRES = _nombres;
                    usuario.APATERNO = _apaterno;
                    usuario.ROL_ID = _rol;
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

        public static bool UpdatePassword(int _rut, String _passAntigua, String _passNueva)
        {
            try
            {
                TecnoBencina.DALC.USUARIO usuario = AccesoModelo.modeloTb.USUARIO.FirstOrDefault(usr => usr.RUT == _rut);
                if (usuario != null && usuario.PASSWORD == _passAntigua)
                {
                    usuario.PASSWORD = _passNueva;
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

        public static bool hasPermission(int _rut, string _permission)
        {
            try
            {
                TecnoBencina.DALC.USUARIO usuario = AccesoModelo.modeloTb.USUARIO.FirstOrDefault(usr => usr.RUT == _rut);
                if (usuario != null)
                {
                    return usuario.ROL.PERMISO.Where(per => per.NOMBRE == _permission).Count() > 0 ? true : false;
                }
                return false;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public static bool hasRole(int _rut, string _role)
        {
            try
            {
                TecnoBencina.DALC.USUARIO usuario = AccesoModelo.modeloTb.USUARIO.FirstOrDefault(usr => usr.RUT == _rut);
                if (usuario != null && usuario.ROL.NOMBRE == _role)
                {
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private static List<Usuario> GenerarListado(List<TecnoBencina.DALC.USUARIO> entidadUsuario)
        {
            try
            {
                List<Usuario> usuarios = new List<Usuario>();
                foreach (TecnoBencina.DALC.USUARIO usr in entidadUsuario)
                {
                    usuarios.Add(GenerarUsuario(usr));
                }
                return usuarios;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private static Usuario GenerarUsuario(TecnoBencina.DALC.USUARIO _usuario)
        {
            try
            {
                Usuario usuario = new Usuario();
                usuario.rut = _usuario.RUT;
                usuario.dv = _usuario.DV;
                usuario.nombres = _usuario.NOMBRES;
                usuario.apatrno = _usuario.APATERNO;
                usuario.amaterno = _usuario.AMATERNO;
                usuario.estado = _usuario.ESTADO == "1" ? true : false;
                usuario.rol = Rol.BuscarRol(Convert.ToInt32(_usuario.ROL_ID));

                return usuario;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

    }
}
