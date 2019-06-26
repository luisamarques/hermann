<%@page import="DAO.SlideDAO"%>
<%@page import="modelo.Slide"%>
<%@include file="cabecalho.jsp"%>
<%    SlideDAO sdao = new SlideDAO();
    Slide s = new Slide();
    s = sdao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
    if (request.getMethod().equals("POST")) {
        s.setStitulo(request.getParameter("txtTitulo"));
        s.setSlegendaimg1(request.getParameter("txtLegenda"));
        s.setSimg1(request.getParameter("txtImagem"));
        Boolean resultado = sdao.alterar(s);
        if (resultado) {
            response.sendRedirect("gerenciarpranchas.jsp");
        }
    }
%>
<div class="form-element-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="form-element-list">
                    <form method="post" action="../UploadWS" enctype="multipart/form-data">
                        <div class="basic-tb-hd">
                            <h2>Slide de título e imagem    </h2>

                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">

                                    <div class="nk-int-st">
                                        <input type="text" name="txtTitulo" value="<%=s.getStitulo()%>" class="form-control input-lg" placeholder="Digite aqui o título do slide">
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
                                        <input type="text" name="txtLegenda" value="<%=s.getSlegendaimg1()%>"class="form-control input-lg" placeholder="Digite aqui a legenda da imagem">
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