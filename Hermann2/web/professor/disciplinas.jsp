<%@page import="java.util.List"%>
<%@page import="modelo.Disciplina"%>
<%@page import="modelo.Disciplina"%>
<%@page import="DAO.DisciplinaDAO"%>
<%@include file="cabecalhog.jsp"%>
<%
    DisciplinaDAO ddao = new DisciplinaDAO();
    List<Disciplina> disciplinas = ddao.listar();
%>
<div class="data-table-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="data-table-list">
                    <div class="basic-tb-hd">
                        <h2>Disciplinas</h2>                       
                    </div>
                    <div class="table-responsive">
                        <table id="data-table-basic" class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Nome</th>
                                    <th>Período</th>
                                    <th>Professor</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (Disciplina item : disciplinas) {


                                %>
                                <tr>
                                    <td><%=item.getDnome()%></td>
                                    <td><%=item.getDperiodo()%></td>
                                    <td><%=item.getPcod()%></td>
                                    <td><a href="visualizardisciplina.jsp?id=<%=item.getDcod()%>" class="btn btn-default btn-icon-notika .btn-xs">Visualizar</a></td>

                                </tr>
                                <%}%>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>Nome</th>
                                    <th>Período</th>
                                    <th>Professor</th>
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