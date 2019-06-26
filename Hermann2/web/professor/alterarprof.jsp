<%@page import="DAO.ProfessorDAO"%>
<%@page import="modelo.Professor"%>
<%
    Professor p = (Professor) session.getAttribute("professor");
    ProfessorDAO pdao = new ProfessorDAO();
    if (request.getMethod().equals("POST")) {
        if (request.getParameter("txtEmail") != null && request.getParameter("txtNome") != null) {
            p.setPemail(request.getParameter("txtEmail"));
            p.setPnome(request.getParameter("txtNome"));
            Boolean resultado = pdao.alterar(p);
            if (resultado) {
                response.sendRedirect("alterarprof.jsp");
            }

        }
    }

%>
<!doctype html>
<%@include file="cabecalho.jsp"%>
<html class="no-js" lang="">



    <body>

        <div class="form-example-area">
            <div class="container">

                <form method="POST">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="form-example-wrap mg-t-30">
                                <div class="cmp-tb-hd cmp-int-hd">
                                    <h2>Alterar perfil</h2>
                                </div>
                                <div class="form-example-int form-horizental">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-lg-2 col-md-3 col-sm-3 col-xs-12">
                                                <label class="hrzn-fm">Endereço de e-mail</label>
                                            </div>
                                            <div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
                                                <div class="nk-int-st">
                                                    <input type="text" name="txtEmail" value="<%=p.getPemail()%>" class="form-control input-sm" placeholder="E-mail">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-example-int form-horizental mg-t-15">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-lg-2 col-md-3 col-sm-3 col-xs-12">
                                                <label class="hrzn-fm">Nome</label>
                                            </div>
                                            <div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
                                                <div class="nk-int-st">
                                                    <input type="text" value="<%=p.getPnome()%>" name="txtNome" class="form-control input-sm" placeholder="Nome">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-example-int mg-t-15">
                                    <div class="row">
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-12">
                                        </div>
                                        <div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
                                            <button type="submit" class="btn btn-success notika-btn-success">Salvar</button>
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
                </form>
            </div>
        </div>
        <%@include file="rodape.jsp"%>
        <!-- jquery
                    ============================================ -->
        <script src="js/vendor/jquery-1.12.4.min.js"></script>
        <!-- bootstrap JS
                    ============================================ -->
        <script src="js/bootstrap.min.js"></script>
        <!-- wow JS
                    ============================================ -->
        <script src="js/wow.min.js"></script>
        <!-- price-slider JS
                    ============================================ -->
        <script src="js/jquery-price-slider.js"></script>
        <!-- owl.carousel JS
                    ============================================ -->
        <script src="js/owl.carousel.min.js"></script>
        <!-- scrollUp JS
                    ============================================ -->
        <script src="js/jquery.scrollUp.min.js"></script>
        <!-- meanmenu JS
                    ============================================ -->
        <script src="js/meanmenu/jquery.meanmenu.js"></script>
        <!-- counterup JS
                    ============================================ -->
        <script src="js/counterup/jquery.counterup.min.js"></script>
        <script src="js/counterup/waypoints.min.js"></script>
        <script src="js/counterup/counterup-active.js"></script>
        <!-- mCustomScrollbar JS
                    ============================================ -->
        <script src="js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
        <!-- sparkline JS
                    ============================================ -->
        <script src="js/sparkline/jquery.sparkline.min.js"></script>
        <script src="js/sparkline/sparkline-active.js"></script>
        <!-- flot JS
                    ============================================ -->
        <script src="js/flot/jquery.flot.js"></script>
        <script src="js/flot/jquery.flot.resize.js"></script>
        <script src="js/flot/flot-active.js"></script>
        <!-- knob JS
                    ============================================ -->
        <script src="js/knob/jquery.knob.js"></script>
        <script src="js/knob/jquery.appear.js"></script>
        <script src="js/knob/knob-active.js"></script>
        <!-- icheck JS
                    ============================================ -->
        <script src="js/icheck/icheck.min.js"></script>
        <script src="js/icheck/icheck-active.js"></script>
        <!--  wave JS
                    ============================================ -->
        <script src="js/wave/waves.min.js"></script>
        <script src="js/wave/wave-active.js"></script>
        <!--  Chat JS
                    ============================================ -->
        <script src="js/chat/jquery.chat.js"></script>
        <!--  todo JS
                    ============================================ -->
        <script src="js/todo/jquery.todo.js"></script>
        <!-- plugins JS
                    ============================================ -->
        <script src="js/plugins.js"></script>
        <!-- main JS
                    ============================================ -->
        <script src="js/main.js"></script>
        <!-- tawk chat JS
                ============================================ -->
        <script src="js/tawk-chat.js"></script>
    </body>

</html>