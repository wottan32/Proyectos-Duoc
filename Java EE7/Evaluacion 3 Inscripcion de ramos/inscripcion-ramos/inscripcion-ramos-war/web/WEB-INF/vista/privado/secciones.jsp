<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../comun/header.jsp" >
    <jsp:param name="tituloPagina" value="Secciones para ${secciones[0].asignatura.nombre}" />
</jsp:include>

<%--Mensajes de error--%>
<c:if test="${not empty sessionScope.errorSeccion}">  
    <div class="alert alert-danger">
        <strong>Error!</strong> <c:out value="${sessionScope.errorSeccion}" /> 
    </div>  
</c:if>

<c:url var="inscripcionAsigURL" value="/privado/InscripcionAsignatura" />
<form action="${inscripcionAsigURL}" method="POST">
    <table class="table table-bordered table-hover">
        <tr class="success">
            <th>CÓDIGO</th>
            <th>NOMBRE PROFESOR</th>
            <th>HORARIO</th>
            <th></th>
        </tr>

        <c:forEach items="${secciones}" var="item">
            <tr>
                <td>
                    <input type="hidden" value="${sessionScope.idUsuario}" name="idAlumno" />
                    <input type="hidden" value="${idAsignatura}" name="idAsignatura" />
                    <c:out value="${item.id}" />
                </td>
                <td>
                    <c:out value="${item.nombre_profesor}" />
                </td>
                <td>
                    <c:out value="${item.horario}" />
                </td>

                <td>
                    <c:url var="chacked" value="" />
                    <c:forEach items="${item.alumnos}" var="alumno">
                        <c:if test="${fn:contains(alumno.id, sessionScope.idUsuario)}">                                    
                            <c:url var="chacked" value=" checked=true" />
                        </c:if>
                    </c:forEach>
                    <input type="radio" name="idSeccion" value="${item.id}" <c:out value="${chacked}" /> />
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="4">
                <button type="submit" class="btn btn-success" name="enviar">Inscribir</button>
                <a class="btn btn-success" href="<%= request.getContextPath()%>/privado/ListarAsignaturas">Cancelar</a>
                
            </td>
        </tr>
    </table>
</form>



<jsp:include page="../comun/footer.jsp" />
