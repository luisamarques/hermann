<%@page import="DAO.RespexercDAO"%>
<%@page import="modelo.Respexerc"%>
<%@page import="modelo.Exercicio"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Professor"%>
<%@page import="DAO.ExercicioDAO"%>
<%@include file="cabecalho.jsp"%>
<%    ExercicioDAO edao = new ExercicioDAO();
    Professor p = (Professor) session.getAttribute("professor");
    Exercicio e = edao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("id")));
    RespexercDAO redao = new RespexercDAO();
    List<Respexerc> respostasexercicios = redao.listarporexercicio(e);

%>
<div class="data-table-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="data-table-list">
                    <div class="basic-tb-hd">
                        <%                            String tipo = "";
                            if (e.getEtipo().equals("exe")) {
                                tipo = "Exercício";
                            }else if(e.getEtipo().equals("pro")){
                                tipo = "Prova";
                            }
                        %>
                        <h2><%=tipo%> <%=e.getEtitulo()%></h2>                       
                    </div>
                    <div class="table-responsive">
                        <table id="data-table-basic" class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Aluno</th>                                 
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (Respexerc item : respostasexercicios) {
                                        
                                %>
                                <tr>
                                    <td><%=item.getAcod().getAnome()%></td>                                   
                                    <td><a href="gabarito.jsp?id=<%=item.getRecod()%>" class="btn btn-default btn-icon-notika .btn-xs">Gabarito</a></td>                              
                                </tr>
                                <%}%>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>Nome</th>  
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