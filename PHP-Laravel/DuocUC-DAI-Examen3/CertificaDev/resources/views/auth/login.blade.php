@extends('shared.master')
@section('title', 'Inicio de Sesión')
@section('scripts')
<script>
    $(function () {
        $(".form-horizontal").submit(function (e) {
            $("#rutfull").val($("#rut").val() + $("#dv").val());
        });
    });
</script>
@endsection
@section('content')
<div class="container" style="margin-top: 5%">      
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-lock"></span> Iniciar Sesi&oacute;n</div>
                <div class="panel-body">
                    @include('shared.errors') 
                    @include('flash::message')
                    <form class="form-horizontal"  data-toggle="validator"  role="form" method="post" action="{{ action('Auth\\AuthController@postLogin') }}">
                        {!! csrf_field() !!}
                        <input type="hidden" id="rutfull" name="rutfull" value="{{ old('rutfull') }}" >
                        <div class="form-group">                          
                            <label for="rut" class="col-sm-2 control-label">
                                RUT</label>
                            <div class="col-sm-7">
                                <input type="text" required class="form-control" id="rut" name="rut" placeholder="Ingrese su Rut" data-error="Ingrese su rut" maxlength="8" value="{{ old('rut') }}" >
                           
                            </div>
                            <label  class="col-sm-1 control-label">-</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="dv" required name="dv" placeholder="DV" maxlength="1"  value="{{ old('dv') }}">
                            </div>
                            <div class="col-sm-offset-3 help-block with-errors"></div>
                        </div>
                        <div class="form-group">
                            <label for="clave" class="col-sm-2 control-label">
                                Contrase&ntilde;a</label>
                            <div class="col-sm-10"> 
                                <input type="password" class="form-control" required id="password" name="password" placeholder="Ingrese su Contraseña" data-error="Debe Ingresar su Contraseña" >
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>

                        <div class="form-group ">
                            <div class="col-md-6">
                                <button type="submit" class="col-sm-12 btn  btn-success ">Ingresar</button>                           
                            </div>
                            <div class="col-md-6">                            
                                <button  type="button" class="col-sm-12 btn  btn-warning" formnovalidate  onclick="location.href ='{{ action('Auth\\AuthController@getRegister') }}';" >Registar</button>                  
                            </div>
                        </div>
                    </form>
                </div>
                <div class="panel-footer">CertificaDev | Login</div>
            </div>
        </div>
    </div>
</div>


@endsection
