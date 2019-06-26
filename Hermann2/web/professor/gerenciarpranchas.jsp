<%@page import="modelo.Apresentacao"%>
<%@page import="DAO.ApresentacaoDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Disciplina"%>
<%@page import="DAO.DisciplinaDAO"%>
<%@page import="modelo.Professor"%>
<%@include file="cabecalho.jsp"%>
<%    Professor p = new Professor();
    ApresentacaoDAO adao = new ApresentacaoDAO();
    p = (Professor) session.getAttribute("professor");
    List<Apresentacao> lista;

    if (request.getParameter("codigo") != null) {
        Apresentacao a = adao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
        if (a != null) {
            adao.excluir(a);
        }
    }
    lista = adao.listarporprof(p);

%>
<div class="container">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="form-element-list">
                <div class="basic-tb-hd">
                    <h2>Gerenciar Apresentações</h2>

                </div>
            </div>
        </div>
    </div>
</div>
<div class="data-table-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="data-table-list">
                    <div class="basic-tb-hd">
                        <h2>Apresentações</h2>                       
                    </div>
                    <div class="table-responsive">
                        <table id="data-table-basic" class="table table-striped">
                            <thead>
                                <tr>

                                    <th>Nome</th>
                                    <th>Disciplina</th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (Apresentacao item : lista) {
                                %>
                                <tr>
                                    <td><%=item.getAtitulo()%></td>
                                    <td><%=item.getDcod()%></td>
                                    <td><a href="../aluno/p1.jsp?id=<%=item.getApcod()%>" class="btn btn-default btn-icon-notika .btn-xs">Visualizar</a></td>
                                    <td><a href="editarprancha.jsp?codigo=<%=item.getApcod()%>" class="btn btn-default btn-icon-notika .btn-sm"><i class="notika-icon notika-menus"></i> Editar</a></td>
                                    <td><a href="gerenciarpranchas.jsp?codigo=<%=item.getApcod()%>" class="btn btn-default btn-icon-notika .btn-xs"><i class="notika-icon notika-close"></i> Excluir</a></td>

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
<br/>
<br/>
<br/>
<br/>
<br/>
<%@include file="rodape.jsp"%>