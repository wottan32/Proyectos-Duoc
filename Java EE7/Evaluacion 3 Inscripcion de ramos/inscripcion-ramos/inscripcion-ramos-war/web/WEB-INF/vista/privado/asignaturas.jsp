<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="../comun/header.jsp" >
    <jsp:param name="tituloPagina" value="Asignaturas Disponibles" />
</jsp:include>
<%--Mensajes de Exito--%>
<c:if test="${not empty sessionScope.mensajeExito}">   
    <div class="alert alert-success">
        <strong>Exito!</strong>    <c:out value="${sessionScope.mensajeExito}" />    
    </div>
</c:if>



<table class="table table-bordered table-hover">
    <tr class="success">
        <th>CÓDIGO</th>
        <th>NOMBRE</th>
        <th>NO. CR&Eacute;DITOS</th>
        <th>SECCIONES</th>
        <th></th>
    </tr>
    <c:forEach items="${asignaturas}" var="item">
        <tr>
            <td>
                <c:out value="${item.id}" />
            </td>
            <td>
                <c:out value="${item.nombre}" />
            </td>
            <td>
                <c:out value="${item.creditos}" />
            </td>
            <td>
                <c:out value="${fn:length(item.secciones)}" />
            </td>
            <td>
                <c:url var="urlSecciones" value="/privado/ListadoSecciones" >
                    <c:param name="accion" value="listarSecciones" />
                    <c:param name="id" value="${item.id}" />
                </c:url>
                <a  class="btn btn-primary" href="${urlSecciones}" >Ver Secciones</a>
            </td>
        </tr>
    </c:forEach>
</table>


<jsp:include page="../comun/footer.jsp" />