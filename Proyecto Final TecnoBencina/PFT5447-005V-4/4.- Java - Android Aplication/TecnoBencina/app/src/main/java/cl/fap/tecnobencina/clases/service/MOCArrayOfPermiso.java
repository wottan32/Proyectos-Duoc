package cl.fap.tecnobencina.clases.service;

//----------------------------------------------------
//
// Generated by www.easywsdl.com
// Version: 4.5.6.0
//
// Created by Quasar Development at 15/06/2016
//
//---------------------------------------------------



import org.ksoap2.serialization.*;
import java.util.Vector;
import java.util.Hashtable;


public class MOCArrayOfPermiso extends Vector< MOCPermiso> implements KvmSerializable
{
    
    public MOCArrayOfPermiso(){}
    
    public MOCArrayOfPermiso(java.lang.Object inObj,MOCExtendedSoapSerializationEnvelope __envelope)
    {
        if (inObj == null)
            return;
        SoapObject soapObject=(SoapObject)inObj;
        int size = soapObject.getPropertyCount();
        for (int i0=0;i0< size;i0++)
        {
            java.lang.Object obj = soapObject.getProperty(i0);
            if (obj!=null && obj instanceof AttributeContainer)
            {
                AttributeContainer j =(AttributeContainer) soapObject.getProperty(i0);
                MOCPermiso j1= (MOCPermiso)__envelope.get(j,MOCPermiso.class);
                add(j1);
            }
        }
}
    
    @Override
    public java.lang.Object getProperty(int arg0) {
        return this.get(arg0)!=null?this.get(arg0):SoapPrimitive.NullNilElement;
    }
    
    @Override
    public int getPropertyCount() {
        return this.size();
    }
    
    @Override
    public void getPropertyInfo(int index, @SuppressWarnings("rawtypes") Hashtable arg1, PropertyInfo info) {
        info.name = "Permiso";
        info.type = MOCPermiso.class;
    	info.namespace= "http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio";
    }
    
    @Override
    public void setProperty(int arg0, java.lang.Object arg1) {
    }

}