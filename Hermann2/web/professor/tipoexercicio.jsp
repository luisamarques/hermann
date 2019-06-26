<%@page import="DAO.QuestaoDAO"%>
<%@page import="DAO.SlideDAO"%>
<%@page import="modelo.Questao"%>
<%@page import="modelo.Exercicio"%>
<%@page import="DAO.ExercicioDAO"%>
<%@include file="cabecalho.jsp" %>
<%    
    ExercicioDAO edao = new ExercicioDAO();
    Exercicio e = new Exercicio();
    if (request.getParameter("id") != null) {
        e = edao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("id")));
    }
    if (request.getParameter("id") == null) {
        e = (Exercicio) session.getAttribute("exercicio");
    }

    //Questao q = new Questao();
    //QuestaoDAO qdao = new QuestaoDAO();
    //q.setEcod(e);
%>
<div class="breadcomb-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="breadcomb-list">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <div class="breadcomb-wp">
                                <div class="breadcomb-icon">
                                    <i class="notika-icon notika-form"></i>
                                </div>
                                <div class="breadcomb-ctn">
                                    <h2>Escolha o tipo da questão</h2>
                                    <p>Exercício <%=e.getEtitulo()%></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-3">
                            <div class="breadcomb-report">
                                <!--<a href="http://www2.bage.ifsul.edu.br:8181/Pranchas/p1.jsp?id//a.getApcod()%>"data-toggle="tooltip" data-placement="left" class="btn btn-default btn-icon-notika"> Preview</a> -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="animation-area">
    <div class="container">       

        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                <div class="animation-single-int">
                    <div class="animation-ctn-hd">
                        <h2>Certo ou Errado</h2>

                    </div>
                    <div class="animation-img mg-b-15">
                        <a href="dadosvouf.jsp?tipo=vf">  <img class="animate-one" src="img/layouts/vf.png" alt="" /></a>
                    </div>                    
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                <div class="animation-single-int sm-res-mg-t-30">
                    <div class="animation-ctn-hd">
                        <h2>Múltipla escolha</h2>

                    </div>
                    <div class="animation-img mg-b-15">
                        <a href="dadosmultiplaescolha.jsp?tipo=me">  <img class="animate-two" src="img/layouts/multiplae.png" alt="" /></a>
                    </div>                 
                </div>
            </div>
        </div>
    </div>
</div>
<br/>
<br/>
<br/>
<br/>
<br/>
<%@include file="rodape.jsp"%>