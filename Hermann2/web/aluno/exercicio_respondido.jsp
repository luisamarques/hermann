<%@page import="DAO.RespquestDAO"%>
<%@page import="DAO.RespexercDAO"%>
<%@page import="modelo.Respexerc"%>
<%@page import="modelo.Respquest"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Questao"%>
<%@page import="modelo.Exercicio"%>
<%@page import="DAO.ExercicioDAO"%>
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
        if(aluno==null){
            response.sendRedirect("login_cadastro.jsp");
            return;
        }
        
        String id = request.getParameter("exercicio");
               
        ExercicioDAO edao = new ExercicioDAO();
        Exercicio e = edao.buscarPorChavePrimaria(Integer.parseInt(id));

        Respexerc rx = new Respexerc();
        RespexercDAO rxdao = new RespexercDAO();
        rx.setAcod(aluno);
        rx.setEcod(e);

        rxdao.incluir(rx);

        RespquestDAO rqdao = new RespquestDAO();

        List<Respquest> respostas = new ArrayList<>();
        for (Questao elem : e.getQuestaoList()) {
            Respquest r = new Respquest();
            r.setQcod(elem);
            String respondida = request.getParameter("q" + elem.getQcod());
            r.setResposta(respondida);
            r.setRecod(rx);

            rqdao.incluir(r);

        }

    %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=1024, user-scalable=no">

        <title>Exercicio</title>

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

    </head>
    <body>


        
            <div class="deck-container">
               
                <!-- Begin slides. Just make elements with a class of slide. -->


                <section class="slide">
                    <div class="naofala" style="margin-top: 20px; float: right; width:60px; height:60px;">
                        <a class="naofala" href="exercicio.jsp?id=<%=id%>"><img class="naofala" src="imagens/fechar.png"></a>
                    </div> 
                    </br>
                    </br>
                    <h3 style="text-align: center; color:black;">Exercício respondido com sucesso!</h3>

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
