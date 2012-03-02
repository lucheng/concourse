var old=null;
var old2=null;
$(document).ready(function() { 
    $("*").hover(
        function (e) {
            if (old!=null) {
                old.removeClass("tempselected");
            }
            old=$(this);
            $(this).addClass("tempselected");
            e.stopPropagation();
        },
        function (e) {
            $(this).removeClass("myselected");          
        }
    );
    $("*").toggle(
        function (e) {
            if (old!=null) {
                old.removeClass("tempselected");
            }
            old=$(this);
            $(this).addClass("tempselected");
            e.stopPropagation();
        },
        function (e) {
            $(this).removeClass("myselected");          
        }
    );
    $("*").dblclick(            
        function (e) {          
            if ($(this).hasClass("finalselected")) {
                $(this).removeClass("finalselected");       
                e.stopPropagation(); 
            }else {             
                if (old2!=null) {
                    old2.removeClass("finalselected");
                }
                old2=$(this);
                $(this).addClass("finalselected");
                e.stopPropagation();
                window.status=$(this).attr("my_count_id");
            }
                
        }
    );
});

function showSelected(countId) {
            if (old2!=null) {
                old2.removeClass("finalselected");
            }
            old2=$("*[my_count_id='"+countId+"']");
            old2.addClass("finalselected");     
            old2.focus();
}