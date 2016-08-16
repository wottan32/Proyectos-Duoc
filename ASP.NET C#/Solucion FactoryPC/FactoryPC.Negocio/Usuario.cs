using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FactoryPC.Negocio
{
    public class Usuario : Funciones
    {

        /// <summary>
        /// Nombres de el Cliente
        /// </summary>
        private String _nombres;
        public String nombres
        {
            get { return _nombres; }
            set { _nombres = value; }
        }
        private String _apellidos;

        /// <summary>
        /// Apellidos de el Usuario
        /// </summary>
        public String apellidos
        {
            get { return _apellidos; }
            set
            {
                if (value.Length >= 4)
                {
                    _apellidos = value;
                }
                else
                {
                    throw new ArgumentException("El apellido debe contar con al menos 4 caracteres");
                }

            }
        }

        /// <summary>
        /// Telefono del Usuario
        /// Nota: Preferí dejar télefono como String para evitar errores en caso de que comienze con cero.
        /// </summary>
        private String _telefono;
        public String telefono
        {
            get { return _telefono; }
            set
            {
                long temp;
                if (long.TryParse(value, out temp))
                {
                    _telefono = value;
                }

                else
                {
                    throw new ArgumentException("El teléfono solo debe contener números");
                }
            }
        }


        /// <summary>
        /// Email del Usuario
        /// </summary>
        private String _email;

        public String email
        {
            get { return _email; }
            set
            {
                if (IsValidEmail(value))
                {
                    _email = value;
                }
                else
                {
                    throw new ArgumentException("El email debe cumplir con un formato válido");
                }

            }
        }

        /// <summary>
        /// Rut del Usuario
        /// </summary>
        private String _rut;
        public String rut
        {
            get { return _rut; }
            set
            {
                if (isValidRut(value))
                {
                    _rut = value;
                }
                else
                {
                    throw new ArgumentException("El rut no es válido");
                }
            }
        }
        public Usuario()
        {
            this.init();
        }

        private void init()
        {
            _nombres = String.Empty;
            _apellidos = String.Empty;
            _rut = string.Empty;
            _email = String.Empty;
            _telefono = string.Empty;

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_nombres"></param>
        /// <param name="_apellidos"></param>
        /// <param name="_rut"></param>
        /// <param name="_email"></param>
        /// <param name="_telefono"></param>
        public Usuario(String _nombres, String _apellidos, String _rut, String _email, String _telefono)
            : this()
        {

            nombres = _nombres;
            apellidos = _apellidos;
            rut = _rut;
            email = _email;
            telefono = _telefono;

        }

        public override string ToString()
        {
            return String.Format("Nombre {0}, Apellidos{1} , Rut: {2}, Email: {3}, Teléfono: {4}", nombres, apellidos, rut, email, telefono);
        }

        public bool ReadByRut(string rut)
        {
            try
            {
                FactoryPC.DALC.Usuario usuario = AccesoModelo.modeloFP.Usuario.First(usr => usr.rut == rut);
                this.rut = usuario.rut;
                this.nombres = usuario.nombres;
                this.apellidos = usuario.apellidos;
                this.email = usuario.email;
                this.telefono = usuario.telefono;

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public bool Create()
        {
            try
            {
                FactoryPC.DALC.Usuario usuario = new DALC.Usuario();
                usuario.rut = this.rut;
                usuario.nombres = this.nombres;
                usuario.apellidos = this.apellidos;
                usuario.email = this.email;
                usuario.telefono = this.telefono;
                AccesoModelo.modeloFP.AddToUsuario(usuario);
                AccesoModelo.modeloFP.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }


        public bool Update()
        {
            try
            {
                FactoryPC.DALC.Usuario usuario = AccesoModelo.modeloFP.Usuario.First(usr => usr.rut == rut);
                usuario.rut = this.rut;
                usuario.nombres = this.nombres;
                usuario.apellidos = this.apellidos;
                usuario.email = this.email;
                usuario.telefono = this.telefono;
                AccesoModelo.modeloFP.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool Delete()
        {
            try
            {           
                FactoryPC.DALC.Usuario usuario = AccesoModelo.modeloFP.Usuario.First(usr => usr.rut == this.rut);
                AccesoModelo.modeloFP.DeleteObject(usuario);
                AccesoModelo.modeloFP.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
