<%@page import="java.util.List"%>
<%@page import="DAO.ExercicioDAO"%>
<%@page import="modelo.Exercicio"%>
<%@page import="modelo.Professor"%>
<%@include file="cabecalho.jsp"%>
<%    Professor p = (Professor) session.getAttribute("professor");
    ExercicioDAO edao = new ExercicioDAO();
    p = (Professor) session.getAttribute("professor");
    List<Exercicio> lista;
    if (request.getParameter("codigo") != null) {
        Exercicio e = edao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
        if (e != null) {
            edao.excluir(e);
        }
    }
    lista = edao.listarporprof(p);
%>

<div class="data-table-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="data-table-list">
                    <div class="basic-tb-hd">
                        <h2>Exercícios/Provas</h2>                       
                    </div>
                    <div class="table-responsive">
                        <table id="data-table-basic" class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Nome</th>
                                    <th>Disciplina</th>
                                    <th>Status</th>
                                    <th>Tipo</th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (Exercicio item : lista) {
                                        String status;
                                        String tipo;
                                        tipo="";
                                        status = "";
                                        if (item.getEpublico() == true) {
                                            status = "Público";
                                        } else if (item.getEpublico() == false) {
                                            status = "Privado";
                                        }
                                        if (item.getEtipo().equals("pro")) {
                                            tipo = "Prova";
                                        } else if (item.getEtipo().equals("exe")) {
                                            tipo = "Exercício";
                                        }
                                        

                                %>
                                <tr>
                                    <td><%=item.getEtitulo()%></td>
                                    <td><%=item.getDcod()%></td>
                                    <td><%=status%></td>
                                    <td><%=tipo%></td>
                                    <td><a href="corrigir.jsp?id=<%=item.getEcod()%>" class="btn btn-default btn-icon-notika .btn-xs">Respostas</a></td>
                                    <td><a href="../aluno/exercicios.jsp?id=<%=item.getEcod()%>" class="btn btn-default btn-icon-notika .btn-xs">Visualizar</a></td>
                                    <td><a href="editarexercicio.jsp?id=<%=item.getEcod()%>" class="btn btn-default btn-icon-notika .btn-xs"><i class="notika-icon notika-menus"></i> Editar</a></td>
                                    <td><a href="gerenciarexercicios.jsp?codigo=<%=item.getEcod()%>" class="btn btn-default btn-icon-notika .btn-xs"><i class="notika-icon notika-close"></i> Excluir</a></td>

                                </tr>
                                <%}%>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>Nome</th>
                                    <th>Disciplina</th>
                                    <th>Status</th>
                                    <th>Tipo</th>
                                    <th></th>
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