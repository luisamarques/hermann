<%@page import="DAO.DisciplinaDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Professor"%>
<%@page import="DAO.ExercicioDAO"%>
<%@page import="modelo.Exercicio"%>
<%@page import="modelo.Disciplina"%>
<%@include file="cabecalho.jsp"%>
<%    String classe = "";
    String msg = "";
    Exercicio e = new Exercicio();
    ExercicioDAO edao = new ExercicioDAO();
    Professor p = new Professor();
    p = (Professor) session.getAttribute("professor");
    Disciplina d = new Disciplina();
    List<Disciplina> lista;
    DisciplinaDAO ddao = new DisciplinaDAO();
    lista = ddao.listarporprof(p);
    if (request.getMethod().equals("POST")) {
        if (request.getParameter("txtTitulo") != null && request.getParameter("txtDisciplina") != null) {
            d = ddao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("txtDisciplina")));
            e.setDcod(d);
            e.setEtitulo(request.getParameter("txtTitulo"));
            e.setPcod(p);
            if (request.getParameter("txtPub") != null) {
                e.setEpublico(true);
            } else if (request.getParameter("txtPub") == null) {
                e.setEpublico(false);
            }

            e.setEtipo(request.getParameter("txtTipo"));
            //e.setEpublico();
            Boolean resultado = edao.incluir(e);
            session.setAttribute("exercicio", e);
            if (resultado) {
                msg = "Registro cadastrado com sucesso";
                classe = "alert-sucess";
                response.sendRedirect("tipoexercicio.jsp");
            } else {
                msg = "Não foi possível realizar seu cadastro";
                classe = "alert-danger";

            }
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
                            <h2>Novo exercício</h2>
                            <p>No próximo passo você poderá começar a elaborar as questões</p>
                        </div>
                        <div class="row">
                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                <div class="bootstrap-select fm-cmp-mg">
                                    <select name="txtTipo" placeholder="Tipo" class="selectpicker">
                                        <option value="exe">Exercício</option>
                                        <option value="pro">Prova</option>                          
                                    </select>
                                </div>
                            </div>
                        </div>
                        <br/>
                        <br/>
                        <br/>
                        <div class="row"> 
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="toggle-select-act fm-cmp-mg">
                                    <div class="nk-toggle-switch">
                                        <label for="ts1" class="ts-label">Público</label>
                                        <input id="ts1" name="txtPub" type="checkbox" hidden="hidden">
                                        <label for="ts1" class="ts-helper"></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <div class="nk-int-st">
                                        <input type="text" name="txtTitulo" class="form-control input-lg" placeholder="Título">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                <div class="bootstrap-select fm-cmp-mg">
                                    <select name="txtDisciplina" placeholder="Disciplina" class="selectpicker">
                                        <%for (Disciplina item : lista) {
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
                                        <button type="submit" class="btn btn-default btn-icon-notika .btn-lg"><i class="notika-icon notika-checked"></i> Próximo</button>
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
