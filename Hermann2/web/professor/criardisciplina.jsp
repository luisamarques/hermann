<%@page import="modelo.Professor"%>
<%@page import="DAO.ProfessorDAO"%>
<%@page import="DAO.DisciplinaDAO"%>
<%@page import="modelo.Disciplina"%>
<%@include file="cabecalho.jsp"%>
<%
    String msg = "";
    String classe = "";
    Disciplina d = new Disciplina();
    DisciplinaDAO dao = new DisciplinaDAO();
    if (request.getParameter("txtNome") != null && request.getParameter("txtPeriodo") != null) {
        d.setDnome(request.getParameter("txtNome"));
        d.setDperiodo(request.getParameter("txtPeriodo"));

        ProfessorDAO pdao = new ProfessorDAO();
        Professor p = new Professor();
        p = (Professor) session.getAttribute("professor");
        d.setPcod(p);
        Boolean resultado = dao.incluir(d);
        if (resultado) {
            msg = "Registro cadastrado com sucesso";
            classe = "alert-sucess";
            response.sendRedirect("gerenciardisciplinas.jsp");
        } else {
            msg = "Não foi possível realizar seu cadastro";
            classe = "alert-danger";
        }
    }


%>

<div class="form-element-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="form-element-list">
                    <form>
                        <div class="basic-tb-hd">
                            <h2>Adicionar Disciplina</h2>
                            <p>Para poder cadastrar uma apresentação você precisa cadastrar uma disciplina</p>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">

                                    <div class="nk-int-st">
                                        <input type="text" name="txtNome" class="form-control input-lg" placeholder="Nome">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">

                                    <div class="nk-int-st">
                                        <input type="text" name="txtPeriodo" class="form-control input-lg" placeholder="Período. Exemplo: 2019/1">
                                    </div>
                                </div>
                            </div>
                        </div>
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
        </form>

    </div> 
</div>
<%@include file="rodape.jsp"%>