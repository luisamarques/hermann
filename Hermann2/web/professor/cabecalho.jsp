<%if (session.getAttribute("professor") == null) {
        response.sendRedirect("logincadastro.jsp");
        return;
    }
%>
<!doctype html>
<html class="no-js" lang="">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Hermann</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- favicon
                    ============================================ -->
        <link rel="stylesheet" href="css/jquery.dataTables.min.css">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
        <!-- Google Fonts
                    ============================================ -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
        <!-- Bootstrap CSS
                    ============================================ -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/dropzone/dropzone.css">
        <!-- font awesome CSS
                    ============================================ -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!-- owl.carousel CSS
                    ============================================ -->
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/owl.theme.css">
        <link rel="stylesheet" href="css/owl.transitions.css">
        <!-- meanmenu CSS
                    ============================================ -->
        <link rel="stylesheet" href="css/meanmenu/meanmenu.min.css">
        <!-- animate CSS
                    ============================================ -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- normalize CSS
                    ============================================ -->
        <link rel="stylesheet" href="css/normalize.css">
        <!-- mCustomScrollbar CSS
                    ============================================ -->
        <link rel="stylesheet" href="css/scrollbar/jquery.mCustomScrollbar.min.css">
        <!-- jvectormap CSS
                    ============================================ -->
        <link rel="stylesheet" href="css/jvectormap/jquery-jvectormap-2.0.3.css">
        <!-- Notika icon CSS
                    ============================================ -->
        <link rel="stylesheet" href="css/notika-custom-icon.css">
        <!-- wave CSS
                    ============================================ -->
        <link rel="stylesheet" href="css/wave/waves.min.css">
        <!-- main CSS
                    ============================================ -->
        <link rel="stylesheet" href="css/main.css">
        <!-- style CSS
                    ============================================ -->
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="css/bootstrap-select/bootstrap-select.css">
        <!-- responsive CSS
                    ============================================ -->
        <link rel="stylesheet" href="css/responsive.css">
        <!-- modernizr JS
                    ============================================ -->
        <script src="js/vendor/modernizr-2.8.3.min.js"></script>
    </head>

    <body>
        <!--[if lt IE 8]>
                <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
            <![endif]-->
        <!-- Start Header Top Area -->
        <div class="header-top-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="logo-area">

                        </div>
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                        <div class="header-top-menu">
                            <ul class="nav navbar-nav notika-top-nav">
                                <li class="nav-item dropdown">
                                   
                                    <!--<img src="img/pngatualizado.png">-->
                                </li>

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="mobile-menu-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="mobile-menu">
                            <nav id="dropdown">
                                <ul class="mobile-menu-nav">
                                    <li><a data-toggle="collapse" data-target="#Charts" href="index.jsp">Início</a>

                                    </li>

                                    <li><a data-toggle="collapse" data-target="#democrou" href="#">Apresentações</a>
                                        <ul id="democrou" class="collapse dropdown-header-top">
                                            <li><a href="nomearprancha.jsp">Adicionar</a></li>
                                            <li><a href="gerenciarpranchas.jsp">Gerenciar apresentações</a></li>

                                        </ul>
                                    </li>
                                    <li><a data-toggle="collapse" data-target="#democrou" href="#">Exercício/Prova</a>
                                        <ul id="democrou" class="collapse dropdown-header-top">
                                            <li><a href="nomearexercicio.jsp">Adicionar</a></li>
                                            <li><a href="gerenciarexercicios.jsp">Gerenciar</a></li>

                                        </ul>
                                    </li>

                                    <li><a data-toggle="collapse" data-target="#demo" href="#">Disciplinas</a>
                                        <ul id="demo" class="collapse dropdown-header-top">
                                            <li><a href="criardisciplina.jsp">Adicionar</a></li>
                                            <li><a href="gerenciardisciplinas.jsp">Gerenciar</a></li>

                                        </ul>
                                    </li>

                                    <li><a data-toggle="collapse" data-target="#Pagemob" href="#">Meu perfil</a>
                                        <ul id="Pagemob" class="collapse dropdown-header-top">
                                            <li><a href="alterarperfil.jsp">Alterar</a>
                                            </li>

                                        </ul>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Mobile Menu end -->
        <!-- Main Menu area start-->
        <div class="main-menu-area mg-tb-40">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <ul class="nav nav-tabs notika-menu-wrap menu-it-icon-pro">
                            <li class="active"><a data-toggle="tab" href="#Home"><i class="notika-icon notika-house"></i> Início</a>
                            </li>

                            <li><a data-toggle="tab" href="#InterfaceA"><i class="notika-icon notika-edit"></i> Apresentações</a>
                            </li>
                            <li><a data-toggle="tab" href="#InterfaceE"><i class="notika-icon notika-edit"></i> Exercício/Prova</a>
                            </li>

                            <li><a data-toggle="tab" href="#Forms"><i class="notika-icon notika-form"></i> Disciplinas</a>
                            </li>

                            <li><a data-toggle="tab" href="#Page"><i class="notika-icon notika-support"></i> Meu perfil</a>
                            </li>
                        </ul>
                        <div class="tab-content custom-menu-content">
                            <div id="Home" class="tab-pane in active notika-tab-menu-bg animated flipInX">
                                <ul class="notika-main-menu-dropdown">
                                    <li><a href="index.jsp">Início</a>
                                    </li>
                                </ul>
                            </div>

                            <div id="InterfaceA" class="tab-pane notika-tab-menu-bg animated flipInX">
                                <ul class="notika-main-menu-dropdown">
                                    <li><a href="nomearprancha.jsp">Adicionar</a>
                                    </li>
                                    <li><a href="gerenciarpranchas.jsp">Minhas apresentações</a>
                                    </li>

                                </ul>
                            </div>
                            <div id="InterfaceE" class="tab-pane notika-tab-menu-bg animated flipInX">
                                <ul class="notika-main-menu-dropdown">
                                    <li><a href="nomearexercicio.jsp">Adicionar</a>
                                    </li>
                                    <li><a href="gerenciarexercicios.jsp">Gerenciar</a>
                                    </li>

                                </ul>
                            </div>



                            <div id="Forms" class="tab-pane notika-tab-menu-bg animated flipInX">
                                <ul class="notika-main-menu-dropdown">
                                    <li><a href="criardisciplina.jsp">Adicionar</a>
                                    </li>
                                    <li><a href="gerenciardisciplinas.jsp">Gerenciar</a>
                                    </li>

                                </ul>
                            </div>

                            <div id="Page" class="tab-pane notika-tab-menu-bg animated flipInX">
                                <ul class="notika-main-menu-dropdown">
                                    <li><a href="alterarprof.jsp">Alterar</a>
                                    </li>


                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>