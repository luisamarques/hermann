<%@page import="DAO.AlunoDAO"%>
<%@page import="modelo.Aluno"%>
<%@page import="java.util.List"%>
<%@page import="DAO.DisciplinaDAO"%>
<%@page import="modelo.Disciplina"%>
<%@include file="cabecalhog.jsp"%>
<%
    DisciplinaDAO ddao = new DisciplinaDAO();
    Disciplina d = ddao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("id")));
    AlunoDAO adao = new AlunoDAO();
    if (request.getParameter("codigo") != null) {
        Aluno a = adao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
        //if (a != null) {
         //   adao.excluir(d);
        //}
    }
    List<Aluno> alunos = d.getAlunoList();
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
                                    <h2>Disciplina: <%=d.getDnome()%></h2>

                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-3">
                            <div class="breadcomb-report">

                                <!--   <a href="gerenciador.jsp" data-toggle="tooltip" data-placement="left" class="btn btn-default btn-icon-notika">Vincular Disciplina</a>
                                -->
                            </div>
                        </div>
                    </div>
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
                        <h2></h2>                       
                    </div>
                    <div class="table-responsive">
                        <table id="data-table-basic" class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Aluno</th>
                                    <th>E-mail</th>
                                    

                                </tr>
                            </thead>
                            <tbody>
                                <%for (Aluno item : alunos) {


                                %>
                                <tr>
                                    <td><%=item.getAnome()%></td>
                                    <td><%=item.getAemail()%></td>
                                    
                                </tr>
                                <%}%>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>Nome</th>
                                    <th>E-mail</th>
                                    

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