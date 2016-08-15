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
import java.math.BigDecimal;

public class MOCCombustible extends AttributeContainer implements KvmSerializable
{

    
    public BigDecimal cantidadPorSurtidor;
    
    public BigDecimal cantidadTotal;
    
    public Boolean estado;
    
    public Integer id;
    
    public String nombre;
    
    public BigDecimal precioActual;

    public MOCCombustible ()
    {
    }

    public MOCCombustible (java.lang.Object paramObj,MOCExtendedSoapSerializationEnvelope __envelope)
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
                if (info.name.equals("cantidadPorSurtidor"))
                {
                    if(obj!=null)
                    {
        
                        if (obj.getClass().equals(SoapPrimitive.class))
                        {
                            SoapPrimitive j =(SoapPrimitive) obj;
                            if(j.toString()!=null)
                            {
                                this.cantidadPorSurtidor = new BigDecimal(j.toString());
                            }
                        }
                        else if (obj instanceof BigDecimal){
                            this.cantidadPorSurtidor = (BigDecimal)obj;
                        }
                    }
                    continue;
                }
                if (info.name.equals("cantidadTotal"))
                {
                    if(obj!=null)
                    {
        
                        if (obj.getClass().equals(SoapPrimitive.class))
                        {
                            SoapPrimitive j =(SoapPrimitive) obj;
                            if(j.toString()!=null)
                            {
                                this.cantidadTotal = new BigDecimal(j.toString());
                            }
                        }
                        else if (obj instanceof BigDecimal){
                            this.cantidadTotal = (BigDecimal)obj;
                        }
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
                if (info.name.equals("nombre"))
                {
                    if(obj!=null)
                    {
        
                        if (obj.getClass().equals(SoapPrimitive.class))
                        {
                            SoapPrimitive j =(SoapPrimitive) obj;
                            if(j.toString()!=null)
                            {
                                this.nombre = j.toString();
                            }
                        }
                        else if (obj instanceof String){
                            this.nombre = (String)obj;
                        }
                    }
                    continue;
                }
                if (info.name.equals("precioActual"))
                {
                    if(obj!=null)
                    {
        
                        if (obj.getClass().equals(SoapPrimitive.class))
                        {
                            SoapPrimitive j =(SoapPrimitive) obj;
                            if(j.toString()!=null)
                            {
                                this.precioActual = new BigDecimal(j.toString());
                            }
                        }
                        else if (obj instanceof BigDecimal){
                            this.precioActual = (BigDecimal)obj;
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
            return this.cantidadPorSurtidor!=null?this.cantidadPorSurtidor.toString():SoapPrimitive.NullSkip;
        }
        if(propertyIndex==1)
        {
            return this.cantidadTotal!=null?this.cantidadTotal.toString():SoapPrimitive.NullSkip;
        }
        if(propertyIndex==2)
        {
            return this.estado!=null?this.estado:SoapPrimitive.NullSkip;
        }
        if(propertyIndex==3)
        {
            return this.id!=null?this.id:SoapPrimitive.NullSkip;
        }
        if(propertyIndex==4)
        {
            return this.nombre!=null?this.nombre:SoapPrimitive.NullSkip;
        }
        if(propertyIndex==5)
        {
            return this.precioActual!=null?this.precioActual.toString():SoapPrimitive.NullSkip;
        }
        return null;
    }


    @Override
    public int getPropertyCount() {
        return 6;
    }

    @Override
    public void getPropertyInfo(int propertyIndex, @SuppressWarnings("rawtypes") Hashtable arg1, PropertyInfo info)
    {
        if(propertyIndex==0)
        {
            info.type = PropertyInfo.STRING_CLASS;
            info.name = "cantidadPorSurtidor";
            info.namespace= "http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio";
        }
        if(propertyIndex==1)
        {
            info.type = PropertyInfo.STRING_CLASS;
            info.name = "cantidadTotal";
            info.namespace= "http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio";
        }
        if(propertyIndex==2)
        {
            info.type = PropertyInfo.BOOLEAN_CLASS;
            info.name = "estado";
            info.namespace= "http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio";
        }
        if(propertyIndex==3)
        {
            info.type = PropertyInfo.INTEGER_CLASS;
            info.name = "id";
            info.namespace= "http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio";
        }
        if(propertyIndex==4)
        {
            info.type = PropertyInfo.STRING_CLASS;
            info.name = "nombre";
            info.namespace= "http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio";
        }
        if(propertyIndex==5)
        {
            info.type = PropertyInfo.STRING_CLASS;
            info.name = "precioActual";
            info.namespace= "http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio";
        }
    }
    
    @Override
    public void setProperty(int arg0, java.lang.Object arg1)
    {
    }

}
