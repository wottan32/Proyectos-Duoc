using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Banco.Negocio
{
    public class AccesoModelo
    {
        private static Banco.DALC.BancoEntities _modeloBc;

        public static Banco.DALC.BancoEntities modeloBc
        {
            get
            {
                if (_modeloBc == null)
                {
                    _modeloBc = new DALC.BancoEntities();
                }
                return _modeloBc;
            }

        }
        public AccesoModelo()
        {

        }

        
    }
}
