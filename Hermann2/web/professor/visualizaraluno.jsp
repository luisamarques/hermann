<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Disciplina"%>
<%@page import="DAO.DisciplinaDAO"%>
<%@page import="DAO.DisciplinaDAO"%>
<%@page import="modelo.Aluno"%>
<%@page import="DAO.AlunoDAO"%>
<%@include file="cabecalhog.jsp"%>
<%
    AlunoDAO adao = new AlunoDAO();
    Aluno a = adao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("id")));
    DisciplinaDAO ddao = new DisciplinaDAO();
    if (request.getMethod().equals("POST")) {
        if (request.getParameter("selectdisciplinas") != null) {
            String[] disciplinasid = request.getParameterValues("selectdisciplinas");
            List<Disciplina> listadisciplinas = new ArrayList<>();
            for (String id : disciplinasid) {
                Integer idinteger = Integer.parseInt(id);
                listadisciplinas.add(new Disciplina(idinteger));
            }
            a.setDisciplinaList(listadisciplinas);
        }
        Boolean resultado = adao.alterar(a);

        if (resultado) {
            response.sendRedirect("alunos.jsp");
        }
    }
    List<Disciplina> disciplinas = ddao.listar();
%>
<div class="form-element-area">
    <div class="container">
        <div class="row"><div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="form-element-list mg-t-30">
                        <div class="cmp-tb-hd">
                            <h2>Relacionar Aluno <%=a.getAnome()%></h2>

                        </div>
                        <br/>
                        <form method="POST">
                            <br/>
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                    <div class="nk-int-mk sl-dp-mn sm-res-mg-t-10">
                                        <h2>Disciplinas</h2>
                                    </div>
                                    <div class="bootstrap-select fm-cmp-mg">
                                        <select name="selectdisciplinas"class="selectpicker" multiple>
                                            <%
                                                String selecionadoo;
                                                for (Disciplina item : disciplinas) {
                                                    if (a.getDisciplinaList().contains(item)) {
                                                        selecionadoo = "selected";
                                                    } else {
                                                        selecionadoo = "";
                                                    }
                                            %>
                                            <option value="<%=item.getDcod()%>" <%=selecionadoo%>><%=item.getDnome()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <br/><br/><br/>
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
<br/>
<br/>
<br/>
<br/>
<%
    adao.fecharConexao();
%>
<%@include file="rodape.jsp"%>