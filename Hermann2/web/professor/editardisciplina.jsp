<%@page import="DAO.DisciplinaDAO"%>
<%@page import="modelo.Disciplina"%>
<%@include file="cabecalho.jsp"%>
<%    String msg = "";
    String classe = "";

    Disciplina d = new Disciplina();
    DisciplinaDAO ddao = new DisciplinaDAO();
    d = ddao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
    if (request.getMethod().equals("POST")) {

        //popular com oq ele digitou no form
        d.setDnome(request.getParameter("txtNome"));
        d.setDperiodo(request.getParameter("txtPeriodo"));

        Boolean resultado = ddao.alterar(d);

        if (resultado) {
            msg = "Registro alterado com sucesso";
            classe = "alert-success";
            response.sendRedirect("gerenciardisciplinas.jsp");
        } else {
            msg = "Não foi possível alterar";
            classe = "alert-danger";
        }

    } else {
        //e GET
        if (request.getParameter("codigo") == null) {
            response.sendRedirect("indexp.jsp");
            return;
        }

        ddao = new DisciplinaDAO();
        d = ddao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));

        if (d == null) {
            response.sendRedirect("indexp.jsp");
            return;
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
                            <h2>Editar disciplina <%=d.getDnome()%></h2>
                            <p></p>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">

                                    <div class="nk-int-st">
                                        <input type="text" name="txtNome" value="<%=d.getDnome()%>"class="form-control input-lg" placeholder="Nome">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">

                                    <div class="nk-int-st">
                                        <input type="text" name="txtPeriodo" value="<%=d.getDperiodo()%>"class="form-control input-lg" placeholder="Nome">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-element-list mg-t-30">
                                    <div class="button-icon-btn">
                                        <button type="submit" class="btn btn-default btn-icon-notika .btn-lg"><i class="notika-icon notika-checked"></i> Salvar</button>
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