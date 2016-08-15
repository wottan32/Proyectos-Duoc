<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../vista/comun/header.jsp" >
    <jsp:param name="tituloPagina" value="Acceso" />
</jsp:include>      


<%--Mensajes de error--%>
<c:if test="${not empty sessionScope.mensajesdeerrores}">  
    <div class="alert alert-danger">
        <strong>Error!</strong> <c:out value="${sessionScope.mensajesdeerrores}" /> 
    </div>  
</c:if>

<c:url var="loginURL" value="/login" />


<form class="form-horizontal" action="${loginURL}" method="POST">
    <div class="form-group">
        <label for="inputText3" class="col-sm-2 control-label">Usuario</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="inputEmail3" placeholder="Login" name="login" >
        </div>
    </div>
    <div class="form-group">
        <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
        <div class="col-sm-10">
            <input type="password" class="form-control" id="inputPassword3" placeholder="Password" name="password">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-success" name="enviar">Log in</button>
            <button type="reset" class="btn btn-default" name="limpiar">Limpiar</button>
        </div>
    </div>



</form>
<jsp:include page="../vista/comun/footer.jsp" />