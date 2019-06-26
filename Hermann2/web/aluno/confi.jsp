<%@page import="DAO.AlunoDAO"%>
<%@page import="modelo.Aluno"%>
<%@page import="DAO.ConfiDAO"%>
<%@page import="modelo.Confi"%>
<!DOCTYPE html>
<html>
    <%
        if (request.getMethod().equals("POST")) {
            Confi c = new Confi();
            AlunoDAO adao = new AlunoDAO();

            Aluno aluno = (Aluno) session.getAttribute("aluno");
            
            c.setCestilo(request.getParameter("estilo"));
            c.setCtamanho(Integer.parseInt(request.getParameter("fonte")));

            aluno.setConfig(c);
            adao.alterar(aluno);
            session.setAttribute("aluno", aluno);
            response.sendRedirect("menu.jsp");
        }
    %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=1024, user-scalable=no">

        <title>Menu de configuração</title>

        <!-- Required stylesheet -->
        <link rel="stylesheet" media="screen" href="core/deck.core.css">

        <!-- Extension CSS files go here. Remove or add as needed. -->
        <link rel="stylesheet" media="screen" href="extensions/goto/deck.goto.css">
        <link rel="stylesheet" media="screen" href="extensions/menu/deck.menu.css">
        <link rel="stylesheet" media="screen" href="extensions/navigation/deck.navigation.css">
        <link rel="stylesheet" media="screen" href="extensions/status/deck.status.css">
        <link rel="stylesheet" media="screen" href="extensions/scale/deck.scale.css">

        <!-- Style theme. More available in /themes/style/ or create your own. -->
        <link rel="stylesheet" media="screen" href="themes/style/swiss.css" id="estilo-css">

        <!-- Transition theme. More available in /themes/transition/ or create your own. -->
        <link rel="stylesheet" media="screen" href="themes/transition/horizontal-slide.css">

        <!-- Basic black and white print styles -->
        <link rel="stylesheet" media="print" href="core/print.css">

        <link rel="stylesheet"  href="css/radiostyle.css">

        <!-- Required Modernizr file -->
        <script src="modernizr.custom.js"></script>

        <style>
            #cabecalho{
                font-size: larger;
                padding: 0 48px;
                position: absolute;
                left: 0px;
                right: auto;
                top: 5%;
            }
        </style>
    </head>
    <body>


        <div class="deck-container">

            <!-- Begin slides. Just make elements with a class of slide. -->


            <section class="slide">

                <div>
                    <h1 id="cabecalho">Menu de Configuração</h1>
                </div>
                
                <br></br>
                <div style="text-align: center">
                    </br>
                    <h5>Tamanho da fonte</h5>
                    <button id="btn-menos" class="naofala">A-</button>
                    <button id="btn-origem" class="naofala">A</button>
                    <button id="btn-mais" class="naofala">A+</button>

                </div>
                <div style="text-align: center">
                    <h5>Estilo de fundo</h5>
                    <button id="neon" class="naofala" onclick="setEstilo('neon')">Preto</button>
                    <button id="swiss" class="naofala" onclick="setEstilo('swiss')">Branco</button>
                    <!--<button id="web" class="naofala_estilo" onclick="setEstilo('web')">Web</button>-->
                    <input type="hidden" name="estilo" value="">
                </div>
                <br></br>
                <div style="text-align: center">
                    <form class="naofala" method="POST">
                        <input type="hidden" id="fonte" name="fonte" value="28">
                        <input type="hidden" id="estilo" name="estilo" value="neon">
                        <button class="naofala" type="submit">Salvar</button>
                    </form>

                </div>

            </section>



            <!-- End extension snippets. -->
        </div>

        <!-- Required JS files. -->
        <script src="jquery.min.js"></script>
        <script src="core/deck.core.js"></script>

        <!-- Extension JS files. Add or remove as needed. -->
        <script src="extensions/menu/deck.menu.js"></script>
        <script src="extensions/goto/deck.goto.js"></script>
        <script src="extensions/status/deck.status.js"></script>
        <script src="extensions/navigation/deck.navigation.js"></script>
        <script src="extensions/scale/deck.scale.js"></script>
        <script src="js/materialize.min.js"></script>
        <script src="js/falar.js"></script>
        <script src="js/fonte.js"></script>
        <!-- Initialize the deck. You can put this in an external file if desired. -->
        <script>


                        function setEstilo(estilo)
                        {
                            $("#estilo").val(estilo);
                            $("#estilo-css").prop("href", "themes/style/" + estilo + ".css");
                            localStorage.setItem("estilo", estilo);
                        }

                        function getEstilo()
                        {
                            var estilo = localStorage.getItem("estilo", estilo);
                            if (estilo == null) {
                                estilo = "swiss";
                            }
                            return estilo;
                        }
                        $(function () {
                            $.deck('.slide');
                            $("#estilo-css").prop("href", "themes/style/" + getEstilo() + ".css");
                        });
        </script>
    </body>
</html>
