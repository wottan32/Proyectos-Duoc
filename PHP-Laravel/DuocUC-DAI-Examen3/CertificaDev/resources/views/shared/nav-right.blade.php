<!-- /.navbar-right -->
<div class="navbar-default sidebar" role="navigation">
    <div class="sidebar-nav navbar-collapse">
        <ul class="nav" id="side-menu">
            <li> 
                <a href="{{ action('IndexController@getIndex') }}"><i class="fa fa-dashboard fa-fw"></i> Escritorio</a>
            </li>   
            <li>
                <a href="#"><i class="fa fa-user fa-fw"></i> Solicitud de Postulacion<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">

                    <li>
                        <a href="{{ action('Postulacion\\PostulacionController@getCreate') }}"><i class="fa fa-save fa-fw"></i>Crear</a>
                    </li>
                    <li>
                        <a href="{{ action('Postulacion\\PostulacionController@getCheck') }}"><i class="fa fa-check fa-fw"></i>Revisar Estado</a>
                    </li>
                    @if (Auth::user()->hasRol('ejecutivo'))
                    <li>
                        <a href="{{ action('Postulacion\\PostulacionController@getSearch') }}"><i class="fa fa-search fa-fw"></i>Buscar</a>
                    </li>
                    <li>
                        <a href="{{ action('Postulacion\\PostulacionController@getList') }}"><i class="fa fa-list fa-fw"></i>Listar</a>
                    </li>
                    @endif
                </ul>
                <!-- /.nav-second-level -->
            </li>
            @yield('nav-right-content')

            <li> 
                <a href="{{ action('Auth\\AuthController@getLogout') }}"><i class="fa fa-power-off fa-fw"></i> Salir</a>
            </li>  
        </ul>
    </div>
    <!-- /.sidebar-collapse -->
</div>
