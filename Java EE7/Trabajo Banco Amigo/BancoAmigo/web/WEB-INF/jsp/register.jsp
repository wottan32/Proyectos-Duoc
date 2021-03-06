<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
        <meta name="theme-color" content="#2196F3">
        <title>Banco Amigo - Registro</title>

        <!-- CSS  -->
        <link href="<%= request.getContextPath()%>/min/plugin-min.css" type="text/css" rel="stylesheet">
        <link href="<%= request.getContextPath()%>/min/custom-min.css" type="text/css" rel="stylesheet" >

        <!--  Scripts-->
        <script src="<%= request.getContextPath()%>/min/plugin-min.js"></script>
        <script src="<%= request.getContextPath()%>/min/custom-min.js"></script>
    </head>
    <body id="top" class="scrollspy">

        <!-- Pre Loader -->
        <div id="loader-wrapper">
            <div id="loader"></div>

            <div class="loader-section section-left"></div>
            <div class="loader-section section-right"></div>

        </div>

        <!--Navigation-->
        <div class="navbar-fixed">
            <nav id="nav_f" class="default_color" role="navigation">
                <div class="container">
                    <div class="nav-wrapper"><a id="logo-container" href="#top" class="brand-logo">Banco Amigo</a>
                        <ul id="nav-mobile" class="right side-nav">
                            <li><a href="<%= request.getContextPath()%>">Simular</a></li>
                            <li><a href="<%= request.getContextPath()%>/login">Acceso a Usuarios</a></li>
                            <li><a href="#register">Registrarse</a></li>
                        </ul><a href="#" data-activates="nav-mobile" class="button-collapse"><i class="mdi-navigation-menu"></i></a>
                    </div>
                </div>
            </nav>
        </div>

        <!--Hero-->
        <div class="section no-pad-bot" id="index-banner">
            <div class="container">
                <h1 class="text_h center header cd-headline letters type">
                    <span>Su</span> 
                    <span class="cd-words-wrapper waiting">
                        <b class="is-visible">aliado</b>
                        <b>compañero</b>
                        <b>amigo</b>
                    </span>
                </h1>
            </div>
        </div>

        <!--Formulario-->
        <div id="register" class="section scrollspy">
            <div class="container">
                <div class="row">
                    <h2 class="header text_b">Formulario de registro</h2>

                    <!--Mensaje de exito/error-->
                    <% if (request.getAttribute("exito") != null) {%>
                    <div class="exito">
                        <%= request.getAttribute("exito")%>
                    </div>
                    <% }%>
                    <% if (request.getAttribute("error") != null) {%>
                    <div class="error">
                        <%= request.getAttribute("error")%>
                    </div>
                    <% }%>
                    <form action="register" method="POST">
                        <table style="width:100%">

                            <tr>
                                <td>
                                    <p class="light center">*Usuario</>
                                </td>
                                <td>
                                    <input type="text" name="usuario" required/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p class="light center">*Clave</p>
                                </td>
                                <td>
                                    <input type="password" name="clave" required/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p class="light center">Nombres</p>
                                </td>
                                <td>
                                    <input type="text" name="nombre" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p class="light center">Apellidos</p>
                                </td>
                                <td>
                                    <input type="text" name="apellido" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p class="light center">*Email</P>
                                </td>
                                <td>
                                    <input type="email" name="email" required/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p class="light center">*Campos obligatorios</P>
                                </td>
                                <td>
                                    <button class="btn waves-effect waves-light red darken-1" type="reset">Limpiar<i class="mdi-content-send right white-text"></i></button>
                                    <button class="btn waves-effect waves-light red darken-1" type="submit">Enviar<i class="mdi-content-send right white-text"></i></button>
                                </td>

                            </tr>

                        </table>
                    </form>
                </div>
            </div>
        </div>
        <!--Parallax-->
        <div class="parallax-container">
            <div class="parallax"><img src="<%= request.getContextPath()%>/img/parallax1.png"></div>
        </div>
        <!--Footer-->
        <footer id="contact" class="page-footer default_color scrollspy">

            <div class="footer-copyright default_color">
                <div class="container">
                    Creado por <a class="white-text" href="http://zonda.com">Zonda</a>.
                </div>
            </div>
        </footer>
    </body>
</html>
