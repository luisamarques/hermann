<%@page import="DAO.SlideDAO"%>
<%@page import="modelo.Slide"%>
<%@page import="modelo.Apresentacao"%>
<%@include file="cabecalho.jsp" %>
<%    Apresentacao a = (Apresentacao) session.getAttribute("apresentacao");
    String tipo = request.getParameter("tipo");
    Slide s = new Slide();
    SlideDAO sdao = new SlideDAO();
    if (request.getParameter("txtTitulo") != null && request.getParameter("txtTexto") != null && request.getParameter("txtImagem") != null && request.getParameter("txtLegenda") != null) {
        s.setApcod(a);
        s.setSimg1(request.getParameter("txtImagem"));
        s.setStitulo(request.getParameter("txtTitulo"));
        s.setStexto(request.getParameter("txtTexto"));
        s.setSlegendaimg1(request.getParameter("txtLegenda"));
        s.setStipo(tipo);
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
                            <h2>Slide de título, texto e imagem</h2>

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
                                        <textarea class="form-control" name="txtTexto" rows="5" placeholder="Digite aqui o texto"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">

                                    <div class="nk-int-st">
                                        <input type="file" name="txtImagem" class="form-control input-lg">
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
<%@include file="rodape.jsp" %>