package cl.fap.tecnobencina.clases.service;

//----------------------------------------------------
//
// Generated by www.easywsdl.com
// Version: 4.5.6.0
//
// Created by Quasar Development at 15/06/2016
//
//---------------------------------------------------


import java.util.Hashtable;
import org.ksoap2.serialization.*;

public class MOCSurtidor extends AttributeContainer implements KvmSerializable
{

    
    public MOCArrayOfCombustible combustibles;
    
    public Boolean estado;
    
    public Integer id;

    public MOCSurtidor ()
    {
    }

    public MOCSurtidor (java.lang.Object paramObj,MOCExtendedSoapSerializationEnvelope __envelope)
    {
	    
	    if (paramObj == null)
            return;
        AttributeContainer inObj=(AttributeContainer)paramObj;


        if(inObj instanceof SoapObject)
        {
            SoapObject soapObject=(SoapObject)inObj;
            int size = soapObject.getPropertyCount();
            for (int i0=0;i0< size;i0++)
            {
                //if you have compilation error here, please use a ksoap2.jar and ExKsoap2.jar from libs folder (in the generated zip file)
                PropertyInfo info=soapObject.getPropertyInfo(i0);
                java.lang.Object obj = info.getValue(); 
                if (info.name.equals("combustibles"))
                {
                    if(obj!=null)
                    {
                        java.lang.Object j = obj;
                        this.combustibles = new MOCArrayOfCombustible(j,__envelope);
                    }
                    continue;
                }
                if (info.name.equals("estado"))
                {
                    if(obj!=null)
                    {
        
                        if (obj.getClass().equals(SoapPrimitive.class))
                        {
                            SoapPrimitive j =(SoapPrimitive) obj;
                            if(j.toString()!=null)
                            {
                                this.estado = new Boolean(j.toString());
                            }
                        }
                        else if (obj instanceof Boolean){
                            this.estado = (Boolean)obj;
                        }
                    }
                    continue;
                }
                if (info.name.equals("id"))
                {
                    if(obj!=null)
                    {
        
                        if (obj.getClass().equals(SoapPrimitive.class))
                        {
                            SoapPrimitive j =(SoapPrimitive) obj;
                            if(j.toString()!=null)
                            {
                                this.id = Integer.parseInt(j.toString());
                            }
                        }
                        else if (obj instanceof Integer){
                            this.id = (Integer)obj;
                        }
                    }
                    continue;
                }

            }

        }



    }

    @Override
    public java.lang.Object getProperty(int propertyIndex) {
        //!!!!! If you have a compilation error here then you are using old version of ksoap2 library. Please upgrade to the latest version.
        //!!!!! You can find a correct version in Lib folder from generated zip file!!!!!
        if(propertyIndex==0)
        {
            return this.combustibles!=null?this.combustibles:SoapPrimitive.NullSkip;
        }
        if(propertyIndex==1)
        {
            return this.estado!=null?this.estado:SoapPrimitive.NullSkip;
        }
        if(propertyIndex==2)
        {
            return this.id!=null?this.id:SoapPrimitive.NullSkip;
        }
        return null;
    }


    @Override
    public int getPropertyCount() {
        return 3;
    }

    @Override
    public void getPropertyInfo(int propertyIndex, @SuppressWarnings("rawtypes") Hashtable arg1, PropertyInfo info)
    {
        if(propertyIndex==0)
        {
            info.type = PropertyInfo.VECTOR_CLASS;
            info.name = "combustibles";
            info.namespace= "http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio";
        }
        if(propertyIndex==1)
        {
            info.type = PropertyInfo.BOOLEAN_CLASS;
            info.name = "estado";
            info.namespace= "http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio";
        }
        if(propertyIndex==2)
        {
            info.type = PropertyInfo.INTEGER_CLASS;
            info.name = "id";
            info.namespace= "http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio";
        }
    }
    
    @Override
    public void setProperty(int arg0, java.lang.Object arg1)
    {
    }

}
