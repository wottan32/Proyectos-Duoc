@section('title', 'Buscador de Solicitudes')
@extends('shared.master')
@section('scripts')
@include('shared.scripts.theme')
<link href="{{ asset('vendor/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css') }}" rel="stylesheet">
<script src="{{ asset('vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js') }}"></script>
<script src="{{ asset('vendor/bootstrap-datepicker/dist/locales/bootstrap-datepicker.es.min.js') }}" charset="UTF-8"></script>
<script>
$(function () {
    $('.date').datepicker({
        language: "es",
        endDate: "0d",
        orientation: "bottom left",
        format: "yyyy-mm-dd"
    });

    $(".form-horizontal").submit(function (e) {
        $("#rutfull").val($("#rut").val() + $("#dv").val());
    });
});

</script>
@endsection   

@section('content')

<div class="row">         
    <div class="col-lg-12">
        <h1 class="page-header">Buscador de Solicitudes</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<div class="row">
    <div class="col-lg-12">

        <div class="container">
            @include('shared.errors')
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="glyphicon glyphicon-search"></i> Buscador por rut
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="row" style="padding-bottom: 10px; padding-top: 30px">
                        <div class="container">
                            <form class="form-horizontal"  data-toggle="validator" role="form" method="get" action="{{ action('Postulacion\\PostulacionController@getSearch') }}">
                                {!! csrf_field() !!}
                                <input type="hidden" id="rutfull" name="rutfull" value="{{ old('rutfull') }}" >
                                <input type="hidden" name="tipo_busqueda" value="por_rut">
                                <div class="form-group col-sm-9">
                                    <label for="rut" class="col-sm-1 control-label">RUT</label>
                                    <div class="col-sm-5">
                                        <input type="text" class="form-control" id="rut" name="rut" placeholder="Ingrese su rut" data-error="Ingrese su rut" maxlength="8" value="{{ old('rut') }}" required>                            
                                    </div>
                                    <label  class="col-sm-1 control-label">-</label>
                                    <div class="col-sm-2">
                                        <input type="text" class="form-control" id="dv" name="dv" placeholder="DV" maxlength="1" value="{{ old('dv') }}" data-error="Ingrese su rut" required>
                                    </div>
                                    <div class="col-sm-offset-1 help-block with-errors"></div>       
                                </div>
                                <div class="form-group ">   
                                    <div class="col-sm-3">
                                        <button type="submit" class="col-sm-12 btn  btn-info " >Buscar</button>                               
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="glyphicon glyphicon-search"></i> Buscador por fecha
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="row" style="padding-bottom: 10px; padding-top: 30px">
                        <div class="container">
                            <form class="form-horizontal"  data-toggle="validator" role="form" method="get" action="{{ action('Postulacion\\PostulacionController@getSearch') }}">
                                {!! csrf_field() !!}
                                <input type="hidden" name="tipo_busqueda" value="por_fecha">
                                <div class="form-group col-sm-12">
                                    <label for="rut" class="col-sm-1 control-label">Desde</label>
                                    <div class="col-sm-5">
                                        <input type="date" class="form-control date" id="fecha_inicio" name="fecha_inicio" readonly  placeholder="Ingrese la fecha de inicio" maxlength="10" value="{{old('fecha_inicio')}}" data-error="Ingrese su fecha de nacimiento" required>
                                    </div>
                                    <label  class="col-sm-1 control-label">Hasta</label>
                                    <div class="col-sm-5">
                                        <input type="date" class="form-control date" id="fecha_termino" name="fecha_termino" readonly  placeholder="Ingrese la fecha de termino" maxlength="10" value="{{old('fecha_termino')}}" data-error="Ingrese su fecha de nacimiento" required>
                                    </div>
                                </div>
                                <div class="form-group ">   
                                    <div class="col-sm-2 col-sm-offset-6">
                                        <button type="submit" class="col-sm-12 btn  btn-info " >Buscar</button>                               
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>



    </div>
</div>

@endsection

