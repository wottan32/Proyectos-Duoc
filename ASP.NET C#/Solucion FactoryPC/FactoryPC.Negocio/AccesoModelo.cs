using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FactoryPC.Negocio
{
    public class AccesoModelo
    {

        private static FactoryPC.DALC.FactoryPCEntities _modeloFP;

        public static FactoryPC.DALC.FactoryPCEntities modeloFP
        {
            get
            {
                if (_modeloFP == null)
                {
                    _modeloFP = new DALC.FactoryPCEntities();
                }
                return AccesoModelo._modeloFP;
            }

        }
        public AccesoModelo()
        {

        }
    }
}
