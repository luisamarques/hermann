<%@page import="modelo.Exercicio"%>
<%@page import="DAO.QuestaoDAO"%>
<%@page import="modelo.Questao"%>
<%@page import="DAO.ExercicioDAO"%>
<%@include file="cabecalho.jsp"%>
<%    
    String tipo = request.getParameter("tipo");
    ExercicioDAO edao = new ExercicioDAO();
    Exercicio e = (Exercicio) session.getAttribute("exercicio");
    e = edao.buscarPorChavePrimaria(e.getEcod());
    Questao q = new Questao();
    QuestaoDAO qdao = new QuestaoDAO();
    if (request.getMethod().equals("POST")) {
        if (request.getParameter("txtPergunta") != null && request.getParameter("txtResposta") != null) {
            q.setEtipo(tipo);
            q.setEpergunta(request.getParameter("txtPergunta"));
            q.setEresposta(request.getParameter("txtResposta"));
            q.setEcod(e);
            q.setEalt1("Certo");
            q.setEalt2("Errado");
            Boolean resultado = qdao.incluir(q);
            if (resultado) {
                response.sendRedirect("tipoexercicio.jsp");
            }

        }

    }
%>
<div class="form-element-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="form-element-list">
                    <form method="POST" >
                        <div class="basic-tb-hd">
                            <h2>Questão tipo V ou F</h2>

                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">

                                    <div class="nk-int-st">
                                        <input type="text" name="txtPergunta" maxlength="250" class="form-control input-lg" placeholder="Digite aqui a questão">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                    <div class="bootstrap-select fm-cmp-mg">

                                        <select name="txtResposta" placeholder="Resposta" class="selectpicker">                                           
                                            <option value="V">Certo</option>
                                            <option value="F">Errado</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br/>                      
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-element-list mg-t-30">
                                    <div class="button-icon-btn">
                                        <button type="submit" class="btn btn-default btn-icon-notika .btn-lg"><i class="notika-icon notika-checked"></i>Salvar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>       
    </div> 
</div>
<%@include file="rodape.jsp"%>