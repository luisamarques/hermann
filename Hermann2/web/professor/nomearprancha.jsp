<%@page import="DAO.DisciplinaDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Disciplina"%>
<%@page import="modelo.Disciplina"%>
<%@page import="modelo.Professor"%>
<%@page import="DAO.ApresentacaoDAO"%>
<%@page import="modelo.Apresentacao"%>
<%@include file="cabecalho.jsp"%>
<%    String classe = "";
    String msg = "";
    Apresentacao a = new Apresentacao();
    ApresentacaoDAO adao = new ApresentacaoDAO();
    Professor p = (Professor) session.getAttribute("professor");
    Disciplina d = new Disciplina();
    List<Disciplina> lista;
    DisciplinaDAO ddao = new DisciplinaDAO();
    lista = ddao.listarporprof(p);
    if (request.getMethod().equals("POST")) {
        if (request.getParameter("txtTitulo") != null && request.getParameter("txtDisciplina") != null) {
            d = ddao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("txtDisciplina")));
            a.setDcod(d);
            a.setAtitulo(request.getParameter("txtTitulo"));
            a.setPcod(p);
            Boolean resultado = adao.incluir(a);
            session.setAttribute("apresentacao", a);
            if (resultado) {
                msg = "Registro cadastrado com sucesso";
                classe = "alert-sucess";
                response.sendRedirect("layoutsprancha.jsp");
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
                            <h2>Nova apresentação</h2>
                            <p>No próximo passo você poderá começar a montar os slides</p>
                        </div>
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