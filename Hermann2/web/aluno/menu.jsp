<%@page import="DAO.AlunoDAO"%>
<%@page import="modelo.Disciplina"%>
<%@page import="modelo.Disciplina"%>
<%@page import="DAO.DisciplinaDAO"%>
<%@page import="modelo.Aluno"%>
<%@page import="DAO.ConfiDAO"%>
<%@page import="modelo.Confi"%>
<%@page import="DAO.SlideDAO"%>
<%@page import="modelo.Slide"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Apresentacao"%>
<%@page import="DAO.ApresentacaoDAO"%>
<!DOCTYPE html>
<html>
    <%
        Aluno aluno = (Aluno) session.getAttribute("aluno");
        if (aluno == null) {
            response.sendRedirect("login_cadastro.jsp");
            return;
        }
        AlunoDAO adao = new AlunoDAO();
        aluno = adao.buscarPorChavePrimaria(aluno.getAcod());
        List<Disciplina> disciplinas = aluno.getDisciplinaList();
        DisciplinaDAO ddao = new DisciplinaDAO();

        //List<Disciplina> dlista = ddao.listar();
        //List<Disciplina> lista = aluno.getDisciplinaList();
        //session.setAttribute("aluno", aluno);
        //c.setAcod((Aluno) session.getAttribute("aluno"));
    %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=1024, user-scalable=no">

        <title>Menu</title>

        <!-- Required stylesheet -->
        <link rel="stylesheet" media="screen" href="core/deck.core.css">

        <!-- Extension CSS files go here. Remove or add as needed. -->
        <link rel="stylesheet" media="screen" href="extensions/goto/deck.goto.css">
        <link rel="stylesheet" media="screen" href="extensions/menu/deck.menu.css">
        <link rel="stylesheet" media="screen" href="extensions/navigation/deck.navigation.css">
        <link rel="stylesheet" media="screen" href="extensions/status/deck.status.css">
        <link rel="stylesheet" media="screen" href="extensions/scale/deck.scale.css">

        <!-- Style theme. More available in /themes/style/ or create your own. -->

        <link rel="stylesheet" media="screen" href="themes/style/swiss.css">



        <!-- Transition theme. More available in /themes/transition/ or create your own. -->
        <link rel="stylesheet" media="screen" href="themes/transition/horizontal-slide.css">

        <!-- Basic black and white print styles -->
        <link rel="stylesheet" media="print" href="core/print.css">

        <link rel="stylesheet"  href="css/radiostyle.css">

        <!-- Required Modernizr file -->
        <script src="modernizr.custom.js"></script>
        <style>
            .disciplinas{
                width: 92%;
                height: 100%;
            }
            .disc{
                margin: 20px;
                border: 1px solid black;
                border-radius: 25px;
                float: left;
                width: 150px;
                height: 150px;
                text-align: center;                
            }
            .disc:hover{
                background: gray;
                margin: 20px;
                border: 1px solid black;
                border-radius: 25px;
                float: left;
                width: 150px;
                height: 150px;
                text-align: center;

            }
            .disc h3{
                margin:auto;
                height: 100%;
                width: 100%;
                vertical-align: central;
                font-size: 70%;
            }
            .disc h3:hover{

                margin:auto;
                height: 100%;
                width: 100%;
                vertical-align: central;
                font-size: 70%;
                color: black;
            }
            .disc a {  
                text-decoration: none;
                z-index: 1;     
                margin: 0em;                
            }
        </style>
    </head>
    <body>




        <div class="deck-container">



            <!-- Begin slides. Just make elements with a class of slide. -->


            <section class="slide">
                <div style="margin-top: 20px; float: right; width:40px; height:40px;">
                    <a class="naofala" href="confi.jsp"><img class="naofala" src="imagens/45712.png"></a>
                </div> 
                </br>
                <h3 style="text-align: center; color:black;">Disciplinas</h3>
                <div class="disciplinas">
                    <%for (Disciplina item : disciplinas) {
                    %>

                    <div class="disc ">
                        <a href="apresentacao.jsp?id=<%=item.getDcod()%>"><h3><%=item.getDnome()%></h3></a>
                    </div>
                    <!--<button class="naofala" ><a class="naofala"></a></button>-->

                    <%}%>
                </div>
            </section>

            <!-- End slides. -->

            <!-- Begin extension snippets. Add or remove as needed. -->

            <!-- deck.navigation snippet -->
            <div aria-role="navigation">
                <a href="#" class="deck-prev-link" title="Previous">&#8592;</a>
                <a href="#" class="deck-next-link" title="Next">&#8594;</a>
            </div>

            <!-- deck.status snippet -->
            <p class="deck-status" aria-role="status">
                <span class="deck-status-current"></span>
                /
                <span class="deck-status-total"></span>
            </p>

            <!-- deck.goto snippet -->
            <form action="." method="get" class="goto-form">
                <label for="goto-slide">Go to slide:</label>
                <input type="text" name="slidenum" id="goto-slide" list="goto-datalist">
                <datalist id="goto-datalist"></datalist>
                <input type="submit" value="Go">
            </form>

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
            $(function () {
                $.deck('.slide');
            });
        </script>
    </body>
</html>
