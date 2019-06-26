<%@page import="modelo.Questao"%>
<%@page import="DAO.QuestaoDAO"%>
<%@page import="modelo.Exercicio"%>
<%@page import="DAO.ExercicioDAO"%>
<%@page import="modelo.Respquest"%>
<%@page import="java.util.List"%>
<%@page import="DAO.RespquestDAO"%>
<%@page import="modelo.Respexerc"%>
<%@page import="DAO.RespexercDAO"%>
<%@include file="cabecalho.jsp"%>
<%    RespexercDAO redao = new RespexercDAO();
    Respexerc re = redao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("id")));
    RespquestDAO rqdao = new RespquestDAO();
    List<Respquest> rqs = rqdao.listarporrespexerc(re);
    ExercicioDAO edao = new ExercicioDAO();
    Integer exerc = re.getEcod().getEcod();
    Exercicio e = edao.buscarPorChavePrimaria(exerc);


%>
<div class="normal-table-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="normal-table-list mg-t-30">
                    <div class="basic-tb-hd">
                        <h2>Gabarito aluno: <%=re.getAcod().getAnome()%>, exercício <%=re.getEcod().getEtitulo()%></h2>
                    </div>
                    <div class="bsc-tbl-cls">
                        <table class="table table-cl">
                            <thead>
                                <tr>
                                    <th>Pergunta</th>
                                    <th>Resposta correta</th>
                                    <th>Resposta do aluno</th>                                 
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    String classe = "";
                                    for (Respquest item : rqs) {
                                        Integer idq = item.getQcod().getQcod();
                                        QuestaoDAO qdao = new QuestaoDAO();
                                        Questao q = qdao.buscarPorChavePrimaria(idq);
                                        String resposta = q.getEresposta();
                                        if (item.getResposta().equals(resposta)) {
                                            classe = "active";
                                        } else {
                                            classe = "info";
                                        }
                                %>
                                <tr class="<%=classe%>">
                                    <td><%=q.getEpergunta()%></td>
                                    <td><%=q.getEresposta()%></td>
                                    <td><%=item.getResposta()%></td>                   
                                </tr><%}%>                               
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
<br/>    
<%@include file="rodape.jsp"%>