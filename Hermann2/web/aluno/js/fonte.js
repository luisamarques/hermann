var $affectedElements = $(".deck-container");
$affectedElements.each( function(){
  var $this = $(this);

    $this.data("orig-size", $this.css("font-size") );
  
});

$("#btn-mais").click(function(){
    var fonte = $("#fonte").val(); 
    $("#fonte").val(parseInt(fonte)+1);
    changeFontSize(1);
})

$("#btn-menos").click(function(){
  var fonte = $("#fonte").val(); 
  $("#fonte").val(parseInt(fonte)-1);
  changeFontSize(-1);
})

$("#btn-origem").click(function(){
    
    $("#fonte").val(28);
  $affectedElements.each( function(){
        var $this = $(this);
        $this.css( "font-size" , $this.data("orig-size") );
   });
})

function changeFontSize(direction){
    $affectedElements.each( function(){
        var $this = $(this);
        $this.css( "font-size" , parseInt($this.css("font-size"))+direction );
       
    });
     
}
