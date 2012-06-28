function UpdateBingResult() {
    jQuery.post("handles/datafactory.ashx", { func: 'bing.search', query: $('#GeneralSearchBox').val() }, BingResultCallBack, "text/plain");
}

function BingResultCallBack(result) {
    if (null == result) return;
    //append to right result panel
    $(result).appendTo($('#RightPanel'));

}

function RenderGuanxiResult(q) {
    if (q == "firstLoad") {
        $('#names').text($('div.title:first').text() + "+" + $('#GeneralSearchBox').val());
        queryStr = $('div.title:first').text() + "+" + $('#GeneralSearchBox').val();
    }
    else queryStr = q;
    jQuery.post("handles/datafactory.ashx", { func: 'guanxiblock.search', query: queryStr , count: '10' }, GuanxiResultCallBack, "text/plain");
}

function GuanxiResultCallBack(result)
{
    if (null == result) return;
    $('#new_panel').empty();
    $(result).appendTo($('#new_panel'));
}

function findmoreguanxipage(query) {
    $('#names').text(query);
    RenderGuanxiResult(query);
}

function OnGuxiItemMoreClick(text) {
    var w = 500, h = 100, xh = 300;
    var x = $(window).width() / 2 - w / 2;
    var y = $(window).height() / 2 - xh / 2;
    //show dialog
    dialog(w + 'px', h + 'px', xh + 'px', x + 'px', y + 'px');
    //set title
    $(gDialogTitleSelector).html(text);
    $(gDialogContentSelector).html("<img src='/App_Themes/cn/images/progress.gif' alt='loading...' />正在加载数据...");
    //call block search
    jQuery.post("handles/datafactory.ashx", { func: 'guanxiblock.search', count: '3', query: text }, function (result) {
        if (null == result) return;
        //set data
        $(gDialogContentSelector).html(result);
    }, "text/plain");
}


