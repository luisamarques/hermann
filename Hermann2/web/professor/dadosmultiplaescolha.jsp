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
        if (request.getParameter("txtPergunta") != null && request.getParameter("Alternativa1") != null && request.getParameter("Alternativa2") != null && request.getParameter("Alternativa3") != null && request.getParameter("Alternativa4") != null && request.getParameter("Alternativa5") != null && request.getParameter("txtResposta") != null) {
            q.setEtipo(tipo);
            q.setEpergunta(request.getParameter("txtPergunta"));
            q.setEalt1(request.getParameter("Alternativa1"));
            q.setEalt2(request.getParameter("Alternativa2"));
            q.setEalt3(request.getParameter("Alternativa3"));
            q.setEalt4(request.getParameter("Alternativa4"));
            q.setEalt5(request.getParameter("Alternativa5"));
            q.setEresposta(request.getParameter("txtResposta"));
            q.setEcod(e);            
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
                    <form method="POST">
                        <div class="basic-tb-hd">
                            <h2>Questão tipo Múltipla Escolha</h2>

                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">

                                    <div class="nk-int-st">
                                        <input type="text" name="txtPergunta" maxlength="250" class="form-control input-lg" placeholder="Digite aqui a questão">
                                    </div>
                                </div>
                            </div>
                            <div class="nk-int-st">
                                <input type="text" name="Alternativa1" class="form-control" maxlength="70" placeholder="Alternativa 1">
                            </div>
                            <div class="nk-int-st">
                                <input type="text" name="Alternativa2" class="form-control" maxlength="70" placeholder="Alternativa 2">
                            </div>
                            <div class="nk-int-st">
                                <input type="text" name="Alternativa3" class="form-control" maxlength="70" placeholder="Alternativa 3">
                            </div>
                            <div class="nk-int-st">
                                <input type="text" name="Alternativa4" class="form-control" maxlength="70" placeholder="Alternativa 4">
                            </div>
                            <div class="nk-int-st">
                                <input type="text" name="Alternativa5" class="form-control" maxlength="70" placeholder="Alternativa 5">
                            </div>
                            
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                    <div class="bootstrap-select fm-cmp-mg">
                                        <select name="txtResposta" placeholder="Resposta" class="selectpicker">                                        
                                            <option value="A">A</option>
                                            <option value="B">B</option>
                                            <option value="C">C</option>
                                            <option value="D">D</option>
                                            <option value="E">E</option>                                       
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