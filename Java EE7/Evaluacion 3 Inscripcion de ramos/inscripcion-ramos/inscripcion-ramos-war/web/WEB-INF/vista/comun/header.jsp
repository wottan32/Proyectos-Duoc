<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Zonda Institute</title>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="row text-center">
                <div class="col-xs-12">
                    <c:url var="urlLogout" value="/login" >
                        <c:param name="accion" value="Logout" />

                    </c:url>

                    <table style="width: 100%">
                        <tr>
                            <td><h1>Zonda Institute</h1></td>
                        </tr>
                        <tr>    
                            <td style="text-align: right">                            
                                <c:if test="${not empty sessionScope.autenticado}">                                    
                                    Usuario : <c:out value="${sessionScope.autenticado}" /> 
                                    <a  class="btn btn-primary" href="${urlLogout}" >Cerrar Sesion</a>                                    
                                </c:if>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <h2>
                        <c:out value="${param.tituloPagina}" />
                    </h2>
                </div>
            </div>
        </div>
        <div class="container">