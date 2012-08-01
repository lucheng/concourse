var highlightindex = -1;
//var timeoutid;
$(document).ready(function() {
    var wordInput = $("#word");
    var wordInputOffset = wordInput.offset();
    $("#auto").hide().css("border", "1px black solid").css("background-color","white").css("position","absolute").css("top", 209 + "px").width(wordInput.width() + 4);

    wordInput.keyup(function(event) {
        var myEvent = event || window.event;
        var keyCode = myEvent.keyCode;
        if (keyCode >= 65 && keyCode <= 90 || keyCode == 8 || keyCode == 46 || keyCode == 32 || keyCode >= 48 && keyCode <= 57 || keyCode >= 97 && keyCode <= 105) {
            var wordText = encodeURI($("#word").val());           
            var autoNode = $("#auto");
            if (wordText != "") {
            	//clearTimeout(timeoutid);
                //timeoutid = setTimeout(function(){
                	$.post("AutoComplete",{word:wordText},function(data){
                        var jqueryObj = $(data);
                        var keyNodes = jqueryObj.find("key");
                       // if( keyNodes == null ) return ;
                        autoNode.html("");
                        keyNodes.each(function(i) {
                            var wordNode = $(this);
                            var newDivNode = $("<div>").attr("id",i);
                            newDivNode.html(wordNode.text()).appendTo(autoNode);
                            newDivNode.mouseover(function(){
                            	if(highlightindex != -1){
                            		$("#auto").children("div").eq(highlightindex).css("background-color","white");
                            	}
                            	highlightindex = $(this).attr("id");
                            	$(this).css("background-color", "#C4C4C4");
                            });
                            newDivNode.mouseout(function(){
                            	$(this).css("background-color", "white");
                            });

                            newDivNode.click(function(){
                                var comText = $(this).text();
                                $("#auto").hide();
                                highlightindex = -1;
                                $("#word").val(comText);
                            });
                        });
                        
                        if (keyNodes.length > 0) {//////////////
                            autoNode.show();
                        } else {
                            autoNode.hide();
                            highlightindex = -1;
                        }
                    },"xml");
                //},500);
            } else {
                autoNode.hide();
                highlightindex = -1;
            }
        } else if (keyCode == 38 || keyCode == 40) {
            if (keyCode == 38) {
                var autoNodes = $("#auto").children("div")
                if (highlightindex != -1) {
                    autoNodes.eq(highlightindex).css("background-color","white");
                    highlightindex--;
                } else {
                    highlightindex = autoNodes.length - 1;    
                }
                if (highlightindex == -1) {
                    highlightindex = autoNodes.length - 1;
                }
                autoNodes.eq(highlightindex).css("background-color","#C4C4C4");
            }
            if (keyCode == 40) {
                var autoNodes = $("#auto").children("div")
                if (highlightindex != -1) {
                    autoNodes.eq(highlightindex).css("background-color","white");
                }
                highlightindex++;
                if (highlightindex == autoNodes.length) {
                    highlightindex = 0;
                }
                autoNodes.eq(highlightindex).css("background-color","#C4C4C4");
            }
        } else if (keyCode == 13) {
            if (highlightindex != -1) {
                var comText = $("#auto").hide().children("div").eq(highlightindex).text();
                highlightindex = -1;
                $("#word").val(comText);
            } else {
            	EnterPress();
                $("#auto").hide();
                $("#word").get(0).blur();
            }
        }
    });
    $("input[type='button']").click(EnterPress);
})

function EnterPress(){
	var wordText = encodeURI($("#word").val());
	var resultNode = $("#result");
	$.post("Search",{word:wordText},function(data){	
		var jqueryObj = $(data);
		var wordNodes = jqueryObj.find("word");
		resultNode.html("");
		var newNode = "";
		wordNodes.each(function(){
			newNode += $(this).text() + "&#13;<br />";
		});
		resultNode.html(newNode);
		if(resultNode.val() == "")resultNode.html("没有找到相关条目");
	},"xml");
} 