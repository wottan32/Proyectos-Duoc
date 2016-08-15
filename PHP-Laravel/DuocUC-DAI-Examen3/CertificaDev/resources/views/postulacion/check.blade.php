@section('title', 'Revisar estado de solicitud<')
@extends('shared.master')
@section('scripts')
@include('shared.scripts.theme')
<link href="{{ asset('vendor/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css') }}" rel="stylesheet">
<script src="{{ asset('vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js') }}"></script>
<script src="{{ asset('vendor/bootstrap-datepicker/dist/locales/bootstrap-datepicker.es.min.js') }}" charset="UTF-8"></script>
<script>
$(document).ready(function () {
    $('.date').datepicker({
        language: "es",
        endDate: "0d",
        orientation: "bottom left",
        format: "yyyy-mm-dd"
    });
});

</script>
@endsection   

@section('content')

<div class="row">         
    <div class="col-lg-12">
        <h1 class="page-header">Revisar estado de solicitud</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<div class="row">
    <div class="col-lg-12">

        <div class="container">
            @include('shared.errors')


            <div class="container" style="margin-top: 5%">   
                @if (!isset($estado))   

                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <span class="glyphicon glyphicon-check"></span> Revisi&oacute;n</div>
                            <div class="panel-body">

                                <form class="form-horizontal"  data-toggle="validator" role="form" method="get" action="{{ action('Postulacion\\PostulacionController@getCheck') }}">
                                    {!! csrf_field() !!}
                                    <div class="form-group">               
                                        <label for="codigo" class="col-sm-2 control-label">C&oacute;digo</label>
                                        <div class="col-sm-7">
                                            <input required type="text" class="form-control" id="codigo" name="codigo" placeholder="Ingrese su c&oacute;digo" data-error="Debe ingresar el c&oacute;digo" maxlength="32" value="{{ old('codigo') }}" >
                                            <div class="help-block with-errors"></div>
                                        </div>                   
                                        <div class="col-md-3">
                                            <button type="submit" class="col-sm-12 btn  btn-success ">Revisar</button>                           
                                        </div>                            
                                    </div>  
                                </form>
                            </div>
                            <div class="panel-footer">CertificaDev | Revisi&oacute;n</div>
                        </div>
                    </div>
                </div>
                @else
                @if ($estado->id == 1)
                Estado de solicitud: Pendiente
                @elseif ($estado->id == 2)
                Estado de solicitud: Aprobado
                <br>
                Dentro de un plazo m&aacute;ximo de 48 horas, uno de nuestros ejecutivos se pondr&aacute; en contacto con usted.

                @elseif ($estado->id == 3)
                Estado de solicitud: Rechazado
                <br>
                Para m&aacute;s informaci&oacute;n puede llamarnos al n&uacute;mero que aparece en nuestra p&aacute;gina oficial.
                @endif


                @endif
            </div>

        </div>
    </div>
</div>

@endsection

