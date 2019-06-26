<%@page import="modelo.Aluno"%>
<%@page import="DAO.AlunoDAO"%>
<%@page import="java.util.List"%>
<%@include file="cabecalhog.jsp"%>
<%
    AlunoDAO adao = new AlunoDAO();
    List<Aluno> alunos = adao.listar();
%>
<div class="data-table-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="data-table-list">
                    <div class="basic-tb-hd">
                        <h2>Alunos</h2>                       
                    </div>
                    <div class="table-responsive">
                        <table id="data-table-basic" class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Nome</th>
                                    <th>E-mail</th>
                                    <th></th>

                                </tr>
                            </thead>
                            <tbody>
                                <%for (Aluno item : alunos) {


                                %>
                                <tr>
                                    <td><%=item.getAnome()%></td>
                                    <td><%=item.getAemail()%></td>
                                    <td><a href="visualizaraluno.jsp?id=<%=item.getAcod()%>" class="btn btn-default btn-icon-notika .btn-xs">Relacionar</a></td>

                                </tr>
                                <%}%>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>Nome</th>
                                    <th>E-mail</th>
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