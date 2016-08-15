/**
 * Venta.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package org.datacontract.schemas._2004._07.TecnoBencina_Negocio;

public class Venta  implements java.io.Serializable {
    private org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Anulacion anulacion;

    private org.datacontract.schemas._2004._07.TecnoBencina_Negocio.BeneficiarioCredito beneficiarioCredito;

    private org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Combustible combustible;

    private org.datacontract.schemas._2004._07.TecnoBencina_Negocio.EstadoVenta estado;

    private java.util.Calendar fecha;

    private java.lang.Integer id;

    private java.lang.Integer litros;

    private java.lang.Integer monto;

    private org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Surtidor surtidor;

    private org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Usuario usuario;

    private org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Vale vale;

    public Venta() {
    }

    public Venta(
           org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Anulacion anulacion,
           org.datacontract.schemas._2004._07.TecnoBencina_Negocio.BeneficiarioCredito beneficiarioCredito,
           org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Combustible combustible,
           org.datacontract.schemas._2004._07.TecnoBencina_Negocio.EstadoVenta estado,
           java.util.Calendar fecha,
           java.lang.Integer id,
           java.lang.Integer litros,
           java.lang.Integer monto,
           org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Surtidor surtidor,
           org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Usuario usuario,
           org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Vale vale) {
           this.anulacion = anulacion;
           this.beneficiarioCredito = beneficiarioCredito;
           this.combustible = combustible;
           this.estado = estado;
           this.fecha = fecha;
           this.id = id;
           this.litros = litros;
           this.monto = monto;
           this.surtidor = surtidor;
           this.usuario = usuario;
           this.vale = vale;
    }


    /**
     * Gets the anulacion value for this Venta.
     * 
     * @return anulacion
     */
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Anulacion getAnulacion() {
        return anulacion;
    }


    /**
     * Sets the anulacion value for this Venta.
     * 
     * @param anulacion
     */
    public void setAnulacion(org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Anulacion anulacion) {
        this.anulacion = anulacion;
    }


    /**
     * Gets the beneficiarioCredito value for this Venta.
     * 
     * @return beneficiarioCredito
     */
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.BeneficiarioCredito getBeneficiarioCredito() {
        return beneficiarioCredito;
    }


    /**
     * Sets the beneficiarioCredito value for this Venta.
     * 
     * @param beneficiarioCredito
     */
    public void setBeneficiarioCredito(org.datacontract.schemas._2004._07.TecnoBencina_Negocio.BeneficiarioCredito beneficiarioCredito) {
        this.beneficiarioCredito = beneficiarioCredito;
    }


    /**
     * Gets the combustible value for this Venta.
     * 
     * @return combustible
     */
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Combustible getCombustible() {
        return combustible;
    }


    /**
     * Sets the combustible value for this Venta.
     * 
     * @param combustible
     */
    public void setCombustible(org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Combustible combustible) {
        this.combustible = combustible;
    }


    /**
     * Gets the estado value for this Venta.
     * 
     * @return estado
     */
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.EstadoVenta getEstado() {
        return estado;
    }


    /**
     * Sets the estado value for this Venta.
     * 
     * @param estado
     */
    public void setEstado(org.datacontract.schemas._2004._07.TecnoBencina_Negocio.EstadoVenta estado) {
        this.estado = estado;
    }


    /**
     * Gets the fecha value for this Venta.
     * 
     * @return fecha
     */
    public java.util.Calendar getFecha() {
        return fecha;
    }


    /**
     * Sets the fecha value for this Venta.
     * 
     * @param fecha
     */
    public void setFecha(java.util.Calendar fecha) {
        this.fecha = fecha;
    }


    /**
     * Gets the id value for this Venta.
     * 
     * @return id
     */
    public java.lang.Integer getId() {
        return id;
    }


    /**
     * Sets the id value for this Venta.
     * 
     * @param id
     */
    public void setId(java.lang.Integer id) {
        this.id = id;
    }


    /**
     * Gets the litros value for this Venta.
     * 
     * @return litros
     */
    public java.lang.Integer getLitros() {
        return litros;
    }


    /**
     * Sets the litros value for this Venta.
     * 
     * @param litros
     */
    public void setLitros(java.lang.Integer litros) {
        this.litros = litros;
    }


    /**
     * Gets the monto value for this Venta.
     * 
     * @return monto
     */
    public java.lang.Integer getMonto() {
        return monto;
    }


    /**
     * Sets the monto value for this Venta.
     * 
     * @param monto
     */
    public void setMonto(java.lang.Integer monto) {
        this.monto = monto;
    }


    /**
     * Gets the surtidor value for this Venta.
     * 
     * @return surtidor
     */
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Surtidor getSurtidor() {
        return surtidor;
    }


    /**
     * Sets the surtidor value for this Venta.
     * 
     * @param surtidor
     */
    public void setSurtidor(org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Surtidor surtidor) {
        this.surtidor = surtidor;
    }


    /**
     * Gets the usuario value for this Venta.
     * 
     * @return usuario
     */
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Usuario getUsuario() {
        return usuario;
    }


    /**
     * Sets the usuario value for this Venta.
     * 
     * @param usuario
     */
    public void setUsuario(org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Usuario usuario) {
        this.usuario = usuario;
    }


    /**
     * Gets the vale value for this Venta.
     * 
     * @return vale
     */
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Vale getVale() {
        return vale;
    }


    /**
     * Sets the vale value for this Venta.
     * 
     * @param vale
     */
    public void setVale(org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Vale vale) {
        this.vale = vale;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof Venta)) return false;
        Venta other = (Venta) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.anulacion==null && other.getAnulacion()==null) || 
             (this.anulacion!=null &&
              this.anulacion.equals(other.getAnulacion()))) &&
            ((this.beneficiarioCredito==null && other.getBeneficiarioCredito()==null) || 
             (this.beneficiarioCredito!=null &&
              this.beneficiarioCredito.equals(other.getBeneficiarioCredito()))) &&
            ((this.combustible==null && other.getCombustible()==null) || 
             (this.combustible!=null &&
              this.combustible.equals(other.getCombustible()))) &&
            ((this.estado==null && other.getEstado()==null) || 
             (this.estado!=null &&
              this.estado.equals(other.getEstado()))) &&
            ((this.fecha==null && other.getFecha()==null) || 
             (this.fecha!=null &&
              this.fecha.equals(other.getFecha()))) &&
            ((this.id==null && other.getId()==null) || 
             (this.id!=null &&
              this.id.equals(other.getId()))) &&
            ((this.litros==null && other.getLitros()==null) || 
             (this.litros!=null &&
              this.litros.equals(other.getLitros()))) &&
            ((this.monto==null && other.getMonto()==null) || 
             (this.monto!=null &&
              this.monto.equals(other.getMonto()))) &&
            ((this.surtidor==null && other.getSurtidor()==null) || 
             (this.surtidor!=null &&
              this.surtidor.equals(other.getSurtidor()))) &&
            ((this.usuario==null && other.getUsuario()==null) || 
             (this.usuario!=null &&
              this.usuario.equals(other.getUsuario()))) &&
            ((this.vale==null && other.getVale()==null) || 
             (this.vale!=null &&
              this.vale.equals(other.getVale())));
        __equalsCalc = null;
        return _equals;
    }

    private boolean __hashCodeCalc = false;
    public synchronized int hashCode() {
        if (__hashCodeCalc) {
            return 0;
        }
        __hashCodeCalc = true;
        int _hashCode = 1;
        if (getAnulacion() != null) {
            _hashCode += getAnulacion().hashCode();
        }
        if (getBeneficiarioCredito() != null) {
            _hashCode += getBeneficiarioCredito().hashCode();
        }
        if (getCombustible() != null) {
            _hashCode += getCombustible().hashCode();
        }
        if (getEstado() != null) {
            _hashCode += getEstado().hashCode();
        }
        if (getFecha() != null) {
            _hashCode += getFecha().hashCode();
        }
        if (getId() != null) {
            _hashCode += getId().hashCode();
        }
        if (getLitros() != null) {
            _hashCode += getLitros().hashCode();
        }
        if (getMonto() != null) {
            _hashCode += getMonto().hashCode();
        }
        if (getSurtidor() != null) {
            _hashCode += getSurtidor().hashCode();
        }
        if (getUsuario() != null) {
            _hashCode += getUsuario().hashCode();
        }
        if (getVale() != null) {
            _hashCode += getVale().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(Venta.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "Venta"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("anulacion");
        elemField.setXmlName(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "anulacion"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "Anulacion"));
        elemField.setMinOccurs(0);
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("beneficiarioCredito");
        elemField.setXmlName(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "beneficiarioCredito"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "BeneficiarioCredito"));
        elemField.setMinOccurs(0);
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("combustible");
        elemField.setXmlName(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "combustible"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "Combustible"));
        elemField.setMinOccurs(0);
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("estado");
        elemField.setXmlName(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "estado"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "EstadoVenta"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("fecha");
        elemField.setXmlName(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "fecha"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "dateTime"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("id");
        elemField.setXmlName(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "id"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("litros");
        elemField.setXmlName(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "litros"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("monto");
        elemField.setXmlName(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "monto"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("surtidor");
        elemField.setXmlName(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "surtidor"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "Surtidor"));
        elemField.setMinOccurs(0);
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("usuario");
        elemField.setXmlName(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "usuario"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "Usuario"));
        elemField.setMinOccurs(0);
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("vale");
        elemField.setXmlName(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "vale"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "Vale"));
        elemField.setMinOccurs(0);
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
    }

    /**
     * Return type metadata object
     */
    public static org.apache.axis.description.TypeDesc getTypeDesc() {
        return typeDesc;
    }

    /**
     * Get Custom Serializer
     */
    public static org.apache.axis.encoding.Serializer getSerializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanSerializer(
            _javaType, _xmlType, typeDesc);
    }

    /**
     * Get Custom Deserializer
     */
    public static org.apache.axis.encoding.Deserializer getDeserializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanDeserializer(
            _javaType, _xmlType, typeDesc);
    }

}
