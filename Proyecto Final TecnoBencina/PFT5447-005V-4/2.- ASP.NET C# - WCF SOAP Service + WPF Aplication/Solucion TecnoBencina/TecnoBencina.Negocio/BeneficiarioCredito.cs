using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TecnoBencina.Negocio
{
    public class BeneficiarioCredito
    {
        public int id { get; set; }
        public int rut { get; set; }
        public String dv { get; set; }
        public int topeLitros { get; set; }
        public DateTime limiteVigencia { get; set; }
        public String nombreEmpresa { get; set; }
        public bool estado { get; set; }

        public static List<BeneficiarioCredito> ListarBeneficiarios()
        {
            try
            {
                var beneficiarios = AccesoModelo.modeloTb.BENEFICIARIO_CREDITO;
                return GenerarListado(beneficiarios.ToList());
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static BeneficiarioCredito BuscarBeneficiario(int _id)
        {
            try
            {
                TecnoBencina.DALC.BENEFICIARIO_CREDITO beneficiario = AccesoModelo.modeloTb.BENEFICIARIO_CREDITO.FirstOrDefault(benef => benef.ID == _id);
                if (beneficiario != null)
                {
                    return GenerarBeneficiario(beneficiario);
                }
                throw new ArgumentException("No se ha encontrado el beneficiario de id " + _id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public static bool Create(int _id, int _rut, String _dv, int _tope_litros, DateTime _limite_vigencia, String _nombreEmpresa, bool _estado, int _rol)
        {
            try
            {
                if (Rut.ValidaRut(_rut.ToString(), _dv))
                {

                    if (_id == 0)
                    {
                        _id = Convert.ToInt32(AccesoModelo.modeloTb.BENEFICIARIO_CREDITO.Select(bec => bec.ID).DefaultIfEmpty().Max() + 1);
                    }

                    TecnoBencina.DALC.BENEFICIARIO_CREDITO beneficiario = new TecnoBencina.DALC.BENEFICIARIO_CREDITO();
                    beneficiario.ID = _id;
                    beneficiario.RUT = _rut; ;
                    beneficiario.DV = _dv;
                    beneficiario.TOPE_LITROS = _tope_litros;
                    beneficiario.LIMITE_VIGENCIA = _limite_vigencia;
                    beneficiario.NOMBRE_EMPRESA = _nombreEmpresa;
                    beneficiario.ESTADO = "1";

                    AccesoModelo.modeloTb.AddToBENEFICIARIO_CREDITO(beneficiario);
                    AccesoModelo.modeloTb.SaveChanges();
                    return true;
                }
                else
                {
                    throw new ArgumentException("El rut ingresado no es válido");
                }
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
                TecnoBencina.DALC.BENEFICIARIO_CREDITO beneficiario = AccesoModelo.modeloTb.BENEFICIARIO_CREDITO.FirstOrDefault(bnc => bnc.ID == _id);
                if (beneficiario != null)
                {
                    if (_enabled)
                    {
                        beneficiario.ESTADO = "1";
                    }
                    else
                    {
                        beneficiario.ESTADO = "0";
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

        public static bool Update(int _id, int _tope_litros, DateTime _limiteVigencia, String _nombreEmpresa)
        {
            try
            {
                TecnoBencina.DALC.BENEFICIARIO_CREDITO beneficiario = AccesoModelo.modeloTb.BENEFICIARIO_CREDITO.FirstOrDefault(bnc => bnc.ID == _id);
                if (beneficiario != null)
                {
                    beneficiario.TOPE_LITROS = _tope_litros;
                    beneficiario.LIMITE_VIGENCIA = _limiteVigencia;
                    beneficiario.NOMBRE_EMPRESA = _nombreEmpresa;
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

        /// <summary>
        /// Retorna si la suma de litros de sus compras+esta, sobrepasaran su limite mensual
        /// </summary>
        /// <param name="cantidadLitros"></param>
        /// <returns></returns>
        public static bool isOverLimit(int _idBeneficiario, int _cantidadLitros){
            try
            {
                BeneficiarioCredito benef = BeneficiarioCredito.BuscarBeneficiario(_idBeneficiario);
                List<Venta> ventas = Venta.ListarVentasNoAnuladasPorBeneficiario(benef.id);
                DateTime primerDiaDelMes = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
                DateTime ultimoDiaDelMes = primerDiaDelMes.AddMonths(1).AddDays(-1);
                int litros = ventas.Where(vnt => vnt.fecha>= primerDiaDelMes && vnt.fecha<=ultimoDiaDelMes).Select(vnt => vnt.litros).Sum() + _cantidadLitros;
                if (benef.topeLitros >= litros )
                {
                    return false;
                }
                return true;
            }
            catch (Exception)
            {                
                throw;
            }

        }

        private static List<BeneficiarioCredito> GenerarListado(List<TecnoBencina.DALC.BENEFICIARIO_CREDITO> entidadBeneficiario)
        {
            try
            {
                List<BeneficiarioCredito> beneficiarios = new List<BeneficiarioCredito>();
                foreach (TecnoBencina.DALC.BENEFICIARIO_CREDITO bec in entidadBeneficiario)
                {
                    beneficiarios.Add(GenerarBeneficiario(bec));
                }
                return beneficiarios;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private static BeneficiarioCredito GenerarBeneficiario(TecnoBencina.DALC.BENEFICIARIO_CREDITO _beneficiario)
        {
            try
            {
                BeneficiarioCredito beneficiario = new BeneficiarioCredito();
                beneficiario.id = Convert.ToInt32(_beneficiario.ID);
                beneficiario.rut = Convert.ToInt32(_beneficiario.RUT);
                beneficiario.dv = _beneficiario.DV;
                beneficiario.topeLitros = Convert.ToInt32(_beneficiario.TOPE_LITROS);
                beneficiario.limiteVigencia = _beneficiario.LIMITE_VIGENCIA;
                beneficiario.nombreEmpresa = _beneficiario.NOMBRE_EMPRESA;
                beneficiario.estado = _beneficiario.ESTADO == "1" ? true : false;
                return beneficiario;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
