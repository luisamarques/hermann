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
                            <h2>Questão tipo Certo/Errado</h2>

                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">

                                    <div class="nk-int-st">
                                        <input type="text" name="txtPergunta" value="<%=q.getEpergunta()%>" class="form-control input-lg" placeholder="Digite aqui o título do slide">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br/>  
                        <div class="row">
                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                <div class="bootstrap-select fm-cmp-mg">
                                    <%
                                        String selcerto="";
                                        String selerrado="";
                                        if(q.getEresposta().equals("V")){
                                            selcerto="selected";
                                        }
                                        else if(q.getEresposta().equals("F")){
                                            selerrado="selected";
                                        }
                                    %>
                                    <select name="txtResposta" placeholder="Resposta" class="selectpicker">                                           
                                        <option value="V"<%=selcerto%>>Certo</option>
                                        <option value="F"<%=selerrado%>>Errado</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-element-list mg-t-30">
                                    <div class="button-icon-btn">
                                        <button type="submit" class="btn btn-default btn-icon-notika .btn-lg"><i class="notika-icon notika-checked"></i>Salvar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br/>
                        <br/>
                    </form>
                </div>
            </div>
        </div>       
    </div> 
</div>
<%@include file="rodape.jsp"%>