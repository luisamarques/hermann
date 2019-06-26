<%@page import="DAO.ApresentacaoDAO"%>
<%@page import="DAO.SlideDAO"%>
<%@page import="modelo.Slide"%>
<%@page import="modelo.Apresentacao"%>
<%@include file="cabecalho.jsp"%>
<%    
    String tipo = request.getParameter("tipo");
    ApresentacaoDAO adao = new ApresentacaoDAO();
     Apresentacao a = (Apresentacao) session.getAttribute("apresentacao");
    a = adao.buscarPorChavePrimaria(a.getApcod());
    Slide s = new Slide();
    SlideDAO sdao = new SlideDAO();
    if (request.getParameter("txtTitulo") != null && request.getParameter("txtImagem1") != null
            && request.getParameter("txtLegenda") != null) {
        s.setApcod(a);
        s.setStipo(tipo);
        s.setStitulo(request.getParameter("txtTitulo"));
        s.setSimg1(request.getParameter("txtImagem1"));
        s.setSlegendaimg1(request.getParameter("txtLegenda"));
        Boolean resultado = sdao.incluir(s);
        if (resultado) {
            response.sendRedirect("layoutsprancha.jsp");
        }
    }


%>
<div class="form-element-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="form-element-list">
                    <form method="POST" action="UploadWS" enctype="multipart/form-data"  >
                        <div class="basic-tb-hd">
                            <h2>Slide de título e imagem    </h2>

                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">

                                    <div class="nk-int-st">
                                        <input type="text" name="txtTitulo" class="form-control input-lg" placeholder="Digite aqui o título do slide">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br/> 
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">

                                    <div class="nk-int-st">
                                        <input type="file" name="txtImagem1" class="form-control input-lg">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">

                                    <div class="nk-int-st">
                                        <input type="text" name="txtLegenda" class="form-control input-lg" placeholder="Digite aqui a legenda da imagem">
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-element-list mg-t-30">
                                    <div class="button-icon-btn">
                                        <button type="submit" class="btn btn-default btn-icon-notika .btn-lg"><i class="notika-icon notika-checked"></i>Salvar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>       
    </div> 
</div>
<%@include file="rodape.jsp"%>