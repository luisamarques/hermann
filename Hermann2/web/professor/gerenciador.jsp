<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Disciplina"%>
<%@page import="DAO.DisciplinaDAO"%>
<%@page import="modelo.Aluno"%>
<%@page import="java.util.List"%>
<%@page import="DAO.AlunoDAO"%>
<%@include file="cabecalhog.jsp"%>
<%
    AlunoDAO adao = new AlunoDAO();
    List<Aluno> alunos = adao.listar();
    DisciplinaDAO ddao = new DisciplinaDAO();
    List<Disciplina> disciplinas = ddao.listar();
    Aluno aluno = new Aluno();
    if (request.getMethod().equals("POST")) {
        if (request.getParameter("txtAluno") != null) {
            Integer aid = Integer.parseInt(request.getParameter("txtAluno"));
            aluno = adao.buscarPorChavePrimaria(aid);           
            String[] disciplinasid = request.getParameterValues("selectdisciplinas");

            List<Disciplina> listadisciplinas = new ArrayList<>();
            for (String id : disciplinasid) {
                Integer idinteger = Integer.parseInt(id);
                listadisciplinas.add(new Disciplina(idinteger));

            }
            aluno.setDisciplinaList(listadisciplinas);
        }
        Boolean resultado = adao.incluir(aluno);
        adao.fecharConexao();
        if (resultado) {
            response.sendRedirect("gerenciador.jsp");
        } 
    }

%>
<div class="form-element-area">
    <div class="container">
        <div class="row"><div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="form-element-list mg-t-30">
                        <div class="cmp-tb-hd">
                            <h2>Relacionar Aluno - Disciplina</h2>

                        </div>
                        <br/>
                        <form method="POST">
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                    <div class="nk-int-mk sl-dp-mn sm-res-mg-t-10">
                                        <h2>Aluno</h2>
                                    </div>
                                    <div class="bootstrap-select fm-cmp-mg">
                                        <select name="txtAluno" class="selectpicker" data-live-search="true">
                                            <%for (Aluno item : alunos) {

                                            %>
                                            <option value="<%=item.getAcod()%>"><%=item.getAnome()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <br/>

                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                    <div class="nk-int-mk sl-dp-mn sm-res-mg-t-10">
                                        <h2>Disciplinas</h2>
                                    </div>
                                    <div class="bootstrap-select fm-cmp-mg">
                                        <select name="selectdisciplinas"class="selectpicker" multiple>
                                            <%for (Disciplina item : disciplinas) {

                                            %>
                                            <option value="<%=item.getDcod()%>"><%=item.getDnome()%></option>
                                            <%}%>
                                        </select>
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
        </div>
    </div>
</div>
<%@include file="rodape.jsp"%>