<%@page import="DAO.SlideDAO"%>
<%@page import="modelo.Slide"%>
<%@page import="modelo.Professor"%>
<%@page import="DAO.DisciplinaDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Disciplina"%>
<%@page import="DAO.ApresentacaoDAO"%>
<%@page import="modelo.Apresentacao"%>
<%@include file="cabecalho.jsp"%>

<%    String msg = "";
    String classe = "";

    Apresentacao a = new Apresentacao();
    ApresentacaoDAO adao = new ApresentacaoDAO();
    DisciplinaDAO ddao = new DisciplinaDAO();
    List<Disciplina> dlista = ddao.listarporprof((Professor) session.getAttribute("professor"));
    a = adao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
    List<Slide> slista;
    SlideDAO sdao = new SlideDAO();

    if (request.getMethod().equals("POST")) {

        //popular com oq ele digitou no form
        Disciplina d = new Disciplina();
        d = ddao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("txtDisciplina")));
        a.setAtitulo(request.getParameter("txtTitulo"));
        a.setDcod(d);

        Boolean resultado = adao.alterar(a);

        if (resultado) {
            msg = "Registro alterado com sucesso";
            classe = "alert-success";
            response.sendRedirect("gerenciarexercicios.jsp");
        } else {
            msg = "Não foi possível alterar";
            classe = "alert-danger";
        }

    } else {
        //e GET
        if (request.getParameter("codigo") == null) {
            response.sendRedirect("gerenciarpranchas.jsp");
            return;
        }

        adao = new ApresentacaoDAO();
        a = adao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));

        if (a == null) {
            response.sendRedirect("gerenciarpranchas.jsp");
            return;
        }
    }
    if (request.getParameter("codigo") != null) {
        Slide s = sdao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
        if (s != null) {
            sdao.excluir(s);
        }
    }
    slista = sdao.listarporap(a);
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
                                    <h2>Editar Apresentação: <%=a.getAtitulo()%></h2>

                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-3">
                            <div class="breadcomb-report">
                                <a href="layoutsprancha.jsp?id=<%=a.getApcod()%>"data-toggle="tooltip" data-placement="left" class="btn btn-default btn-icon-notika"> Adicionar Slide</a>
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
                                    <input type="text" name="txtTitulo" value="<%=a.getAtitulo()%>"class="form-control input-lg" placeholder="Nome">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                            <div class="bootstrap-select fm-cmp-mg">
                                <select name="txtDisciplina" placeholder="Disciplina" class="selectpicker">
                                    <%for (Disciplina item : dlista) {%>
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
<div class="data-table-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="data-table-list">                      
                    <div class="table-responsive">
                        <table id="data-table-basic" class="table table-striped">
                            <thead>
                                <tr>

                                    <th>Título</th>
                                    <th>Tipo</th>
                                    <th></th>
                                    <th></th>

                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    String tipo = "";
                                    String titulo = "";
                                    for (Slide item : slista) {
                                        if (item.getStipo().equals("tso")) {
                                            tipo = "Título";
                                        } else if (item.getStipo().equals("tt")) {
                                            tipo = "Título e texto";
                                        } else if (item.getStipo().equals("tti")) {
                                            tipo = "Título, texto e imagem";
                                        } else if (item.getStipo().equals("ti")) {
                                            tipo = "Título e imagem";
                                        } else if (item.getStipo().equals("i")) {
                                            tipo = "Imagem";
                                        }

                                %>
                                <tr>
                                    <%if (item.getStipo().equals("i")) {%>
                                    <td><%=titulo%></td>
                                    <%} else {%>
                                    <td><%=item.getStitulo()%></td>
                                    <%}%>
                                    <td><%=tipo%></td>
                                    <td><a href="editarslide<%=item.getStipo()%>.jsp?codigo=<%=item.getScod()%>" class="btn btn-default btn-icon-notika .btn-sm"><i class="notika-icon notika-menus"></i> Editar</a></td>
                                    <td><a href="editarprancha.jsp?codigo=<%=item.getScod()%>"class="btn btn-default btn-icon-notika .btn-xs"><i class="notika-icon notika-close"></i> Excluir</a>

                                </tr>
                                <%}%>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>Nome</th>
                                    <th>Disciplina</th>
                                    <th></th>
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