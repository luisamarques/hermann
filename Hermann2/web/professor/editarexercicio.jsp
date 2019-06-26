<%@page import="modelo.Questao"%>
<%@page import="DAO.QuestaoDAO"%>
<%@page import="modelo.Disciplina"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Disciplina"%>
<%@page import="modelo.Professor"%>
<%@page import="modelo.Professor"%>
<%@page import="DAO.DisciplinaDAO"%>
<%@page import="modelo.Exercicio"%>
<%@page import="DAO.ExercicioDAO"%>
<%@include file="cabecalho.jsp"%>
<%    Integer id = Integer.parseInt(request.getParameter("id"));
    ExercicioDAO edao = new ExercicioDAO();
    Exercicio e = edao.buscarPorChavePrimaria(id);
    DisciplinaDAO ddao = new DisciplinaDAO();
    List<Disciplina> dlista = ddao.listarporprof((Professor) session.getAttribute("professor"));
    List<Questao> qlista;
    QuestaoDAO qdao = new QuestaoDAO();

    if (request.getMethod().equals("POST")) {

        //popular com oq ele digitou no form
        Disciplina d = new Disciplina();
        d = ddao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("txtDisciplina")));
        e.setEtitulo(request.getParameter("txtTitulo"));
        e.setDcod(d);
        e.setEtipo(request.getParameter("txtTipo"));
        if (request.getParameter("txtPub") != null) {
            e.setEpublico(true);
        } else if (request.getParameter("txtPub") == null) {
            e.setEpublico(false);
        }
        Boolean resultado = edao.alterar(e);
        if (resultado) {

            response.sendRedirect("gerenciarexercicios.jsp");
        } else {

        }
    } else {
        //e GET
        if (request.getParameter("id") == null) {
            response.sendRedirect("gerenciarexercicios.jsp");
            return;
        }

        edao = new ExercicioDAO();
        e = edao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("id")));

        if (e == null) {
            response.sendRedirect("gerenciarexercicios.jsp");
            return;
        }
    }
    if (request.getParameter("codigo") != null) {
        Questao q = qdao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
        if (q != null) {
            qdao.excluir(q);
        }
    }
    qlista = qdao.listarporex(e);

%>
<div class="breadcomb-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="breadcomb-list">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <div class="breadcomb-wp">
                                <div class="breadcomb-icon">
                                    <i class="notika-icon notika-form"></i>
                                </div>
                                <div class="breadcomb-ctn">
                                    <% String tipo ="";
                                        if(e.getEtipo().equals("pro")){
                                            tipo = "prova";
                                        }else if(e.getEtipo().equals("exe")){
                                            tipo = "exercício";
                                        }
                                    %>
                                    <h2>Editar <%=tipo%>: <%=e.getEtitulo()%></h2>

                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-3">
                            <div class="breadcomb-report">
                                <a href="tipoexercicio.jsp?id=<%=e.getEcod()%>"data-toggle="tooltip" data-placement="left" class="btn btn-default btn-icon-notika"> Adicionar Questão</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="form-element-list">
                <form method="POST">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="form-group">
                                <div class="nk-int-st">
                                    <input type="text" name="txtTitulo" value="<%=e.getEtitulo()%>"class="form-control input-lg" placeholder="Nome">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                            <div class="bootstrap-select fm-cmp-mg">
                                <select name="txtTipo" placeholder="Tipo" class="selectpicker">
                                    <%
                                        String selexerc = "";
                                        String selprova = "";
                                        if (e.getEtipo().equals("exe")) {
                                            selexerc = "selected";
                                        } else if (e.getEtipo().equals("pro")) {
                                            selprova = "selected";
                                        }%>
                                    <option value="exe"<%=selexerc%>>Exercício</option>
                                    <option value="pro"<%=selprova%>>Prova</option>                          
                                </select>
                            </div>
                        </div>
                    </div><br/>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <div class="toggle-select-act fm-cmp-mg">
                                <div class="nk-toggle-switch">
                                    <%
                                        String checked = "";
                                        if (e.getEpublico() == true) {
                                            checked = "checked";
                                        }%>
                                    <label for="ts1" class="ts-label">Público</label>
                                    <input id="ts1" <%=checked%> name="txtPub" type="checkbox" hidden="hidden">
                                    <label for="ts1" class="ts-helper"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br/>
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                            <div class="bootstrap-select fm-cmp-mg">
                                <select name="txtDisciplina" placeholder="Disciplina" class="selectpicker">
                                    <%
                                        String selecionado;
                                        for (Disciplina item : dlista) {
                                            if (e.getDcod().getDcod() == item.getDcod()) {
                                                selecionado = "selected";
                                            } else {
                                                selecionado = "";
                                            }%>
                                    <option value="<%=item.getDcod()%>" <%=selecionado%>><%=item.getDnome()%></option>
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
<div class="data-table-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="data-table-list">
                    <div class="table-responsive">
                        <table id="data-table-basic" class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Pergunta</th>
                                    <th>Tipo</th>
                                    <th></th>
                                    <th></th>

                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    String tipoo = "";
                                    for (Questao item : qlista) {
                                        if (item.getEtipo().equals("me")) {
                                            tipoo = "Múltipla escolha";

                                        } else if (item.getEtipo().equals("vf")) {
                                            tipoo = "Certo/Errado";

                                        }

                                %>
                                <tr>
                                    <td><%=item.getEpergunta()%></td>
                                    <td><%=tipoo%></td>                                   
                                    <td><a href="editarquestao<%=item.getEtipo()%>.jsp?codigo=<%=item.getQcod()%>" class="btn btn-default btn-icon-notika .btn-sm"><i class="notika-icon notika-menus"></i> Editar</a></td>
                                    <td><a href="editarexercicio.jsp?codigo=<%=item.getQcod()%>&id=<%=id%>"class="btn btn-default btn-icon-notika .btn-xs"><i class="notika-icon notika-close"></i> Excluir</a>

                                </tr>
                                <%}%>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>Pergunta</th>
                                    <th>Tipo</th>
                                    <th></th>
                                    <th></th>

                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="rodape.jsp"%>