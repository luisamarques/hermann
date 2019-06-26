<%@page import="java.util.List"%>
<%@page import="modelo.Apresentacao"%>
<%@page import="modelo.Apresentacao"%>
<%@page import="DAO.ApresentacaoDAO"%>
<%@page import="modelo.Professor"%>
<%@include file="cabecalho.jsp" %>
<%    Professor p = new Professor();
    ApresentacaoDAO adao = new ApresentacaoDAO();
    p = (Professor) session.getAttribute("professor");
    List<Apresentacao> lista;
    lista = adao.listarultimas(p);
%>
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
                                    <th>Disciplina</th>
                                    <th></th>
                                    <th></th>                                   
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Apresentacao item : lista) {
                                %>
                                <tr>
                                    <td></td>
                                    <td><%=item.getAtitulo()%></td>
                                    <td><%=item.getDcod().getDnome()%></td>
                                    <td><a href="http://www2.bage.ifsul.edu.br:8181/Pranchas/p1.jsp?id=<%=item.getApcod()%>" class="btn btn-default btn-icon-notika .btn-xs">Visualizar</a></td>
                                    <td><a href="editarprancha.jsp?codigo=<%=item.getApcod()%>" class="btn btn-default btn-icon-notika .btn-sm"><i class="notika-icon notika-menus"></i> Editar</a></td>


                                </tr> 
                                <%}%>
                            </tbody>
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
<%@include file="rodape.jsp" %>