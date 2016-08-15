@section('title', 'Ficha de Postulante')
@extends('shared.master')
@section('scripts')
@include('shared.scripts.theme')
<link href="{{ asset('vendor/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css') }}" rel="stylesheet">
<script src="{{ asset('vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js') }}"></script>
<script src="{{ asset('vendor/bootstrap-datepicker/dist/locales/bootstrap-datepicker.es.min.js') }}" charset="UTF-8"></script>
<script>
$(function () {
    $('#fecha_nacimiento').datepicker({
        language: "es",
        endDate: "0d",
        orientation: "bottom left",
        format: "yyyy-mm-dd"
    });

    $("#hasExperiencia").bind('change', function () {
        $("#experiencia").val(0);
        if ($(this).prop('checked')) {
            $("#formEperiencia").show();
        } else {
            $("#formEperiencia").hide();
        }
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
        <h1 class="page-header">Ficha de Postulante</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<div class="row">


    @include('shared.errors')
    @include('flash::message')
    <div class="form-horizontal">
        <div class="row">
            <div class="col-lg-6">   

                <div class="form-group">
                    <label for="rut" class="col-sm-2 control-label">RUT</label>
                    <div class="col-sm-7">
                        {{ $postulacion->rut }}   - {{$dv}}                       
                    </div>
               
          
                    <div class="col-sm-offset-3 help-block with-errors"></div>
                </div>
                <div class="form-group">
                    <label for="nombre" class="col-sm-2 control-label">Nombres</label>
                    <div class="col-sm-10">
                        {{ $postulacion->nombre }}

                    </div>              
                </div>
                <div class="form-group">
                    <label for="apellidos" class="col-sm-2 control-label">Apellidos</label>
                    <div class="col-sm-5">
                        {{ $postulacion->amaterno }}  {{ $postulacion->apaterno }}

                    </div>
       
                </div>   
                <div class="form-group">
                    <label for="fecha_nacimiento" class="col-sm-2 control-label">Fecha Nacimiento</label>
                    <div class="col-sm-10">             
                        {{ $postulacion->fecha_nacimiento }}

                    </div>
                </div>
                <div class="form-group">
                    <label for="sexo" class="col-sm-2 control-label">Sexo</label>
                    <div class="col-sm-10">      
                        {{$postulacion->sexo == 0 ? 'Femenino' : 'Masculino' }}        

                    </div>
                </div>
                <div class="form-group">
                    <label for="telefono" class="col-sm-2 control-label">Tel&eacute;fono</label>
                    <div class="col-sm-10">      
                        {{ $postulacion->telefono }}

                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-10">            
                        {{ $postulacion->email }}

                    </div>
                </div>               
            </div>
            <div class="col-lg-6">
                <div class="form-group">
                    <label for="direccion" class="col-sm-2 control-label">Direcci&oacute;n</label>
                    <div class="col-sm-10">
                        {{ $postulacion->direccion }}

                    </div>              
                </div>
                <div class="form-group">
                    <label for="comuna" class="col-sm-2 control-label">Com&uacute;na</label>
                    <div class="col-sm-10">
                        {{ $postulacion->comuna->nombre }}

                    </div>              
                </div>
                <div class="form-group">
                    <label for="educacion" class="col-sm-2 control-label">Educacion</label>
                    <div class="col-sm-10">
                        {{ $postulacion->educacion->nombre}}

                    </div>              
                </div>
                <div class="form-group">
                    <label for="experiencia" class="col-sm-2 control-label">Experiencia Laboral</label>
                    <div class="col-sm-10">
                  
                            {{ $postulacion->experiencia }}
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="glyphicon glyphicon-star"></i> Modalidad y curso al que postula
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="row" style="padding-bottom: 10px; padding-top: 30px ; padding-right: 20px">
                            <div class="form-group">
                                <label for="modalidad" class="col-sm-2 control-label">
                                    Modalidad </label>
                                <div class="col-sm-10">
                                    {{ $postulacion->modalidad->nombre}}
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="curso" class="col-sm-2 control-label">
                                    Curso </label>
                                <div class="col-sm-10">
                                   {{ $postulacion->curso->nombre}}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.panel-body -->
            </div>
        </div>
        <hr>
        <div class="form-group ">   
            <div class="col-sm-offset-2 col-sm-3">
              Estado:  {{ $postulacion->estado->nombre}} 
            </div>
            <div class="col-sm-offset-1 col-sm-2">
                <button onclick="goBack()" class="col-sm-12 btn  btn-primary">Volver</button>      
                <script>
                    function goBack() {
                        window.history.back();
                    }
                </script>
            </div>
        </div>
    </div>
</div>


@endsection

