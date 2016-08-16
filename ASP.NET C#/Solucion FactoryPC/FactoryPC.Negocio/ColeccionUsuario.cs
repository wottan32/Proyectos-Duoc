using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FactoryPC.Negocio
{
    public class ColeccionUsuario
    {
        public ColeccionUsuario()
        {
        }    

        private List<Usuario> GenerarListado(List<FactoryPC.DALC.Usuario> entidadUsuario)
        {
            try
            {
                List<Usuario> usuarios = new List<Usuario>();
                foreach (FactoryPC.DALC.Usuario usr in entidadUsuario)
                {
                    Usuario usuario = new Usuario();
                    usuario.rut = usr.rut;
                    usuario.telefono = usr.telefono;
                    usuario.apellidos = usr.apellidos;
                    usuario.nombres = usr.nombres;
                    usuario.email = usr.email;
                    usuarios.Add(usuario);
                }
                return usuarios;
            }
            catch (Exception err)
            {
                throw err;
            }

        }

        public List<Usuario> ListarTodos()
        {
            try
            {
                var usuarios = AccesoModelo.modeloFP.Usuario;
                return GenerarListado(usuarios.ToList());
            }
            catch (Exception err)
            {
                throw err;
            }
        }
    }
}
