/**
 * BeneficiarioCredito.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package org.datacontract.schemas._2004._07.TecnoBencina_Negocio;

public class BeneficiarioCredito  implements java.io.Serializable {
    private java.lang.String dv;

    private java.lang.Boolean estado;

    private java.lang.Integer id;

    private java.util.Calendar limiteVigencia;

    private java.lang.String nombreEmpresa;

    private java.lang.Integer rut;

    private java.lang.Integer topeLitros;

    public BeneficiarioCredito() {
    }

    public BeneficiarioCredito(
           java.lang.String dv,
           java.lang.Boolean estado,
           java.lang.Integer id,
           java.util.Calendar limiteVigencia,
           java.lang.String nombreEmpresa,
           java.lang.Integer rut,
           java.lang.Integer topeLitros) {
           this.dv = dv;
           this.estado = estado;
           this.id = id;
           this.limiteVigencia = limiteVigencia;
           this.nombreEmpresa = nombreEmpresa;
           this.rut = rut;
           this.topeLitros = topeLitros;
    }


    /**
     * Gets the dv value for this BeneficiarioCredito.
     * 
     * @return dv
     */
    public java.lang.String getDv() {
        return dv;
    }


    /**
     * Sets the dv value for this BeneficiarioCredito.
     * 
     * @param dv
     */
    public void setDv(java.lang.String dv) {
        this.dv = dv;
    }


    /**
     * Gets the estado value for this BeneficiarioCredito.
     * 
     * @return estado
     */
    public java.lang.Boolean getEstado() {
        return estado;
    }


    /**
     * Sets the estado value for this BeneficiarioCredito.
     * 
     * @param estado
     */
    public void setEstado(java.lang.Boolean estado) {
        this.estado = estado;
    }


    /**
     * Gets the id value for this BeneficiarioCredito.
     * 
     * @return id
     */
    public java.lang.Integer getId() {
        return id;
    }


    /**
     * Sets the id value for this BeneficiarioCredito.
     * 
     * @param id
     */
    public void setId(java.lang.Integer id) {
        this.id = id;
    }


    /**
     * Gets the limiteVigencia value for this BeneficiarioCredito.
     * 
     * @return limiteVigencia
     */
    public java.util.Calendar getLimiteVigencia() {
        return limiteVigencia;
    }


    /**
     * Sets the limiteVigencia value for this BeneficiarioCredito.
     * 
     * @param limiteVigencia
     */
    public void setLimiteVigencia(java.util.Calendar limiteVigencia) {
        this.limiteVigencia = limiteVigencia;
    }


    /**
     * Gets the nombreEmpresa value for this BeneficiarioCredito.
     * 
     * @return nombreEmpresa
     */
    public java.lang.String getNombreEmpresa() {
        return nombreEmpresa;
    }


    /**
     * Sets the nombreEmpresa value for this BeneficiarioCredito.
     * 
     * @param nombreEmpresa
     */
    public void setNombreEmpresa(java.lang.String nombreEmpresa) {
        this.nombreEmpresa = nombreEmpresa;
    }


    /**
     * Gets the rut value for this BeneficiarioCredito.
     * 
     * @return rut
     */
    public java.lang.Integer getRut() {
        return rut;
    }


    /**
     * Sets the rut value for this BeneficiarioCredito.
     * 
     * @param rut
     */
    public void setRut(java.lang.Integer rut) {
        this.rut = rut;
    }


    /**
     * Gets the topeLitros value for this BeneficiarioCredito.
     * 
     * @return topeLitros
     */
    public java.lang.Integer getTopeLitros() {
        return topeLitros;
    }


    /**
     * Sets the topeLitros value for this BeneficiarioCredito.
     * 
     * @param topeLitros
     */
    public void setTopeLitros(java.lang.Integer topeLitros) {
        this.topeLitros = topeLitros;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof BeneficiarioCredito)) return false;
        BeneficiarioCredito other = (BeneficiarioCredito) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.dv==null && other.getDv()==null) || 
             (this.dv!=null &&
              this.dv.equals(other.getDv()))) &&
            ((this.estado==null && other.getEstado()==null) || 
             (this.estado!=null &&
              this.estado.equals(other.getEstado()))) &&
            ((this.id==null && other.getId()==null) || 
             (this.id!=null &&
              this.id.equals(other.getId()))) &&
            ((this.limiteVigencia==null && other.getLimiteVigencia()==null) || 
             (this.limiteVigencia!=null &&
              this.limiteVigencia.equals(other.getLimiteVigencia()))) &&
            ((this.nombreEmpresa==null && other.getNombreEmpresa()==null) || 
             (this.nombreEmpresa!=null &&
              this.nombreEmpresa.equals(other.getNombreEmpresa()))) &&
            ((this.rut==null && other.getRut()==null) || 
             (this.rut!=null &&
              this.rut.equals(other.getRut()))) &&
            ((this.topeLitros==null && other.getTopeLitros()==null) || 
             (this.topeLitros!=null &&
              this.topeLitros.equals(other.getTopeLitros())));
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
        if (getDv() != null) {
            _hashCode += getDv().hashCode();
        }
        if (getEstado() != null) {
            _hashCode += getEstado().hashCode();
        }
        if (getId() != null) {
            _hashCode += getId().hashCode();
        }
        if (getLimiteVigencia() != null) {
            _hashCode += getLimiteVigencia().hashCode();
        }
        if (getNombreEmpresa() != null) {
            _hashCode += getNombreEmpresa().hashCode();
        }
        if (getRut() != null) {
            _hashCode += getRut().hashCode();
        }
        if (getTopeLitros() != null) {
            _hashCode += getTopeLitros().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(BeneficiarioCredito.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "BeneficiarioCredito"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("dv");
        elemField.setXmlName(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "dv"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
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
        elemField.setFieldName("id");
        elemField.setXmlName(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "id"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("limiteVigencia");
        elemField.setXmlName(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "limiteVigencia"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "dateTime"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("nombreEmpresa");
        elemField.setXmlName(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "nombreEmpresa"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("rut");
        elemField.setXmlName(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "rut"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("topeLitros");
        elemField.setXmlName(new javax.xml.namespace.QName("http://schemas.datacontract.org/2004/07/TecnoBencina.Negocio", "topeLitros"));
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
