@section('title', 'Página de inicio')
@extends('shared.master')
@section('scripts')
@include('shared.scripts.theme')
@endsection   

@section('content')

<div class="row">         
    <div class="col-lg-12">
        <h1 class="page-header">Escritorio</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<div class="row">
    <div class="container">
        <div class="view">
            <div class="jumbotron" >
                <h2>Bienvenido a CertificaDev</h2>
                <p>CertificaDev es una entidad internacional que imparte cursos de preparación para la obtención de certificaciones en las&nbsp;<span style="color: inherit; line-height: 1.42857;">áreas de programación y desarrollo.</span></p>
                <p><a class="btn btn-primary btn-large" href="{{ action('Postulacion\\PostulacionController@getCreate') }}">Solicitar Postulaci&oacute;n</a></p>
            </div>
        </div>
    </div>                



</div>


@endsection

