/**
 * Combustible.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package org.datacontract.schemas._2004._07.TecnoBencina_Negocio;

public class Combustible  implements java.io.Serializable {
    private java.math.BigDecimal cantidadPorSurtidor;

    private java.math.BigDecimal cantidadTotal;

    private java.lang.Boolean estado;

    private java.lang.Integer id;

    private java.lang.String nombre;

    private java.math.BigDecimal precioActual;

    public Combustible() {
    }

    public Combustible(
           java.math.BigDecimal cantidadPorSurtidor,
           java.math.BigDecimal cantidadTotal,
           java.lang.Boolean estado,
           java.lang.Integer id,
           java.lang.String nombre,
           java.math.BigDecimal precioActual) {
           this.cantidadPorSurtidor = cantidadPorSurtidor;
           this.cantidadTotal = cantidadTotal;
           this.estado = estado;
           this.id = id;
           this.nombre = nombre;
           this.precioActual = precioActual;
    }


    /**
     * Gets the cantidadPorSurtidor value for this Combustible.
     * 
     * @return cantidadPorSurtidor
     */
    public java.math.BigDecimal getCantidadPorSurtidor() {
        return cantidadPorSurtidor;
    }


    /**
     * Sets the cantidadPorSurtidor value for this Combustible.
     * 
     * @param cantidadPorSurtidor
     */
    public void setCantidadPorSurtidor(java.math.BigDecimal cantidadPorSurtidor) {
        this.cantidadPorSurtidor = cantidadPorSurtidor;
    }


    /**
     * Gets the cantidadTotal value for this Combustible.
     * 
     * @return cantidadTotal
     */
    public java.math.BigDecimal getCantidadTotal() {
        return cantidadTotal;
    }


    /**
     * Sets the cantidadTotal value for this Combustible.
     * 
     * @param cantidadTotal
     */
    public void setCantidadTotal(java.math.BigDecimal cantidadTotal) {
        this.cantidadTotal = cantidadTotal;
    }


    /**
     * Gets the estado value for this Combustible.
     * 
     * @return estado
     */
    public java.lang.Boolean getEstado() {
        return estado;
    }


    /**
     * Sets the estado value for this Combustible.
     * 
     * @param estado
     */
    public void setEstado(java.lang.Boolean estado) {
        this.estado = estado;
    }


    /**
     * Gets the id value for this Combustible.
     * 
     * @return id
     */
    public java.lang.Integer getId() {
        return id;
    }


    /**
     * Sets the id value for this Combustible.
     * 
     * @param id
     */
    public void setId(java.lang.Integer id) {
        this.id = id;
    }


    /**
     * Gets the nombre value for this Combustible.
     * 
     * @return nombre
     */
    public java.lang.String getNombre() {
        return nombre;
    }


    /**
     * Sets the nombre value for this Combustible.
     * 
     * @param nombre
     */
    public void setNombre(java.lang.String nombre) {
        this.nombre = nombre;
    }


    /**
     * Gets the precioActual value for this Combustible.
     * 
     * @return precioActual
     */
    public java.math.BigDecimal getPrecioActual() {
        return precioActual;
    }


    /**
     * Sets the precioActual value for this Combustible.
     * 
     * @param precioActual
     */
    public void setPrecioActual(java.math.BigDecimal precioActual) {
        this.precioActual = precioActual;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof Combustible)) return false;
        Combustible other = (Combustible) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.cantidadPorSurtidor==null && other.getCantidadPorSurtidor()==null) || 
             (this.cantidadPorSurtidor!=null &&
              this.cantidadPorSurtidor.equals(other.getCantidadPorSurtidor()))) &&
            ((this.cantidadTotal==null && other.getCantidadTotal()==null) || 
             (this.cantidadTotal!=null &&
              this.cantidadTotal.equals(other.getCantidadTotal()))) &&
            ((this.estado==null && other.getEstado()==null) || 
             (this.estado!=null &&
              this.estado.equals(other.getEstado()))) &&
            ((this.id==null && other.getId()==null) || 
             (this.id!=null &&
              this.id.equals(other.getId()))) &&
            ((this.nombre==null && other.getNombre()==null) || 
             (this.nombre!=null &&
              this.nombre.equals(other.getNombre()))) &&
            ((this.precioActual==null && other.getPrecioActual()==null) || 
             (this.precioActual!=null &&
              this.precioActual.equals(other.getPrecioActual())));
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
        if (getCantidadPorSurtidor() != null) {
            _hashCode += getCantidadPorSurtidor().hashCode();
        }
        if (getCantidadTotal() != null) {
            _hashCode += getCantidadTotal().hashCode();
        }
        if (getEstado() != null) {
            _hashCode += getEstado().hashCode();
        }
        if (getId() != null) {
            _hashCode += getId().hashCode();
        }
        if (getNombre() != null) {
            _hashCode += getNombre().hashCode();
        }
        if (getPrecioActual() != null) {
            _hashCode += getPrecioActual().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(Combustible.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "Combustible"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("cantidadPorSurtidor");
        elemField.setXmlName(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "cantidadPorSurtidor"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "decimal"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("cantidadTotal");
        elemField.setXmlName(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "cantidadTotal"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "decimal"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("estado");
        elemField.setXmlName(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "estado"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "boolean"));
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
        elemField.setFieldName("nombre");
        elemField.setXmlName(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "nombre"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("precioActual");
        elemField.setXmlName(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "precioActual"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "decimal"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
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
