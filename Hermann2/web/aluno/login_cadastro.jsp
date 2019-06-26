<%@page import="modelo.Aluno"%>
<%@page import="DAO.AlunoDAO"%>
<!DOCTYPE html>
<html>
    <%
        String msg = "";
        if (request.getMethod().equals("POST")) {
            AlunoDAO dao = new AlunoDAO();
            if (request.getParameter("logar") != null) {
                //logando
                if (request.getParameter("txtemail") != null && request.getParameter("txtsenha") != null) {
                    Aluno login = dao.logar(request.getParameter("txtemail"), request.getParameter("txtsenha"));
                    if (login != null) {
                        session.setAttribute("aluno", login);
                        response.sendRedirect("menu.jsp");
                        return;
                    } else {
                        msg = "Email e/ou senha incorreto!";
                        //mensagem de erro (senha e ou email incorretos)
                    }
                }
            } else {
                //cadastrando
                Aluno aluno = new Aluno();
                aluno.setAemail(request.getParameter("txtemail"));
                aluno.setAsenha(request.getParameter("txtsenha"));
                if (!request.getParameter("txtnome").equals("")) {
                    aluno.setAnome(request.getParameter("txtnome"));
                    Boolean resultado = dao.incluir(aluno);
                    if (resultado) {
                        aluno = dao.logar(request.getParameter("txtemail"), request.getParameter("txtsenha"));
                        session.setAttribute("aluno", aluno);
                        response.sendRedirect("menu.jsp");
                    } else {
                        msg = "Problemas ao cadastrar um novo aluno!";
                    }
                } else {
                    msg = "Para se cadastrar você deve preencher todos os campos!";
                }

            }
        }

    %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=1024, user-scalable=no">

        <title>Index</title>

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
            <div>
                <h1 id="cabecalho"></h1>
            </div>

            <section class="slide">
                <form method="POST" class="naofala">
                    <br><br>
                    <br><br>
                    <div style="text-align: center">
                        <h4>Nome:</h4>
                        <input type="nome" name="txtnome" class="naofala">
                    </div>
                    <div style="text-align: center">
                        <h4>E-mail:</h4>
                        <input type="email" name="txtemail" class="naofala">
                    </div>
                    <div style="text-align: center">
                        <h4>Senha:</h4>
                        <input type="password" name="txtsenha" class="naofala">
                    </div>

                    <br>
                    <div style="text-align: center">
                        <%if (!msg.equals("")) {%>
                        <h6 style="color:red;"> <%=msg%> </h6><br>
                        <%}%>

                        <button class="naofala" type="submit" name="logar"><a class="naofala">Logar</a></button>
                        <button class="naofala" type="submit" name="cadastrar"><a class="naofala">Cadastrar</a></button>
                    </div>
                </form>



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
