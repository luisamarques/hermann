<%@page import="DAO.SlideDAO"%>
<%@page import="modelo.Slide"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Apresentacao"%>
<%@page import="DAO.ApresentacaoDAO"%>
<!DOCTYPE html>
<html>
    <% 
        ApresentacaoDAO dao = new ApresentacaoDAO();
            Apresentacao obj = dao.buscarPorChavePrimaria(1);
    SlideDAO sdao = new SlideDAO();
    String a;
    String titulo;
    

%>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=1024, user-scalable=no">

  <title>Prancha</title>

  <!-- Required stylesheet -->
  <link rel="stylesheet" media="screen" href="core/deck.core.css">

  <!-- Extension CSS files go here. Remove or add as needed. -->
  <link rel="stylesheet" media="screen" href="extensions/goto/deck.goto.css">
  <link rel="stylesheet" media="screen" href="extensions/menu/deck.menu.css">
  <link rel="stylesheet" media="screen" href="extensions/navigation/deck.navigation.css">
  <link rel="stylesheet" media="screen" href="extensions/status/deck.status.css">
  <link rel="stylesheet" media="screen" href="extensions/scale/deck.scale.css">

  <!-- Style theme. More available in /themes/style/ or create your own. -->
  <link rel="stylesheet" media="screen" href="themes/style/swiss.css">

  <!-- Transition theme. More available in /themes/transition/ or create your own. -->
  <link rel="stylesheet" media="screen" href="themes/transition/horizontal-slide.css">

  <!-- Basic black and white print styles -->
  <link rel="stylesheet" media="print" href="core/print.css">

  <link rel="stylesheet"  href="css/radiostyle.css">

  <!-- Required Modernizr file -->
  <script src="modernizr.custom.js"></script>
</head>
<body>


  <div class="deck-container">

    <!-- Begin slides. Just make elements with a class of slide. -->

    <section class="slide">
        <div style="text-align: right">
        <button class="naofala"></button>
        </div>
    
      <h1>Português</h1>
    </section>
  
  
    <%for (Slide s: obj.getSlideList())
    {
        a = s.getStipo();
        titulo = s.getStitulo();
        //switch(s.getStipo()){
    %>
  <section class="slide">
     <div style="text-align: right">
        <button class="naofala"></button>
     </div>
      <%   
          
          switch(a){
         
          case "tso":
              out.print("<h2>"+s.getStitulo()+"</h2>");
              break;
          case "tt":
              out.print("<h2>"+s.getStitulo()+"</h2>");
              out.print("<p>"+s.getStexto()+"</p>");
              break;
          case "ti":
              out.print("<h2>"+s.getStitulo()+"</h2>");
              out.print("<img src='"+s.getSimg1()+"'>");
              break;
         case "tti":
              out.print("<h2>"+s.getStitulo()+"</h2>");
              out.print("<p>"+s.getStexto()+"</p>");
              out.print("<img src='"+s.getSimg1()+"'>");
              break;
         case "tv":
              out.print("<h2>"+s.getStitulo()+"</h2>");
              //out.print();
         case "ttv": 
              out.print("<h2>"+s.getStitulo()+"</h2>");
              out.print("<p>"+s.getStexto()+"</p>");
              //out.print();
          
      }
      %>
    

  </section>
    <%  
        }
    %>
    
    

    <!-- End slides. -->

    <!-- Begin extension snippets. Add or remove as needed. -->

    <!-- deck.navigation snippet -->
    <div aria-role="navigation">
      <a href="#" class="deck-prev-link" title="Previous">&#8592;</a>
      <a href="#" class="deck-next-link" title="Next">&#8594;</a>
    </div>

    <!-- deck.status snippet -->
    <p class="deck-status" aria-role="status">
      <span class="deck-status-current"></span>
      /
      <span class="deck-status-total"></span>
    </p>

    <!-- deck.goto snippet -->
    <form action="." method="get" class="goto-form">
      <label for="goto-slide">Go to slide:</label>
      <input type="text" name="slidenum" id="goto-slide" list="goto-datalist">
      <datalist id="goto-datalist"></datalist>
      <input type="submit" value="Go">
    </form>

    <!-- End extension snippets. -->
  </div>

<!-- Required JS files. -->
<script src="jquery.min.js"></script>
<script src="core/deck.core.js"></script>

<!-- Extension JS files. Add or remove as needed. -->
<script src="extensions/menu/deck.menu.js"></script>
<script src="extensions/goto/deck.goto.js"></script>
<script src="extensions/status/deck.status.js"></script>
<script src="extensions/navigation/deck.navigation.js"></script>
<script src="extensions/scale/deck.scale.js"></script>
<script src="js/materialize.min.js"></script>
<script src="js/falar.js"></script>
<script src="js/fonte.js"></script>
<!-- Initialize the deck. You can put this in an external file if desired. -->
<script>
  $(function() {
    $.deck('.slide');
  });
</script>
</body>
</html>
