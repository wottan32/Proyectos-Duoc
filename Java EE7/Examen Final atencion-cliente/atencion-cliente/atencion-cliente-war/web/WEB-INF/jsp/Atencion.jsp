<jsp:include page="../jsp/comun/header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

    jQuery(document).ready(function () {
        jQuery("#tipo_servicio").change(function () {
            if (jQuery("#tipo_servicio").val() == 4) {
                jQuery("#comentario").removeAttr("disabled");
            } else {
                jQuery("#comentario").attr("disabled", "disabled");
            }

        })
    });

</script>

<h1> Solicitar Atención</h1>
<c:url var="atencionURL" value="/atencion" ></c:url>
    <form action="${atencionURL}" method="POST">
    <table style="width: 100%;     border-collapse: separate; border-spacing: 10px;" >
        <tr>
            <td><input type="text" class="form-control" id="inputNombre" placeholder="Nombre" name="nombre" required="" ></td>
            <td><input type="radio" name="idSeccion" value="0">Es cliente</td>
        </tr>
        <tr>
            <td><input type="text" class="form-control" id="inputRut" placeholder="Rut" name="inputRut" required=""></td>
            <td><input type="radio" name="idSeccion" value="0" >No es cliente</td>
        </tr>
        <tr>
            <td colspan="2" >
                <select id="tipo_servicio" class="form-control"  style="width: 70%" >
                    <c:forEach items="${servicios}" var="item">
                        <option value="${item.idServicio}">${item.descripcion}</option>
                    </c:forEach>
                </select>
            </td>      
        </tr>
        <tr>
            <td colspan="2">
                <textarea id="comentario" disabled      cols="40" rows="5" class="form-control" name="comentario" style="width: 70%">Comentario</textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2"><button type="submit" class="btn btn-info" name="solicitar">Solicitar Número</button>
            </td>
        </tr>
    </table>
</form>
<jsp:include page="../jsp/comun/footer.jsp" />