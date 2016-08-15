/**
 * ServicioLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package org.tempuri;

public class ServicioLocator extends org.apache.axis.client.Service implements org.tempuri.Servicio {

    public ServicioLocator() {
    }


    public ServicioLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public ServicioLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for BasicHttpBinding_IServicio
    private java.lang.String BasicHttpBinding_IServicio_address = "http://localhost/tecnobencina/Servicio.svc";

    public java.lang.String getBasicHttpBinding_IServicioAddress() {
        return BasicHttpBinding_IServicio_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String BasicHttpBinding_IServicioWSDDServiceName = "BasicHttpBinding_IServicio";

    public java.lang.String getBasicHttpBinding_IServicioWSDDServiceName() {
        return BasicHttpBinding_IServicioWSDDServiceName;
    }

    public void setBasicHttpBinding_IServicioWSDDServiceName(java.lang.String name) {
        BasicHttpBinding_IServicioWSDDServiceName = name;
    }

    public org.tempuri.IServicio getBasicHttpBinding_IServicio() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(BasicHttpBinding_IServicio_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getBasicHttpBinding_IServicio(endpoint);
    }

    public org.tempuri.IServicio getBasicHttpBinding_IServicio(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            org.tempuri.BasicHttpBinding_IServicioStub _stub = new org.tempuri.BasicHttpBinding_IServicioStub(portAddress, this);
            _stub.setPortName(getBasicHttpBinding_IServicioWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setBasicHttpBinding_IServicioEndpointAddress(java.lang.String address) {
        BasicHttpBinding_IServicio_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (org.tempuri.IServicio.class.isAssignableFrom(serviceEndpointInterface)) {
                org.tempuri.BasicHttpBinding_IServicioStub _stub = new org.tempuri.BasicHttpBinding_IServicioStub(new java.net.URL(BasicHttpBinding_IServicio_address), this);
                _stub.setPortName(getBasicHttpBinding_IServicioWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("BasicHttpBinding_IServicio".equals(inputPortName)) {
            return getBasicHttpBinding_IServicio();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://tempuri.org/", "Servicio");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://tempuri.org/", "BasicHttpBinding_IServicio"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("BasicHttpBinding_IServicio".equals(portName)) {
            setBasicHttpBinding_IServicioEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
