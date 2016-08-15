/**
 * Talonario.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package org.datacontract.schemas._2004._07.TecnoBencina_Negocio;

public class Talonario  implements java.io.Serializable {
    private org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Empresa empresa;

    private java.lang.Boolean estado;

    private java.util.Calendar fechaEntrega;

    private java.lang.Integer id;

    private java.lang.Integer numComprobanteTransaccion;

    private org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Vale[] vales;

    public Talonario() {
    }

    public Talonario(
           org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Empresa empresa,
           java.lang.Boolean estado,
           java.util.Calendar fechaEntrega,
           java.lang.Integer id,
           java.lang.Integer numComprobanteTransaccion,
           org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Vale[] vales) {
           this.empresa = empresa;
           this.estado = estado;
           this.fechaEntrega = fechaEntrega;
           this.id = id;
           this.numComprobanteTransaccion = numComprobanteTransaccion;
           this.vales = vales;
    }


    /**
     * Gets the empresa value for this Talonario.
     * 
     * @return empresa
     */
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Empresa getEmpresa() {
        return empresa;
    }


    /**
     * Sets the empresa value for this Talonario.
     * 
     * @param empresa
     */
    public void setEmpresa(org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Empresa empresa) {
        this.empresa = empresa;
    }


    /**
     * Gets the estado value for this Talonario.
     * 
     * @return estado
     */
    public java.lang.Boolean getEstado() {
        return estado;
    }


    /**
     * Sets the estado value for this Talonario.
     * 
     * @param estado
     */
    public void setEstado(java.lang.Boolean estado) {
        this.estado = estado;
    }


    /**
     * Gets the fechaEntrega value for this Talonario.
     * 
     * @return fechaEntrega
     */
    public java.util.Calendar getFechaEntrega() {
        return fechaEntrega;
    }


    /**
     * Sets the fechaEntrega value for this Talonario.
     * 
     * @param fechaEntrega
     */
    public void setFechaEntrega(java.util.Calendar fechaEntrega) {
        this.fechaEntrega = fechaEntrega;
    }


    /**
     * Gets the id value for this Talonario.
     * 
     * @return id
     */
    public java.lang.Integer getId() {
        return id;
    }


    /**
     * Sets the id value for this Talonario.
     * 
     * @param id
     */
    public void setId(java.lang.Integer id) {
        this.id = id;
    }


    /**
     * Gets the numComprobanteTransaccion value for this Talonario.
     * 
     * @return numComprobanteTransaccion
     */
    public java.lang.Integer getNumComprobanteTransaccion() {
        return numComprobanteTransaccion;
    }


    /**
     * Sets the numComprobanteTransaccion value for this Talonario.
     * 
     * @param numComprobanteTransaccion
     */
    public void setNumComprobanteTransaccion(java.lang.Integer numComprobanteTransaccion) {
        this.numComprobanteTransaccion = numComprobanteTransaccion;
    }


    /**
     * Gets the vales value for this Talonario.
     * 
     * @return vales
     */
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Vale[] getVales() {
        return vales;
    }


    /**
     * Sets the vales value for this Talonario.
     * 
     * @param vales
     */
    public void setVales(org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Vale[] vales) {
        this.vales = vales;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof Talonario)) return false;
        Talonario other = (Talonario) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.empresa==null && other.getEmpresa()==null) || 
             (this.empresa!=null &&
              this.empresa.equals(other.getEmpresa()))) &&
            ((this.estado==null && other.getEstado()==null) || 
             (this.estado!=null &&
              this.estado.equals(other.getEstado()))) &&
            ((this.fechaEntrega==null && other.getFechaEntrega()==null) || 
             (this.fechaEntrega!=null &&
              this.fechaEntrega.equals(other.getFechaEntrega()))) &&
            ((this.id==null && other.getId()==null) || 
             (this.id!=null &&
              this.id.equals(other.getId()))) &&
            ((this.numComprobanteTransaccion==null && other.getNumComprobanteTransaccion()==null) || 
             (this.numComprobanteTransaccion!=null &&
              this.numComprobanteTransaccion.equals(other.getNumComprobanteTransaccion()))) &&
            ((this.vales==null && other.getVales()==null) || 
             (this.vales!=null &&
              java.util.Arrays.equals(this.vales, other.getVales())));
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
        if (getEmpresa() != null) {
            _hashCode += getEmpresa().hashCode();
        }
        if (getEstado() != null) {
            _hashCode += getEstado().hashCode();
        }
        if (getFechaEntrega() != null) {
            _hashCode += getFechaEntrega().hashCode();
        }
        if (getId() != null) {
            _hashCode += getId().hashCode();
        }
        if (getNumComprobanteTransaccion() != null) {
            _hashCode += getNumComprobanteTransaccion().hashCode();
        }
        if (getVales() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getVales());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getVales(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(Talonario.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "Talonario"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("empresa");
        elemField.setXmlName(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "empresa"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "Empresa"));
        elemField.setMinOccurs(0);
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("estado");
        elemField.setXmlName(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "estado"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "boolean"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("fechaEntrega");
        elemField.setXmlName(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "fechaEntrega"));
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
        elemField.setFieldName("numComprobanteTransaccion");
        elemField.setXmlName(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "numComprobanteTransaccion"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("vales");
        elemField.setXmlName(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "vales"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "Vale"));
        elemField.setMinOccurs(0);
        elemField.setNillable(true);
        elemField.setItemQName(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "Vale"));
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
