@extends('shared.master')
@section('title', 'Inicio de Sesión')
@section('scripts')
<script>
    $(function () {
        $(".form-horizontal").submit(function (e) {
            $("#rutfull").val($("#rut").val()+$("#dv").val());
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
                    <span class="glyphicon glyphicon-lock"></span> Registro</div>
                <div class="panel-body">
                    @include('shared.errors')
                    <form class="form-horizontal"  data-toggle="validator" role="form" method="post" action="{{  action('Auth\\AuthController@postRegister') }}">
                        {!! csrf_field() !!}
                         <input type="hidden" id="rutfull" name="rutfull" value="{{ old('rutfull') }}" >
                        <div class="form-group">
                            <label for="rut" class="col-sm-2 control-label">
                                RUT</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="rut" name="rut" placeholder="Ingrese su Rut" data-error="Ingrese su rut" maxlength="8" value="{{ old('rut') }}" required>                            
                            </div>
                            <label  class="col-sm-1 control-label">-</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="dv" name="dv" placeholder="DV" maxlength="1" value="{{ old('dv') }}" data-error="Ingrese su rut" required>
                            </div>
                            <div class="col-sm-offset-3 help-block with-errors"></div>
                        </div>
                        <div class="form-group">
                            <label for="nombre" class="col-sm-2 control-label">Nombres</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese sus Nombres" maxlength="32" value="{{old('nombre')}}" data-error="Ingrese sus Nombres" required>
                                <div class="help-block with-errors"></div>
                            </div>              
                        </div>
                        <div class="form-group">
                            <label for="apellidos" class="col-sm-2 control-label">Apellidos</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="amaterno" name="amaterno" placeholder="Ingrese su Apellido Materno" maxlength="32" data-error="Ingrese sus Apellidos" value="{{old('amaterno')}}" required>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="apaterno" name="apaterno" placeholder="Ingrese su Apellido Paterno" maxlength="32" data-error="ingrese sus Apellidos" required value="{{old('apaterno')}}">
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>                    

                        <div class="form-group">
                            <label for="clave" class="col-sm-2 control-label">
                                Contrase&ntilde;a</label>
                            <div class="col-sm-10">      
                                <input type="password" class="form-control" id="password" name="password" placeholder="Ingrese su Contrase&ntilde;a" maxlength="50" value="" data-error="Debe Ingresar su Contrase&ntilde;a" required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="clave" class="col-sm-2 control-label">
                                Repetir Contrase&ntilde;a</label>
                            <div class="col-sm-10">                   
                                <input type="password" class="form-control" id="password_confirmation" name="password_confirmation" placeholder="Repita su Contrase&ntilde;a" maxlength="50"  data-error="Repita su Contrase&ntilde;a" required>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>

                        <div class="form-group ">   
                            <div class="col-sm-6">                          
                                <a href="{{ action('Auth\\AuthController@getLogin') }}"  class="col-sm-12 btn  btn-primary">Cancelar</a>
                            </div>
                            <div class="col-sm-6">
                                <button type="submit" class="col-sm-12 btn  btn-warning" >Registar</button>                               
                            </div>
                        </div>
                    </form>
                </div>
                <div class="panel-footer">CertificaDev | Registro</div>            
            </div>
        </div>
    </div>
</div>
@endsection
