<%@page import="DAO.AlunoDAO"%>
<%@page import="DAO.ConfiDAO"%>
<%@page import="modelo.Confi"%>
<%@page import="modelo.Aluno"%>
<%@page import="modelo.Exercicio"%>
<%@page import="DAO.QuestaoDAO"%>
<%@page import="DAO.ExercicioDAO"%>
<%@page import="modelo.Questao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <%
        String id = request.getParameter("id");
        Aluno aluno = (Aluno) session.getAttribute("aluno");
        if(aluno==null){
            response.sendRedirect("login_cadastro.jsp");
            return;
        }
        AlunoDAO adao = new AlunoDAO();
        Confi c = new Confi();
        aluno = adao.buscarPorChavePrimaria(aluno.getAcod());
        if(aluno.getConfig()!=null){
            c = aluno.getConfig();
        }
        
        
        ExercicioDAO edao = new ExercicioDAO();
        Exercicio obj = edao.buscarPorChavePrimaria(Integer.parseInt(id));

        QuestaoDAO qdao = new QuestaoDAO();
        String e;
        String pergunta;

    %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=1024, user-scalable=no">

        <title><%=obj.getEtitulo()%></title>

        <!-- Required stylesheet -->
        <link rel="stylesheet" media="screen" href="core/deck.core.css">

        <!-- Extension CSS files go here. Remove or add as needed. -->
        <link rel="stylesheet" media="screen" href="extensions/goto/deck.goto.css">
        <link rel="stylesheet" media="screen" href="extensions/menu/deck.menu.css">
        <link rel="stylesheet" media="screen" href="extensions/navigation/deck.navigation.css">
        <link rel="stylesheet" media="screen" href="extensions/status/deck.status.css">
        <link rel="stylesheet" media="screen" href="extensions/scale/deck.scale.css">

        <!-- Style theme. More available in /themes/style/ or create your own. -->
        <%if (c.getCestilo() == null) {%> 
        <link rel="stylesheet" media="screen" href="themes/style/swiss.css">
        <%}%>
        <%if (c.getCestilo() != null) {%>
        <link rel="stylesheet" media="screen" href="themes/style/<%=c.getCestilo()%>.css">
        <%}%>

        <!-- Transition theme. More available in /themes/transition/ or create your own. -->
        <link rel="stylesheet" media="screen" href="themes/transition/horizontal-slide.css">

        <!-- Basic black and white print styles -->
        <link rel="stylesheet" media="print" href="core/print.css">
        <link rel="stylesheet"  href="css/radiostyle.css">

        <!-- Required Modernizr file -->
        <script src="modernizr.custom.js"></script>
    </head>
    <body>


        <%if (c.getCtamanho() == null) {%>      
        <div class="deck-container" style="font-size: <%=c.getCtamanho()%>">
            <%}%>
            <%if (c.getCtamanho() != null) {%>
            <div class="deck-container">
                <%}%>  

                <form class="naofala" id="myform" action="exercicio_respondido.jsp" method="post"></form>

                <!-- Begin slides. Just make elements with a class of slide. -->

 <input type="hidden" name="exercicio" value="<%=request.getParameter("id")%>" form="myform">
                <%
                    for (Questao q : obj.getQuestaoList()) {
                        e = q.getEtipo();                  
                        pergunta = q.getEpergunta();
                        //switch(s.getStipo()){
                %>
                <section class="slide">

                    <div class="naofala" style="margin-top: 20px; float: right; width:60px; height:60px;">
                        <a class="naofala" href="exercicio.jsp?id=<%=id%>"><img class="naofala" src="imagens/fechar.png"></a>
                    </div>
                   
                    <%
                        if (e.contains("vf")) {

                            out.print("<h2>" + q.getEpergunta() + "</h2>");
                            out.print("<div class='questao'><label><input value='C' type='radio' form='myform' class='naofala option-input radio' name='q" + q.getQcod() + "'  />" + q.getEalt1() + "</label></div>");
                            out.print("<div class='questao'><label><input value='E' type='radio' form='myform' class='naofala option-input radio' name='q" + q.getQcod() + "'  />" + q.getEalt2() + "</label></div>");
                        } else if (e.contains("me")) {
                            out.print("<h2>" + q.getEpergunta() + "</h2>");
                            out.print("<div class='questao'><label><input value='A' type='radio' form='myform' class='naofala option-input radio' name='q" + q.getQcod() + "'  />" + q.getEalt1() + "</label></div>");
                            out.print("<div class='questao'><label><input value='B' type='radio' form='myform' class='naofala option-input radio' name='q" + q.getQcod() + "'  />" + q.getEalt2() + "</label></div>");
                            out.print("<div class='questao'><label><input value='C' type='radio' form='myform' class='naofala option-input radio' name='q" + q.getQcod() + "'  />" + q.getEalt3() + "</label></div>");
                            out.print("<div class='questao'><label><input value='D' type='radio' form='myform' class='naofala option-input radio' name='q" + q.getQcod() + "'  />" + q.getEalt4() + "</label></div>");
                            out.print("<div class='questao'><label><input value='E' type='radio' form='myform' class='naofala option-input radio' name='q" + q.getQcod() + "'  />" + q.getEalt5() + "</label></div>");

                        }
                    %>


                </section>
                <%
                    }
                    out.print("<section class='slide'><h2>Finalizando</h2><input class='naofala' form='myform' type='submit'></section>");
                %>



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
