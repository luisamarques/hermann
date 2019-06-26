<%@page import="modelo.Apresentacao"%>
<%@page import="DAO.SlideDAO"%>
<%@page import="modelo.Slide"%>
<%@page import="DAO.ApresentacaoDAO"%>
<%@include file="cabecalho.jsp"%>
<%    String tipo = request.getParameter("tipo");
    ApresentacaoDAO adao = new ApresentacaoDAO();
    Apresentacao a = (Apresentacao) session.getAttribute("apresentacao");
    a = adao.buscarPorChavePrimaria(a.getApcod());
    Slide s = new Slide();
    SlideDAO sdao = new SlideDAO();
    if (request.getMethod().equals("POST")) {
        if (request.getParameter("txtTitulo") != null) {
            s.setStipo(tipo);
            s.setApcod(a);
            s.setStitulo(request.getParameter("txtTitulo"));
            Boolean resultado = sdao.incluir(s);
            if (resultado) {
                response.sendRedirect("layoutsprancha.jsp");
            }

        }

    }
%>
<div class="form-element-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="form-element-list">
                    <form method="POST">
                        <div class="basic-tb-hd">
                            <h2>Slide de Título</h2>

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