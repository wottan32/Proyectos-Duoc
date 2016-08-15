<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="{{ asset('img/favicon.ico') }}">
        <title>@yield('title')</title>
        @include('shared.scripts.master')
        @yield('scripts')        
    </head>   

    <body style="padding-bottom: 100px">
        <div class="col" style="background: #F0F0F0" >
            <a href="{{action('IndexController@getIndex')}}"><img style="margin-left: 3%" src="{{ asset('img/login_new.png') }}"/></a>
            <nav class="navi_bar"></nav>
        </div> 
        <div id="wrapper">
            @if(Auth::check())
            <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                @include('shared.nav-top')
                @include('shared.nav-right')
            </nav>
            <!-- /.navbar-static-side -->
            @endif  
            <div id="wrapper"> 
                <div id="page-wrapper">
                    @yield('content')
                </div>
            </div>
        </div>
        <footer class="footer" style="background:  #121214 ; position: fixed; bottom: 0 ;  width: 100%; margin-top: 5%; z-index: 9999 ">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-center" style="color: #fff">
                        <span>© {{date("Y") }} CertificaDev</span>
                    </div>
                </div>
            </div>
        </footer>
        <script src="{{ asset('vendor/bootstrap-validator/dist/validator.min.js') }}"></script>
        @yield('bottom-scripts')
    </body>
</html>
