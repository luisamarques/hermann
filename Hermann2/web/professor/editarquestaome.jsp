<%@page import="modelo.Questao"%>
<%@page import="DAO.QuestaoDAO"%>
<%@page import="modelo.Exercicio"%>
<%@include file="cabecalho.jsp"%>
<%    Exercicio e = (Exercicio) session.getAttribute("exercicio");
    QuestaoDAO qdao = new QuestaoDAO();
    Questao q = new Questao();
    q = qdao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
    if (request.getMethod().equals("POST")) {
        q = qdao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
        q.setEpergunta(request.getParameter("txtPergunta"));
        q.setEalt1(request.getParameter("Alternativa1"));
        q.setEalt2(request.getParameter("Alternativa2"));
        q.setEalt3(request.getParameter("Alternativa3"));
        q.setEalt4(request.getParameter("Alternativa4"));
        q.setEalt5(request.getParameter("Alternativa5"));
        q.setEresposta(request.getParameter("txtResposta"));
        Boolean resultado = qdao.alterar(q);
        if (resultado) {
            response.sendRedirect("gerenciarexercicios.jsp");
            return;
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
                            <h2> Editar questão tipo Múltipla Escolha</h2>

                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <div class="nk-int-st">
                                        <input type="text" value="<%=q.getEpergunta()%>" name="txtPergunta" maxlength="250" class="form-control input-lg" placeholder="Digite aqui a questão">
                                    </div>
                                    <br/>
                                    <br/>
                                    <br/>
                                    <div class="nk-int-st">
                                        <input type="text" value="<%=q.getEalt1()%>"name="Alternativa1" class="form-control input-lg" maxlength="70" placeholder="Alternativa 1">
                                    </div> 
                                    <div class="nk-int-st">
                                        <input type="text" value="<%=q.getEalt2()%>" name="Alternativa2" class="form-control input-lg" maxlength="70" placeholder="Alternativa 2">
                                    </div>
                                    <div class="nk-int-st">
                                        <input type="text" value="<%=q.getEalt3()%>" name="Alternativa3" class="form-control input-lg" maxlength="70" placeholder="Alternativa 3">
                                    </div>
                                    <div class="nk-int-st">
                                        <input type="text" value="<%=q.getEalt4()%>" name="Alternativa4" class="form-control input-lg" maxlength="70" placeholder="Alternativa 4">
                                    </div>
                                    <div class="nk-int-st">
                                        <input type="text" value="<%=q.getEalt5()%>" name="Alternativa5" class="form-control input-lg" maxlength="70" placeholder="Alternativa 5">
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <br/> 

                            <br/>
                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                <div class="bootstrap-select fm-cmp-mg">
                                    <select name="txtResposta" placeholder="Resposta" class="selectpicker"> 
                                        <%
                                            String selecionadoa = "";
                                            String selecionadob = "";
                                            String selecionadoc = "";
                                            String selecionadod = "";
                                            String selecionadoe = "";
                                            if (q.getEresposta().equals("A")) {
                                                selecionadoa = "selected";
                                            } else if (q.getEresposta().equals("B")) {
                                                selecionadob = "selected";
                                            }else if (q.getEresposta().equals("C")) {
                                                selecionadoc = "selected";
                                            }else if (q.getEresposta().equals("D")) {
                                                selecionadod = "selected";
                                            }if (q.getEresposta().equals("E")) {
                                                selecionadoe = "selected";
                                            }
                                        %>
                                        <option value="A"<%=selecionadoa%>>A</option>
                                        <option value="B"<%=selecionadob%>>B</option>
                                        <option value="C"<%=selecionadoc%>>C</option>
                                        <option value="D"<%=selecionadod%>>D</option>
                                        <option value="E"<%=selecionadoe%>>E</option>                                       
                                    </select>
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
