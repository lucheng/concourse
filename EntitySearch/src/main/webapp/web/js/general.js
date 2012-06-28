var gDialogTitleSelector = '#generalDialogBoxTitleContent';
var gDialogTitleTipSelector = '#generalDialogBoxTipContent';
var gDialogContentSelector = '#generalDialogBoxBody';

var gGraphDialogTitleSelector = '#generalGraphDialogBoxTitleContent';
var gGraphDialogTitleTipSelector = '#generalGraphDialogBoxTipContent';
var gGraphDialogContentSelector = '#generalGraphDialogBoxBody';

function dialog(w, h, xh, l, t) {
    //check dialog exist?
    if ($('#generalDialogOverlay').length) {
        return false;
    }

    var dialogHtml = [
    '<div id="generalDialogOverlay">',
    '</div>',
    '<div id="generalDialogBox">',
    '<div id="generalDialogBoxTitle">',
    '<div id="generalDialogBoxTitleClose">',
    '<a id="generalDialogBoxTitleCloseAnchor" href=\'javascript:\'>',
    '<img src=\'App_Themes/cn/images/close.png\' alt=\'关闭\' />',
    '</a>',
    '</div>',
    '<div id="generalDialogBoxTitleContent">',
    '</div>',
    '<div id="generalDialogBoxTipContent">',
    '</div>',
    '<div id="generalDialogBoxSpliter">&nbsp;',
    '</div>',
    '</div>',
    '<div id="generalDialogBoxBody">',
    '</div>',
    '</div>'
    ].join('');

    //appear
    $(dialogHtml).hide().appendTo('body').fadeIn('fast', function () { $('#generalDialogOverlay').attr('style', 'display:block;'); });
    //set style
    $('#generalDialogBox').css({'width': w, 'min-height': h, 'max-height': xh, 'left': l, 'top': t});
    //debug
    $(gDialogTitleSelector).html('Put dialog title here');
    $(gDialogContentSelector).html('Put dialog content here');
    //close
    $('#generalDialogBoxTitleCloseAnchor').click(function () {
        $('#generalDialogBox').fadeOut(function () {
            $(this).remove();
            $('#generalDialogOverlay').fadeOut(function () {
                $(this).remove();
            });
        });
    });

    return true;
}

function graphDialog(w, h, xh, l, t) {
    //check dialog exist?
    if ($('#generalGraphDialogOverlay').length) {
        return false;
    }

    var dialogHtml = [
    '<div id="generalGraphDialogOverlay">',
    '</div>',
    '<div id="generalGraphDialogBox">',
    '<div id="generalGraphDialogBoxTitle">',
    '<div id="generalGraphDialogBoxTitleClose">',
    '<a id="generalGraphDialogBoxTitleCloseAnchor" href=\'javascript:\'>',
    '<img src=\'App_Themes/cn/images/close.png\' alt=\'关闭\' />',
    '</a>',
    '</div>',
    '<div id="generalGraphDialogBoxTitleContent">',
    '</div>',
    '</div>',
    '<div id="generalGraphDialogBoxBody">',
    '</div>',
    '</div>'
    ].join('');

    //appear
    $(dialogHtml).hide().appendTo('body').fadeIn('fast', function () { $('#generalDialogOverlay').attr('style', 'display:block;'); });
    //set style
    $('#generalGraphDialogBox').css({ 'width': w, 'min-height': h, 'max-height': xh, 'left': l, 'top': t });
    
    //debug
    $(gGraphDialogTitleSelector).html('Put dialog title here');
    $(gGraphDialogContentSelector).html('Put dialog content here');

    //close
    $('#generalGraphDialogBoxTitleCloseAnchor').click(function () {
        $('#generalGraphDialogBox').fadeOut(function () {
            $(this).remove();
            $('#generalGraphDialogOverlay').fadeOut(function () {
                $(this).remove();
            });
        });
    });

    return true;
}

function RedirectToSearchPage(text) {
    var empty = new RegExp("^\\s*$");
    if (empty.test(text)) return;
    window.location = "/result.aspx?q=" + encodeURIComponent(text);
}

function OnGeneralSearchButtonClick(textbox) {
    if ($(textbox).length > 0) {
        RedirectToSearchPage($(textbox).val());
    }
}

function OnGeneralSearchTextboxKeypress(textbox, event) {
    if (event.keyCode == 13) {
        if ($(textbox).length > 0) {
            RedirectToSearchPage($(textbox).val());
        }
    }
}

function refreshCurrentEdition() {
    jQuery.post("handles/edit.ashx", { func: 'current.edition.count' }, function (result) {
        if (result == "") result = "0";
        $(".footer-fixed-n").html('<a href="editing.aspx">' + result + '</a>');
        if (parseInt(result) > 0) {
            $(".footer-fixed").show();
        } else {
            $(".footer-fixed").hide();
        }
    });
}

function setCookieVal(key, val) {
    setCookieValWithExpireDays(key, val, 30);
}

function setCookieValWithExpireDays(key, val, expDays) {
    var today = new Date();
    var expireDate = new Date(today.getTime() + expDays * 24 * 60 * 60 * 1000);

    document.cookie = escape(key) + "=" + escape(val) + ";expires=" + expireDate.toGMTString();
}

function getCookieVal(key) {
    var cookieStr = document.cookie;
    var cookieItems = cookieStr.split(';');

    for (i = 0; i < cookieItems.length; i++) {
        var itemPair = cookieItems[i].split('=');
        //verify
        if (itemPair.length != 2) continue;
        //search key
        if (unescape(itemPair[0]) == key) {
            return unescape(itemPair[1]);
        }
    }

    return null;
}