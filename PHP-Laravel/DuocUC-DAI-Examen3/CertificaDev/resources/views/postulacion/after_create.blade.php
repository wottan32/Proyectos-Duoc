@section('title', 'Página de inicio')
@extends('shared.master')
@section('scripts')
@include('shared.scripts.theme')
<link href="{{ asset('vendor/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css') }}" rel="stylesheet">
<script src="{{ asset('vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js') }}"></script>
<script src="{{ asset('vendor/bootstrap-datepicker/dist/locales/bootstrap-datepicker.es.min.js') }}" charset="UTF-8"></script>
<script>
$(document).ready(function () {
    $('#fecha_nacimiento').datepicker({
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
        <h1 class="page-header">Formulario de Postulaci&oacute;n</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<div class="row">


    @include('flash::message')

    <div class="container">
        Puede revisar el estado de su solicitid accediendo desde 
        <a href="{{action('Postulacion\\PostulacionController@getCheck')}}?codigo={{$codigo}}">esta url</a>
        o desde el men&uacute; "Revisar Estado" utilizando el siguente c&oacute;digo <strong>{{$codigo}}</strong>

    </div>






</div>
</div>

@endsection

