<!-- Navigation -->
<div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Alternar navigación</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>
</div>
<!-- /.navbar-header -->
<ul class="nav navbar-top-links navbar-right">
    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">                            
            <i class="fa fa-user fa-fw"></i>{{Auth::user()->nombre." ".Auth::user()->apaterno }}  <i class="fa fa-caret-down"></i>                            
        </a>
        <ul class="dropdown-menu dropdown-user">

            <li><a href="{{ action('Auth\\AuthController@getLogout') }}"><span class="glyphicon glyphicon-off"></span> Cerrar Sesión</a></li>
        </ul>
        <!-- /.dropdown-user -->
    </li>
    <!-- /.dropdown -->
</ul>
<!-- /.navbar-top-links -->

