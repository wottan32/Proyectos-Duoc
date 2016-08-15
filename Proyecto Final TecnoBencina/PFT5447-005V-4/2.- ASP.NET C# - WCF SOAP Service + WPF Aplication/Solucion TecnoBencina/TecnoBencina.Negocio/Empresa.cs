using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TecnoBencina.Negocio
{
    public class Empresa
    {
        public Decimal rut { get; set; }
        public String dv { get; set; }
        public String nombre { get; set; }
        public Boolean estado { get; set; }
        public Usuario usuario { get; set; }

        public static Empresa BuscarEmpresa(int _rut)
        {
            try
            {
                TecnoBencina.DALC.EMPRESA empresa = AccesoModelo.modeloTb.EMPRESA.FirstOrDefault(emp => emp.RUT == _rut);
                if (empresa != null)
                {
                    return GenerarEmpresa(empresa);
                }

                throw new ArgumentException("No se ha encontrado la empresa de rut " + _rut);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<Empresa> ListarEmpresas()
        {
            try
            {
                var empresas = AccesoModelo.modeloTb.EMPRESA;
                return GenerarListado(empresas.ToList());
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static bool Create(int _rut, String _dv, String _nombre, int _rutUsuario)
        {

            try
            {
                if (Rut.ValidaRut(_rut.ToString(), _dv))
                {
                    TecnoBencina.DALC.EMPRESA empresa = new TecnoBencina.DALC.EMPRESA();
                    empresa.RUT = _rut; ;
                    empresa.DV = _dv.ToString();
                    empresa.NOMBRE = _nombre;
                    empresa.RUT_USUARIO = _rutUsuario;
                    empresa.ESTADO = "1";
                    AccesoModelo.modeloTb.AddToEMPRESA(empresa);
                    AccesoModelo.modeloTb.SaveChanges();
                    return true;
                }
                else
                {
                    throw new ArgumentException("El rut ingresado no es valido");
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
                TecnoBencina.DALC.EMPRESA empresa = AccesoModelo.modeloTb.EMPRESA.FirstOrDefault(emp => emp.RUT == _rut);
                if (empresa != null)
                {
                    if (_enabled)
                    {
                        empresa.ESTADO = "1";
                    }
                    else
                    {
                        empresa.ESTADO = "0";
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

        public static bool Update(int _rut, String _nombre, int _rutUsuario)
        {
            try
            {
                TecnoBencina.DALC.EMPRESA empresa = AccesoModelo.modeloTb.EMPRESA.FirstOrDefault(emp => emp.RUT == _rut);
                if (empresa != null)
                {
                    empresa.NOMBRE = _nombre;
                    empresa.RUT_USUARIO = _rutUsuario;
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

        private static List<Empresa> GenerarListado(List<TecnoBencina.DALC.EMPRESA> entidadEmpresa)
        {
            try
            {
                List<Empresa> empresas = new List<Empresa>();
                foreach (TecnoBencina.DALC.EMPRESA emp in entidadEmpresa)
                {
                    empresas.Add(GenerarEmpresa(emp));
                }
                return empresas;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private static Empresa GenerarEmpresa(TecnoBencina.DALC.EMPRESA _empresa)
        {
            try
            {
                Empresa empresa = new Empresa();
                empresa.rut = _empresa.RUT;
                empresa.dv = _empresa.DV;
                empresa.nombre = _empresa.NOMBRE;
                empresa.estado = _empresa.ESTADO == "0" ? false : true;
                empresa.usuario = Usuario.BuscarUsuario(Convert.ToInt32(_empresa.RUT_USUARIO));
                return empresa;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

    }
}
