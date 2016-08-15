@section('title', 'Formulario de Postulaci&oacute;n')
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
        <h1 class="page-header">Formulario de Postulaci&oacute;n</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<div class="row">


    @include('shared.errors')
    <form class="form-horizontal"  data-toggle="validator" role="form" method="post" action="{{ action('Postulacion\\PostulacionController@postCreate') }}">
        <div class="row">
            <div class="col-lg-6">
                {!! csrf_field() !!}
                <input type="hidden" id="rutfull" name="rutfull" value="{{ old('rutfull') }}" >
                <div class="form-group">
                    <label for="rut" class="col-sm-2 control-label">RUT</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" id="rut" name="rut" placeholder="Ingrese su rut" data-error="Ingrese su rut" maxlength="8" value="{{ !Auth::user()->isEjecutivo()?Auth::user()->rut: old('rut') }}" required  {{ !Auth::user()->isEjecutivo()?'readonly':''  }} >                            
                    </div>
                    <label  class="col-sm-1 control-label">-</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" id="dv" name="dv" placeholder="DV" maxlength="1" value="{{  !Auth::user()->isEjecutivo()?Rut::set(Auth::user()->rut)->calculateVerificationNumber() : old('dv') }}"  data-error="Ingrese su rut" required {{ !Auth::user()->isEjecutivo()?'readonly':''  }}>
                    </div>
                    <div class="col-sm-offset-3 help-block with-errors"></div>
                </div>
                <div class="form-group">
                    <label for="nombre" class="col-sm-2 control-label">Nombres</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese sus nombres" maxlength="32" value="{{!Auth::user()->isEjecutivo()?Auth::user()->nombre: old('nombre') }}" data-error="Ingrese sus nombres" required {{ !Auth::user()->isEjecutivo()?'readonly':''  }} >
                        <div class="help-block with-errors"></div>
                    </div>              
                </div>
                <div class="form-group">
                    <label for="apellidos" class="col-sm-2 control-label">Apellidos</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="amaterno" name="amaterno" placeholder="Ingrese su apellido materno" maxlength="32" data-error="Ingrese sus apellidos" value="{{!Auth::user()->isEjecutivo()?Auth::user()->amaterno: old('amaterno') }}" required {{ !Auth::user()->isEjecutivo()?'readonly':''  }} >
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="apaterno" name="apaterno" placeholder="Ingrese su apellido paterno" maxlength="32" data-error="Ingrese sus apellidos" required value="{{!Auth::user()->isEjecutivo()?Auth::user()->apaterno: old('apaterno')}}" {{ !Auth::user()->isEjecutivo()?'readonly':''  }} >
                        <div class="help-block with-errors"></div>
                    </div>
                </div>   
                <div class="form-group">
                    <label for="fecha_nacimiento" class="col-sm-2 control-label">Fecha Nacimiento</label>
                    <div class="col-sm-10">             
                        <input type="date" class="form-control" id="fecha_nacimiento" name="fecha_nacimiento" readonly  placeholder="Ingrese su fecha de nacimiento" maxlength="10" value="{{old('fecha_nacimiento')}}" data-error="Ingrese su fecha de nacimiento" required>
                        <div class="help-block with-errors"></div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="sexo" class="col-sm-2 control-label">Sexo</label>
                    <div class="col-sm-10">      
                        <label class="radio-inline"><input type="radio" name="sexo" value="0" {{ old('sexo') == 0 ? 'checked' : '' }} >Femenino</label>
                        <label class="radio-inline"><input type="radio" name="sexo" value="1" {{ old('sexo') == 1 ? 'checked' : '' }} >Masculino</label>
                        <div class="help-block with-errors"></div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="telefono" class="col-sm-2 control-label">Tel&eacute;fono</label>
                    <div class="col-sm-10">      
                        <input type="text" class="form-control" id="telefono" name="telefono" placeholder="Ingrese su t&eacute;lefono" maxlength="11" value="{{ old('telefono') }}" data-error="Ingrese su t&eacute;lefono" required>
                        <div class="help-block with-errors"></div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-10">            
                        <input type="email" class="form-control" id="email" name="email" placeholder="Ingrese su email" maxlength="32" data-error="Ingrese su email" value="{{old('email')}}" required>
                        <div class="help-block with-errors"></div>
                    </div>
                </div>
            </div>



            <div class="col-lg-6">
                <div class="form-group">
                    <label for="direccion" class="col-sm-2 control-label">Direcci&oacute;n</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Ingrese su direcci&oacute;n" maxlength="32" value="{{old('direccion')}}" data-error="Ingrese su direcci&oacute;n" required>
                        <div class="help-block with-errors"></div>
                    </div>              
                </div>
                <div class="form-group">
                    <label for="comuna" class="col-sm-2 control-label">Com&uacute;na</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="comuna" id="comuna">
                            <option value="0" selected >Seleccione</option>
                            @foreach($comunas as $comuna)
                            <option {{ old('comuna') == $comuna->id ? 'selected' : '' }} value="{{ $comuna->id }}" >{{ $comuna->nombre }}</option>
                            @endforeach
                        </select>
                        <div class="help-block with-errors"></div>
                    </div>              
                </div>
                <div class="form-group">
                    <label for="educacion" class="col-sm-2 control-label">Educacion</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="educacion" id="educacion">
                            <option value="0" selected >Seleccione</option>
                            @foreach($educaciones as $educacion)
                            <option {{ old('educacion') == $educacion->id ? 'selected' : '' }} value="{{ $educacion->id }}" >{{ $educacion->nombre }}</option>
                            @endforeach
                        </select>
                        <div class="help-block with-errors"></div>
                    </div>              
                </div>
                <div class="form-group">
                    <label for="experiencia" class="col-sm-2 control-label">Experiencia </label>
                    <div class="col-sm-10">
                        <label class="checkbox-inline">
                            <input type="checkbox"  id="hasExperiencia" {{ old('experiencia') > 0 ? 'checked' : '' }} >Experiencia laboral en el area de programaci&oacute;n</label>
                        <div class="help-block with-errors"></div>
                    </div>
                </div>
                <div class="form-group" id="formEperiencia"  {{ old('experiencia') == 0 ? 'hidden' : '' }}>
                     <label for="experiencia" class="col-sm-2 control-label">Ingrese la cantidad de a&ntilde;os </label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="experiencia" name="experiencia" placeholder="Ingrese su expenriencia" min="0" max="100" data-error="La cantidad de años debe encontrarse enre 0 y 100 " required value="{{old('experiencia') > 0 ? old('experiencia') : 0 }}">
                        <div class="help-block with-errors"></div>
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
                                    <select class="form-control" name="modalidad" id="modalidad">
                                        <option value="0" selected >Seleccione</option>
                                        @foreach($modalidades as $modalidad)
                                        <option {{ old('modalidad') == $modalidad->id ? 'selected' : '' }} value="{{ $modalidad->id }}" >{{ $modalidad->nombre }}</option>
                                        @endforeach
                                    </select>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="curso" class="col-sm-2 control-label">
                                    Curso </label>
                                <div class="col-sm-10">
                                    <select class="form-control" name="curso" id="curso">
                                        <option value="0" selected >Seleccione</option>
                                        @foreach($cursos as $curso)
                                        <option {{ old('curso') == $curso->id ? 'selected' : '' }} value="{{ $curso->id }}" >{{ $curso->nombre }}</option>
                                        @endforeach
                                    </select><div class="help-block with-errors"></div>
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
            <div class="col-sm-offset-3 col-sm-2">
                <button type="submit" class="col-sm-12 btn  btn-primary">Enviar</button>                               
            </div>
        </div>
    </form>
</div>


@endsection

