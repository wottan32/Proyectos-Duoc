using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TecnoBencina.Negocio
{
    public class AccesoModelo
    {
        private static TecnoBencina.DALC.TecnoBencinaEntities _modeloTb;


        public static TecnoBencina.DALC.TecnoBencinaEntities modeloTb
        {
            get
            {
                if (_modeloTb == null)
                {
                    _modeloTb = new TecnoBencina.DALC.TecnoBencinaEntities();
                }
                return _modeloTb;
            }

        }
        public AccesoModelo()
        {

        }
    }
}
