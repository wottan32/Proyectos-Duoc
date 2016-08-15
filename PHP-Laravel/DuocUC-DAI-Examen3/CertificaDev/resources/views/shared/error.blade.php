@extends('shared.master')
@section('scripts')
@include('shared.scripts.theme')
@endsection 
@section('title', 'Error')
@section('content')
<div class="row">         
    <div class="col-lg-12">
        <h1 class="page-header">Oops parece que hubo un problema</h1>
        <h5>{{ $mensaje }}<h5>     
    </div>
    <!-- /.col-lg-12 -->
</div>
@endsection
