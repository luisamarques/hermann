<%@page import="DAO.SlideDAO"%>
<%@page import="modelo.Slide"%>
<%@page import="modelo.Apresentacao"%>
<%@page import="DAO.ApresentacaoDAO"%>
<%@include file="cabecalho.jsp"%>
<%    
    ApresentacaoDAO adao = new ApresentacaoDAO();
    Apresentacao a = new Apresentacao();
    if (request.getParameter("id") != null) {
        a = adao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("id")));
    } else if (request.getParameter("id") == null) {
       a  =  (Apresentacao) session.getAttribute("apresentacao");
    }
    
    Slide s = new Slide();
    SlideDAO sdao = new SlideDAO();
    s.setApcod(a);

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
                                    <h2>Escolha o layout do slide</h2>
                                    <p>Apresentação: <%=a.getAtitulo()%></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-3">
                            <div class="breadcomb-report">
                                <a href="../aluno/p1.jsp?id=<%=a.getApcod()%>"data-toggle="tooltip" data-placement="left" class="btn btn-default btn-icon-notika"> Preview</a>
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
                        <h2>Título</h2>

                    </div>
                    <div class="animation-img mg-b-15">
                        <a href="dadostitulo.jsp?tipo=tso">  <img class="animate-one" src="img/layouts/titulonovoo.png" alt="" /></a>
                    </div>                    
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                <div class="animation-single-int sm-res-mg-t-30">
                    <div class="animation-ctn-hd">
                        <h2>Título e texto</h2>

                    </div>
                    <div class="animation-img mg-b-15">
                        <a href="dadostitulotexto.jsp?tipo=tt">  <img class="animate-two" src="img/layouts/titulotextoo.png" alt="" /></a>
                    </div>                 
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                <div class="animation-single-int sm-res-mg-t-30">
                    <div class="animation-ctn-hd">
                        <h2>Título e imagem</h2>

                    </div>
                    <div class="animation-img mg-b-15">
                        <a href="dadostituloimagem.jsp?tipo=ti"><img class="animate-three" src="img/layouts/tituloimagemm.png" alt="" /></a>                    </div>                  
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                <div class="animation-single-int sm-res-mg-t-30">
                    <div class="animation-ctn-hd">
                        <h2>Título, texto e imagem</h2>

                    </div>
                    <div class="animation-img mg-b-15">
                        <a href="dadostitulotextoimagem.jsp?tipo=tti"><img class="animate-three" src="img/layouts/titulotextoimagemm.png" alt="" /></a>
                    </div>                  
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                <div class="animation-single-int sm-res-mg-t-30">
                    <div class="animation-ctn-hd">
                        <h2>Imagem</h2>

                    </div>
                    <div class="animation-img mg-b-15">
                        <a href="dadosimagem.jsp?tipo=i"><img class="animate-three" src="img/layouts/titulotextoimagemm.png" alt="" /></a>
                    </div>                  
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="rodape.jsp"%>