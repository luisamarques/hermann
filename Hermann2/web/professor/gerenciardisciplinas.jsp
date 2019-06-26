<%@page import="java.util.List"%>
<%@page import="modelo.Professor"%>
<%@page import="DAO.DisciplinaDAO"%>
<%@page import="modelo.Disciplina"%>
<%@include file="cabecalho.jsp"%>
<%    Professor p = new Professor();
    DisciplinaDAO ddao = new DisciplinaDAO();
    p = (Professor) session.getAttribute("professor");
    List<Disciplina> lista;

    if (request.getParameter("codigo") != null) {
        Disciplina d = ddao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
        if (d != null) {
            ddao.excluir(d);
        }
    }

    lista = ddao.listarporprof(p);
%>
<div class="container">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="form-element-list">
                <div class="basic-tb-hd">
                    <h2>Gerenciar Disciplinas</h2>
                    <p>Aqui você pode visualizar, editar e excluir suas disciplinas cadastradas.</p>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="normal-table-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="normal-table-list">                   
                    <div class="bsc-tbl">
                        <table class="table table-sc-ex">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>Nome</th>
                                    <th>Período</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Disciplina item : lista) {
                                %>
                                <tr>
                                    <td></td>
                                    <td><%=item.getDnome()%></td>
                                    <td><%=item.getDperiodo()%></td>
                                    <td><a href="editardisciplina.jsp?codigo=<%=item.getDcod()%>" class="btn btn-default btn-icon-notika .btn-sm"><i class="notika-icon notika-menus"></i> Editar</a></td>
                                    <td><a  href="gerenciardisciplinas.jsp?codigo=<%=item.getDcod()%>" class="btn btn-default btn-icon-notika .btn-xs"><i class="notika-icon notika-close"></i> Excluir</a>


                                    </td>
                                </tr> 
                                <%}%>
                            </tbody>
                        </table>
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="rodape.jsp"%>