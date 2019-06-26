<%@page import="modelo.Apresentacao"%>
<%@page import="DAO.SlideDAO"%>
<%@page import="modelo.Slide"%>
<%@include file="cabecalho.jsp"%>
<%    String tipo = request.getParameter("tipo");
    Slide s = new Slide();
    SlideDAO sdao = new SlideDAO();
    if (request.getParameter("txtTitulo") != null && request.getParameter("txtTexto") != null) {
        s.setStitulo(request.getParameter("txtTitulo"));
        s.setStexto(request.getParameter("txtTexto"));
        s.setApcod((Apresentacao) session.getAttribute("apresentacao"));
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
                    <form method="post">
                        <div class="basic-tb-hd">
                            <h2>Slide de título e texto</h2>

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