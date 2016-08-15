@section('title', 'Listado de Postulaciones')
@extends('shared.master')
@section('scripts')
@include('shared.scripts.theme')
<script src="{{ asset('vendor/jquery-rut-plugin/jquery.Rut.js') }}"></script>
<script>

$(document).ready(function () {
    $(document).on('click', "button[name='eliminar']", function () {
        var idPostulacion = $(this).data("id-postulacion");
        jQuery(".modal-footer input[name='idPostulacion']").val(idPostulacion);
    });

    $(".table tbody tr td:first-child").each(function () {
        var mantisa = $(this).text();
        var rut = mantisa + '-' + $.Rut.getDigito(mantisa)
        var rutFormateado = $.Rut.formatear(rut, true);
        $(this).text(rutFormateado);
    });

    $(document).on('click', "button[name='editar']", function () {
        var idPostulacion = jQuery(this).data("id-postulacion");
        var path = "{{ action('Postulacion\\PostulacionController@getEdit')}}";
        window.location.href = path + '?id=' + idPostulacion;
    });
    $(document).on('click', "button[name='ver']", function () {
        var idPostulacion = jQuery(this).data("id-postulacion");
        var path = "{{ action('Postulacion\\PostulacionController@getView')}}";
        window.location.href = path + '?id=' + idPostulacion;
    });

});

</script>

@endsection   

@section('content')

<div class="row">         
    <div class="col-lg-12">
        <h1 class="page-header">Listado de Postulaciones</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="container">
            @include('shared.errors')
            @include('flash::message')
        </div>
        <table class="table">
            <thead>
                <tr>
                    <th>RUT</th>
                    <th>Nombre</th>
                    <th>Estado</th>
                    <th>Accion</th> 
                </tr>
            </thead>
            <tbody id="contentUsuarios">
                @foreach($postulaciones as $postls)
                <tr>
                    <td>{{$postls->rut}}</td>
                    <td>{{$postls->nombre}}</td>
                    <td>{{$postls->estado->nombre}}</td>
                    <td>
                        <button class="btn btn-primary" name="ver" data-id-postulacion="{{$postls->id}}"><span class="glyphicon glyphicon-search"></span></button>
                        <button class="btn btn-primary" name="editar" data-id-postulacion="{{$postls->id}}"><span class="glyphicon glyphicon-pencil"></span></button>
                        <button class="btn btn-danger" name="eliminar" data-id-postulacion="{{$postls->id}}"data-toggle="modal" data-target="#confirmarEliminar" ><span class="glyphicon glyphicon-remove"></span></button>
                    </td>
                </tr>
                @endforeach
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="4">
                    </td>
                </tr>
            </tfoot>
            </tbody>
        </table>
    </div>    
</div>
<div class="modal fade" id="confirmarEliminar" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Eliminar Postulaci&oacute;n</h4>
            </div>
            <div class="modal-body">
                <div class="alert alert-danger">
                    ¿Est&aacute; seguro de que de que desea eliminar la postulaci&oacute;n?
                </div>
            </div>
            <div class="modal-footer">
                <form method="POST" action="{{ action('Postulacion\\PostulacionController@postDelete') }}"> 
                    {!! csrf_field() !!}
                    <input type="hidden" name="idPostulacion" value="" />
                    <input name="confirmacionEliminar" type="submit" class="btn btn-default"  value="Si" />
                    <input type="button" class="btn btn-primary"  data-dismiss="modal" value="No" />
                </form>                                
            </div>
        </div>
    </div>
</div>

@endsection

