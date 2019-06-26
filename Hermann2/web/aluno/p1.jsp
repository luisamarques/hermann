<%@page import="modelo.Professor"%>
<%@page import="DAO.AlunoDAO"%>
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
        Confi c = new Confi();
        Apresentacao obj;
        String a;
        String titulo;
        String id;
        if(aluno==null){
            Professor professor = (Professor) session.getAttribute("professor");
            if(professor == null){
                response.sendRedirect("login_cadastro.jsp");
                return;
            }else{
                
                id = request.getParameter("id");
                ApresentacaoDAO dao = new ApresentacaoDAO();
                obj = dao.buscarPorChavePrimaria(Integer.parseInt(id));
                SlideDAO sdao = new SlideDAO();
                
            }
        }else{
            AlunoDAO adao = new AlunoDAO();
            //Confi c = new Confi();
            aluno = adao.buscarPorChavePrimaria(aluno.getAcod());
            if(aluno.getConfig()!=null){
                c = aluno.getConfig();
            }
            id = request.getParameter("id");
            ApresentacaoDAO dao = new ApresentacaoDAO();
            obj = dao.buscarPorChavePrimaria(Integer.parseInt(id));
            SlideDAO sdao = new SlideDAO();
            
        }
    %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=1024, user-scalable=no">

        <title>Prancha</title>

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



        <%if (c.getCtamanho() != null) {%>      
        <div class="deck-container" style="font-size: <%=c.getCtamanho()%>">
            <%}%>
            <%if (c.getCtamanho() == null) {%>
            <div class="deck-container">
                <%}%>  


                <!-- Begin slides. Just make elements with a class of slide. -->


                <%for (Slide s : obj.getSlideList()) {
                        a = s.getStipo();
                        titulo = s.getStitulo();
                        //switch(s.getStipo()){
                %>
                <section class="slide">

                    <div class="naofala" style="margin-top: 20px; float: right; width:60px; height:60px;">
                        <a class="naofala" href="apresentacao.jsp?id=<%=id%>"><img class="naofala" src="imagens/fechar.png"></a>
                    </div>
                    <%
                        if (a.equals("tso")) {

                            out.print("<h2>" + s.getStitulo() + "</h2>");
                        } else if (a.equals("tt")) {
                            out.print("<h2>" + s.getStitulo() + "</h2>");
                            out.print("<p>" + s.getStexto() + "</p>");
                        } else if (a.equals("ti")) {
                            out.print("<h2>" + s.getStitulo() + "</h2>");
                            out.print("<img src='../professor/arquivos/" + s.getSimg1() + "' title='" + s.getSlegendaimg1() + "'>");
                        } else if (a.equals("tti")) {
                            out.print("<h2>" + s.getStitulo() + "</h2>");
                            out.print("<p>" + s.getStexto() + "</p>");
                            out.print("<img src='../professor/arquivos/" + s.getSimg1() + "' title='" + s.getSlegendaimg1() + "'>");
                        } else if (a.equals("i")) {
                            out.print("<img src='../professor/arquivos/" + s.getSimg1() + "' title='" + s.getSlegendaimg1() + "'>");

                        }
                    %>


                </section>
                <%
                    }
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
