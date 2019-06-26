<%@page import="modelo.Slide"%>
<%@page import="DAO.SlideDAO"%>
<%@page import="modelo.Apresentacao"%>
<%@include file="cabecalho.jsp"%>
<%
    Apresentacao a = (Apresentacao) session.getAttribute("apresentacao");
    SlideDAO sdao = new SlideDAO();
    Slide s = new Slide();
    s = sdao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo"))); 
    if (request.getMethod().equals("POST")) {
        s = sdao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));

        s.setStitulo(request.getParameter("txtTitulo"));
        Boolean resultado = sdao.alterar(s);
        if (resultado) {
            response.sendRedirect("gerenciarpranchas.jsp");
            return;
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
                            <h2>Editar Slide</h2>
                            
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