/**
 * Surtidor.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package org.datacontract.schemas._2004._07.TecnoBencina_Negocio;

public class Surtidor  implements java.io.Serializable {
    private org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Combustible[] combustibles;

    private java.lang.Boolean estado;

    private java.lang.Integer id;

    public Surtidor() {
    }

    public Surtidor(
           org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Combustible[] combustibles,
           java.lang.Boolean estado,
           java.lang.Integer id) {
           this.combustibles = combustibles;
           this.estado = estado;
           this.id = id;
    }


    /**
     * Gets the combustibles value for this Surtidor.
     * 
     * @return combustibles
     */
    public org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Combustible[] getCombustibles() {
        return combustibles;
    }


    /**
     * Sets the combustibles value for this Surtidor.
     * 
     * @param combustibles
     */
    public void setCombustibles(org.datacontract.schemas._2004._07.TecnoBencina_Negocio.Combustible[] combustibles) {
        this.combustibles = combustibles;
    }


    /**
     * Gets the estado value for this Surtidor.
     * 
     * @return estado
     */
    public java.lang.Boolean getEstado() {
        return estado;
    }


    /**
     * Sets the estado value for this Surtidor.
     * 
     * @param estado
     */
    public void setEstado(java.lang.Boolean estado) {
        this.estado = estado;
    }


    /**
     * Gets the id value for this Surtidor.
     * 
     * @return id
     */
    public java.lang.Integer getId() {
        return id;
    }


    /**
     * Sets the id value for this Surtidor.
     * 
     * @param id
     */
    public void setId(java.lang.Integer id) {
        this.id = id;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof Surtidor)) return false;
        Surtidor other = (Surtidor) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.combustibles==null && other.getCombustibles()==null) || 
             (this.combustibles!=null &&
              java.util.Arrays.equals(this.combustibles, other.getCombustibles()))) &&
            ((this.estado==null && other.getEstado()==null) || 
             (this.estado!=null &&
              this.estado.equals(other.getEstado()))) &&
            ((this.id==null && other.getId()==null) || 
             (this.id!=null &&
              this.id.equals(other.getId())));
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
        if (getCombustibles() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getCombustibles());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getCombustibles(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        if (getEstado() != null) {
            _hashCode += getEstado().hashCode();
        }
        if (getId() != null) {
            _hashCode += getId().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(Surtidor.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "Surtidor"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("combustibles");
        elemField.setXmlName(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "combustibles"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "Combustible"));
        elemField.setMinOccurs(0);
        elemField.setNillable(true);
        elemField.setItemQName(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "Combustible"));
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
