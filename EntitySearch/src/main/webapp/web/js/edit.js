///<reference path="jquery-1.4.1.js" />

var gDatabaseExistSelector = '.displayDatabaseResult';
var gItemBlockSelector = '.editSuggestedItem .blocktext > span';
var gGeneralLoadingDisplay = "<div><img alt='Loading' src='App_Themes/cn/images/Progress.gif' /> 正在加载... </div>";
var gRelationTextInputInit = "请输入或选择一个关系";

var gCardLabelShowCount = 3;

function GetBlockForEachSuggestion() {
    var suggestionItems = $(".editSuggestedItem");
    //verify
    if (!suggestionItems.length) return;

    var totalItem = suggestionItems.length;
    var tokenStr = $.trim($('#editTokenInvisibleContainer').text());
    var entityNeedBlock = '';
    //set attributes
    for (i = 0; i < totalItem; i++) {
        var currItem = suggestionItems.eq(i);
        var currItemName = $.trim(currItem.find(".name").text());
        //verify block
        if ($.trim(currItem.find(".blocktext SPAN").html()).length == 0) {
            if (entityNeedBlock != '') entityNeedBlock += '+';
            entityNeedBlock += currItemName;
        }
    }
    //verify empty
    if (entityNeedBlock == '') return;
    //do search
    jQuery.post("handles/edit.ashx", { func: 'onload.get.block', token: tokenStr, entityStr: entityNeedBlock }, function (result) {
        if (null == result) return;

        var suggestionItems = $(".editSuggestedItem");
        var totalItem = suggestionItems.length;
        //set block
        for (i = 0; i < totalItem; i++) {
            var currItem = suggestionItems.eq(i);
            var currItemName = $.trim(currItem.find(".name").text());
            //verify block
            if ($.trim(currItem.find(".blocktext SPAN").html()).length == 0) {
                //scan result
                for (k = 0; k < result.length; k++) {
                    if (result[k].Key == currItemName) {
                        currItem.find(".blocktext SPAN").html(result[k].Snippet);
                        currItem.find(".link .url").html(result[k].DisplayUrl);
                        break;
                    }
                }
            }
        }
    }, "json");
}

function GetWebpageQuery(item) {
    return $.trim($("#nameHeader").text()) + "+" + item.Name;
}

function FormatEmptyRelTagStr(name) {
    return "编辑" + $.trim($("#nameHeader").text()) + "和" + name + "的关系";
}

function ConcatenateTextInArray(array, name, delim) {
    var ret = "";

    for (var i = 0; i < array.length; i++) {
        if (ret != "") ret += delim;
        ret += array[i];
    }
    //empty?
    if (ret == "") ret = FormatEmptyRelTagStr(name);

    return ret;
}

function GenerateLabelAssert(array, name, type) {
    var ret = "";
    switch(type)
    {
        case 'per-per':
        case 'org-org':
            if (array.length != 0) {
                switch (array[0].Item2.toString()) {
                    case '0': ret = $.trim($("#nameHeader").text()) + "是" + name + "的" + array[0].Item1; break;
                    case '1': ret = name + "是" + $.trim($("#nameHeader").text()) + "的" + array[0].Item1; break;
                    case '2': ret = $.trim($("#nameHeader").text()) + "和" + name + "是" + array[0].Item1 + "关系";  break;
                }
            }
            break;
         case 'per-org':
             if (array.length != 0) 
             {
                 ret = $.trim($("#nameHeader").text()) + "是" + name + "的" + array[0].Item1;
             }
             break;
         case 'org-per':
             if (array.length != 0) 
             {
                 ret = name + "是" + $.trim($("#nameHeader").text()) + "的" + array[0].Item1;
             }
             break;
    }
    //empty?
    if (ret == "") ret = FormatEmptyRelTagStr(name);
    return ret;
}

function GenerateLabel(array) {
    var ret = "";
    if (array.length != 0) {
        ret = array[0].Item1;
    }
    return ret;
}

function RenderEdittedItem1(item_ex) {
    var labelAssert = "";
    var item = item_ex.Item1;
    var relCount = item_ex.Item2;
    //generate label string
    labelAssert = GenerateLabel(item.TagsWithDirection) == "" ? FormatEmptyRelTagStr(item.Name) : GenerateLabel(item.TagsWithDirection);
    //show lianliankan when (id = -1 or IsNameOnly = true) and relCount > 0
    var ShowLianLianKan = (item.Id == -1 || item.IsNameOnly == true) && relCount > 0 && !item.IsPopName;
    var html = "<div class='selected-item'>";
    //render photo
    if (ShowLianLianKan) {
        if (gThisPageEditType == '3') {
            html += "<div class='photo'>"
                + "<img src='/App_Themes/cn/images/organization_name_48.png' alt='photo' style='cursor:pointer;' onclick='return OnMappingWikiEHashTryGet(this);' />"
                + "</div>";
        }
        else {
            html += "<div class='photo'>"
                + "<img src='/App_Themes/cn/images/notentity48.png' alt='photo' style='cursor:pointer;' onclick='return OnMappingWikiEHashTryGet(this);' />"
                + "<a onclick='OnMappingWikiEHashTryGet(this);' href='javascript:'>连连看</a>"
                + "</div>";
        }
    } else {
        html += "<div class='photo'><img src='/portrait.aspx?id=" + item.Id + "&type=" + gThisPageEditType.toString() + "' alt='" + (item.Name) + "' /></div>";
    }

    if (ShowLianLianKan) {
        html += "<div ehash='" + item.Hash + "' class='main' style='min-height:74px;'>";
    } else {
        html += "<div ehash='" + item.Hash + "' class='main'>";
    }

    html += "<div class='info'>"
            + "<div class='name'>" + GetItemNameFormat(item) + "</div>"
            + "<div class='label'>" + GetItemLabelFormat(item) + "</div>"
            + "</div>"
            + "<div class='other'>"
            + "<div class='opr'>";

    if (ShowLianLianKan) {
        html += "<a onclick='OnMappingWiki(this)' href='javascript:'>连连看</a>"
            + "<span style=\"margin-left: 15px; color: #B6B6B6;\">|</span>";
    }

    html += "<a onclick='OnItemMoreClick(\"" + GetWebpageQuery(item) + "\", event)' href='javascript:' style='margin-left: 10px;'>了解更多</a>"
            + "<span style=\"margin-left: 15px; color: #B6B6B6;\">|</span>"
            + " <a onclick='" + (item.IsVerified ? "OnRemoveVerifiedEditted" : "OnRemoveEditted") + "(this)' style='margin-left: 13px;' href='javascript:'>移除</a>"
            + "</div>"

            + "<div class='rel'>"
            + "<div class='rel-val' style='display:inline-block;'>" + labelAssert + "</div>"
            + "<span class ='rel-val-invisible' style='display:none;'>" + GenerateLabel(item.TagsWithDirection) + "</span>"
            + "<div class='rel-edit' style='display:inline-block'>"
            + "<a onclick='OnEditRelationshipClick1(this);'  href='javascript:'><img src=\"App_Themes/cn/images/edit.png\" alt=\"编辑\" /></a>"
            + "</div>" //rel-edit
            + "</div>" //rel
            + "</div>" //other

            + "</div>" //main
            + "</div>";  //selected-item

    return html;
}


function RenderEdittedItem(item) {
    var html = "<div class='selected-item'>";
    //render photo part
    if (item.Id == -1 || item.IsNameOnly == true) {
        html += "<div class='photo'>";
            + "<img src='/App_Themes/cn/images/notentity48.png' alt='photo' style='cursor:pointer;' onclick='return OnMappingWikiEHashTryGet(this);' />"
            + "<a onclick='OnMappingWikiEHashTryGet(this)' href='javascript:'>连连看</a>"
            + "</div>";
    } else {
        html += "<div class='photo'>"
            + "<img src='portrait.aspx?id=" + item.Id + "&type=" + gThisPageEditType + "' alt='photo' />"
            + "</div>";
    }
    //render main part
    if (item.Id == -1 || item.IsNameOnly == true) {
        html += "<div ehash='" + item.Hash + "' class='main' style='min-height:74px;'>";
    } else {
        html += "<div ehash='" + item.Hash + "' class='main'>";
    }

    html += "<div class='info'>"
            + "<div class='name'>" + GetItemNameFormat(item) + "</div>"
            + "<div class='label'>" + GetItemLabelFormat(item) + "</div>"
            + "</div>"
            + "<div class='other'>"
            + "<div class='opr'>";

    if (item.Id == -1 || item.IsNameOnly == true) {
        html += "<a onclick='OnMappingWiki(this)' href='javascript:' style='margin-left: 10px;'>连连看</a>"
            + "<span style=\"margin-left: 15px; color: #B6B6B6;\">|</span>";
    }

    html += "<a onclick='OnItemMoreClick(\"" + GetWebpageQuery(item) + "\", event)' href='javascript:'>了解更多</a>"
            + "<span style=\"margin-left: 15px; color: #B6B6B6;\">|</span>"
            + " <a onclick='" + (item.IsVerified ? "OnRemoveVerifiedEditted" : "OnRemoveEditted") + "(this)' style='margin-left: 13px;' href='javascript:'>移除</a>"
            + "</div>"

            + "<div class='rel'>"
            + "<div class='rel-val'>" + ConcatenateTextInArray(item.Tags, item.Name, ', ') + "</div>"
            + "<div class='rel-edit'>"
            + "<a onclick='OnEditRelationshipClick1(this);'  href='javascript:'><img src=\"App_Themes/cn/images/edit.png\" alt=\"编辑\" /></a>"
            + "</div>" //rel-edit
            + "</div>" //rel
            + "</div>" //other

            + "</div>" //main
            + "</div>";  //selected-item

    return html;
}

function RenderSuggestedItem(item) {
    var html = "<div ehash='" + item.Hash + "' class='editSuggestedItem'>"
            + "<div class='detail'>"

            + "<div class='header'>"
            + "<div class=\"edit\"><a href=\"javascript:\" onclick=\"OnAddSuggestionClicked(this)\"><img src=\"App_Themes/cn/images/add.png\" alt=\"添加\" /></a></div>";

    if (item.Id == -1
        || item.IsNameOnly == true) {
        if (gThisPageEditType == '3') html += "<div class='photo'><img src='App_Themes/cn/images/organization_name_26.png' alt='photo'></div>";
        else html += "<div class='photo'><img src='App_Themes/cn/images/notentity26.png' alt='photo'></div>";
    } else {
        html += "<div class='photo'><img src='portrait.aspx?id=" + item.Id + "&type=" + gThisPageEditType.toString() + "' alt='photo'></div>";
    }

    html += "<div class='name'>" + GetItemNameFormat(item) + "</div>"
            + "<div class='label'>" + GetItemLabelFormat(item) + "</div>"
            + "</div>" //header

            + "<div class='blocktext'>"
            + "<span ehash='" + item.Hash + "'></span>"
            + "</div>" //blocktext

            + "<div ehash='" + item.Hash + "' class='link'>"
            + "<div class=\"mr\"><a onclick='OnItemMoreClick(\"" + GetWebpageQuery(item) + "\", event)' href='javascript:'>了解更多</a></div>"
            + "<div class=\"url\"></div>"
            + "</div>"//link

            + "</div>" //detail
            + "</div>";  //editSuggestedItem

    return html;
}

function GetItemNameFormat(item) {
    if (item.Id != -1 && item.IsNameOnly == false) {
        return "<a target='_blank' eid='" + item.Id + "' href='view.aspx?id=" + item.Id + "'>" + item.Name + "</a>";
    }

    return item.Name;
}

function GetItemLabelFormat(item) {
    if (item.Id != -1 && !item.IsNameOnly) {
        return item.Label;
    }

    return "";
}

function OnFilterTextBoxKeypress(button, event) {
    if (event.keyCode == 13) {
        $(button).click();
        return false;
    }
}

function OnItemMoreClick(text, event) {
    var tokenStr = $.trim($('#editTokenInvisibleContainer').text());
    var w = 500, h = 100, xh = 300;
    var x = $(window).width() / 2 - w / 2;
    var y = $(window).height() / 2 - xh / 2;
    //show dialog
    dialog(w + 'px', h + 'px', xh + 'px', x + 'px', y + 'px');
    //set title
    $(gDialogTitleSelector).html(text);
    $(gDialogContentSelector).html("<img src='/App_Themes/cn/images/progress.gif' alt='loading...' />正在加载数据...");
    //call block search
    jQuery.post("handles/edit.ashx", { func: 'more.block', token: tokenStr, count: '3', query: text }, function (result) {
        if (null == result) return;
        //set data
        $(gDialogContentSelector).html(result);
    }, "text/plain");
}

function onEditLableClick(nm, currlabel) 
{
    return editLabel(nm, currlabel);
}

function editLabel(nm, currlabel) {
    var tokenStr = $.trim($('#editTokenInvisibleContainer').text());
    var passeid = -1;
    if (entityid != null) {
        passeid = entityid;
    }
    var w = 500, h = 100, xh = 300;
    var x = $(window).width() / 2 - w / 2;
    var y = $(window).height() / 2 - xh / 2;
    //show dialog
    dialog(w + 'px', h + 'px', xh + 'px', x + 'px', y + 'px');

    $(gDialogTitleSelector).html("设置名片");
    $(gDialogTitleTipSelector).html("请从下面四类信息中选择一至两类显示在名片上");

    var initHTML = "<div class='editLabelOut'>";
    initHTML += "<div id='labelValue'></div>";
    initHTML += "<div id='labelSuggestValue'>";
    initHTML += "<img src='/App_Themes/cn/images/progress.gif' alt='loading...' />正在加载推荐标签...";
    initHTML += "</div>";
    initHTML += "<div id='labelSaveDiv'><center><input type='button' class='new-okbtn' name='labelValueSaveBtn' value='' onclick='return labelSaveBtnClick();' />";
    initHTML += "</center></div>";
    initHTML += "</div>";

    $(gDialogContentSelector).html(initHTML);

    jQuery.post("handles/edit.ashx", { func: 'rec.label', token: tokenStr, cid: passeid }, function (result) {

        if (null == result) {
            $("#labelSuggestValue").html("");
            return;
        }

        var rechtml = "";
        var cnt = 0;
        for (key in result) {
            cnt++;
        }

        if (cnt != 0) {
            for (key in result) {
                rechtml += "<div class='reclabelspan'>";
                rechtml += "<div class='reclabelheader'>";

                var toolHTML = "";
                if (result[key].length < gCardLabelShowCount) {
                    toolHTML += "<div class='scrollPrevBtn pagehide'></div>";
                    toolHTML += "<div class='scrollNextBtn pagehide'></div>";
                } else {
                    toolHTML += "<div class='scrollPrevBtn'></div>";
                    toolHTML += "<div class='scrollNextBtn'></div>";
                }

                toolHTML += "<div class='reclabelcnt'>";
                toolHTML += "<span class=\"reclabeltag_ul\">";
                var selcnt = 0;
                for (var i = 0; i < result[key].length; i++) {
                    if (result[key][i] != "" && result[key][i].substring(0, 1) == "+") {
                        result[key][i] = result[key][i].substring(1);
                        toolHTML += "<span class=\"reclabeltag_li reclabeltag_li_sel\" onclick='return confirmLabel(this, \"" + result[key][i] + "\");'><a href='#'>" + result[key][i] + "</a></span>";
                        selcnt++;
                    } else {
                        toolHTML += "<span class=\"reclabeltag_li\" onclick='return confirmLabel(this, \"" + result[key][i] + "\");'><a href='#'>" + result[key][i] + "</a></span>";
                    }
                }

                toolHTML += "</span>";

                toolHTML += "</div>";
                toolHTML += "</div>";

                if (selcnt == 0) {
                    rechtml += "<div class='cateogrysign reclabelselect'></div>";
                    rechtml += "" + key + "";
                    rechtml += "</div>";
                } else {
                    rechtml += "<div class='cateogrysign reclabelselected'></div>";
                    rechtml += "" + key + "";
                    rechtml += "</div>";
                }

                rechtml += toolHTML;
            }
        } else {
            rechtml += "请填写更多信息";
        }

        $("#labelSuggestValue").html(rechtml);

        autoShow();

        $(".cateogrysign").click(function () {
            if ($(this).hasClass("reclabelselect")) {
                //select the label
                //count the number
                var cnt = $(".reclabelselected").length;
                if (cnt >= 2) {
                    alert("最多只能选择两个");
                    return;
                }

                $(this).removeClass("reclabelselect");
                $(this).addClass("reclabelselected");
                //auto select the first
                $(this).parents(".reclabelspan").children(".reclabelcnt").children(".reclabeltag_ul").children(".reclabeltag_li").first().addClass("reclabeltag_li_sel");
            } else {
                $(this).removeClass("reclabelselected");
                $(this).addClass("reclabelselect");
                //remove all selected child items
                $(this).parents(".reclabelspan").children(".reclabelcnt").children(".reclabeltag_ul").children(".reclabeltag_li").removeClass("reclabeltag_li_sel");
            }
        });

        $(".scrollPrevBtn").click(function () {
            var items = $($(this).parent()[0]).children(".reclabelcnt").children(".reclabeltag_ul").children(".reclabeltag_li");
            var firstVisible = 0;
            for (; firstVisible < items.length; firstVisible++) {
                if ($(items[firstVisible]).is(":visible")) {
                    break;
                }
            }

            if (firstVisible == 0 || firstVisible == items.length) {
            } else {
                for (var i = 0; i < items.length; i++) {
                    if (i < (firstVisible - 1)) {
                        $(items[i]).hide();
                    } else if (i >= (firstVisible - 1) && i < (firstVisible + gCardLabelShowCount - 1)) {
                        $(items[i]).show();
                    } else {
                        $(items[i]).hide();
                    }
                }
            }
        });

        $(".scrollNextBtn").click(function () {
            var items = $($(this).parent()[0]).children(".reclabelcnt").children(".reclabeltag_ul").children(".reclabeltag_li");
            var firstVisible = 0;
            for (; firstVisible < items.length; firstVisible++) {
                if ($(items[firstVisible]).is(":visible")) {
                    break;
                }
            }

            if (firstVisible == items.length) {

            } else if ((firstVisible + gCardLabelShowCount) >= items.length) {

            } else {
                for (var i = 0; i < items.length; i++) {
                    if (i <= firstVisible) {
                        $(items[i]).hide();
                    } else if (i > firstVisible && i <= (firstVisible + gCardLabelShowCount)) {
                        $(items[i]).show();
                    } else {
                        $(items[i]).hide();
                    }
                }
            }
        });

        refreshCurrentEdition();
    }, "json");
}

function confirmLabel(ele, txt) {
    //get selector parent
    var rootEle = $(ele).parent().parent().parent();
    var catesign = $(rootEle).children(".reclabelheader").children(".cateogrysign");
    if ($(ele).hasClass("reclabeltag_li_sel")) {
        $(ele).removeClass("reclabeltag_li_sel");
    } else {
        //auto set sign selected
        if (!$(catesign).hasClass("reclabelselected")) {
            //count the number
            var cnt = $(".reclabelselected").length;
            if (cnt >= 2) {
                alert("最多只能选择两个");
                return;
            }

            $(catesign).removeClass("reclabelselect");
            $(catesign).addClass("reclabelselected");
        }

        $(ele).addClass("reclabeltag_li_sel");
    }
}

function autoShow() {
    $(".reclabeltag_ul").each(function () {
        var tagCount = $(this).children(".reclabeltag_li").length;
        for (var i = 0; i < tagCount; i++) {
            var item = $(this).children(".reclabeltag_li")[i];
            if(i < gCardLabelShowCount){
                $(item).show();
            } else {
                $(item).hide();
            }
        }
    });
}

function formLabelValue() {
    var value = "";
    $(".reclabelspan").each(function () {
        var key = $($(this).children(".reclabelheader")[0]).text();
        var selLabelCount = $(this).children(".reclabelcnt").children(".reclabeltag_ul").children(".reclabeltag_li_sel").length;
        if (selLabelCount != 0) {
            value += key + ":";
            for (var i = 0; i < selLabelCount; i++) {
                value += $($(this).children(".reclabelcnt").children(".reclabeltag_ul").children(".reclabeltag_li_sel")[i]).text() + "#";
            }
            value += ";";
        }
    });

    return value;
}

function labelSaveBtnClick() {
    var value = formLabelValue();
    var tokenStr = $.trim($('#editTokenInvisibleContainer').text());
    jQuery.post("handles/edit.ashx", { func: 'update.label', token: tokenStr, label: value }, function (result) {
        if (null == result) {
            alert("错了错了！！！！");
            return;
        }
        var showText = value.replace(/#/g, ",");
        showText = showText.replace(/,;/g, ";");

        labelCancelBtnClick();
        $("#nameLabel").html("<span>" + showText + "</span><span><a onclick=\"return editLabel('" + "" + "','" + "" + "');\" href=\"#\"><img title=\"设置名片\" alt=\"设置名片\" src=\"/App_Themes/cn/images/card_setting.png\"></a></span>");

        $(".basicInfoBasicContent_Label").html(result);
        shortenDesc();
        $(".twoLineDescPerLine").hover(function () {
            //$(this).children(".twLineEditIcon").show();
        }, function () {
            //$(this).children(".twLineEditIcon").hide();
        });
    }, "text/plain");
}


function shortenDesc() {
    $(".twoLineDescPerLineNotShown").each(function () {
        var str = $(this).text();
        if (str.length > 15) {
            $(this).attr("title", str);
            str = str.substring(0, 15) + "...";
            $(this).text(str);
        }
    });
    $(".twoLineDescPerLine").each(function () {
        var str = $(this).text();
        if (str.length > 15) {
            $(this).attr("title", str);
            str = str.substring(0, 15) + "...";
            $(this).text(str);
        }
    });
}

function labelCancelBtnClick() {
    $('#generalDialogBox').fadeOut(function () {
        $(this).remove();
        $('#generalDialogOverlay').fadeOut(function () {
            $(this).remove();
        });
    });
}

function GetSuggestionOnload() {
    var tokenStr = $.trim($('#editTokenInvisibleContainer').text());
    //preset
    $('#recommendationResult').html(gGeneralLoadingDisplay);
    //get recommendation
    jQuery.post("handles/edit.ashx", { func: 'get.suggestion.onload', token: tokenStr, type: gThisPageEditType }, BatchLoadSuggestion, "json");
}

function BatchLoadSuggestion(result) {
    if (null == result) {
        alert("ERROR: 获取数据失败！");
        return;
    }
    //clear opr
    $('#recommendationResultOpr').html("");
    //set empty result
    if (result.length == 0) {
        $('#recommendationResult').html("没有相关推荐结果");
        return;
    }
    //set html
    RenderSuggestedItemPanel(result);
    //get block for each item
    GetBlockForEachSuggestion();
    //add function buttons
    AddRecommendationFunctionButtons();
}

function RenderSuggestedItemPanel(result) {
    var html = "";
    //format HTML
    for (i = 0; i < result.length; i++) {
        html += RenderSuggestedItem(result[i]);
    }
    //set
    $('#recommendationResult').html(html);
}

function BindEditIconHover() {
    $("IMG[src='App_Themes/cn/images/edit.png']").mouseenter(function () {
        $(this).attr("src", "App_Themes/cn/images/edit_mouseover.png");
    }).mouseleave(function () {
        $(this).attr("src", "App_Themes/cn/images/edit.png");
    });
}

function AddRecommendationFunctionButtons() {
    $("<input type='button' id='changeAllRecommendedItem' class='changeAll'>").appendTo($('#recommendationResultOpr'));
    //bind function buttons
//    $("#addAllRecommendedItem").click(function () {
//        var tokenStr = $.trim($('#editTokenInvisibleContainer').text());
//        //progress image
//        $('#recommendationResult').html("<div><img alt='Loading' src='App_Themes/cn/images/Progress.gif' /> 正在加载... </div>");
//        //get recommendation
//        jQuery.post("handles/edit.ashx", { func: 'recommendation.add.all', token: tokenStr, type: gThisPageEditType }, function (result) {
//            if (null == result) return;
//            //update suggestion
//            BatchLoadSuggestion(result.Item1);
//            //guanxi map
//            if (gThisPageEditType == '1') {
//                requestXML();
//            }
//            //update editted
//            if ($("#selectedItemView .selected-item").length == 0) {
//                $("#selectedItemView").html("");
//            }
//            for (i = 0; i < result.Item2.length; i++) {
//                $(RenderEdittedItem(result.Item2[i])).appendTo($("#selectedItemView"));
//            }
//            //bind edit hover
//            BindEditIconHover();
//            //show last page
//            RenderEdittedItemByPage(10000000);
//        }, "json");
//    });
    $("#changeAllRecommendedItem").click(function () {
        var tokenStr = $.trim($('#editTokenInvisibleContainer').text());
        //progress image
        $('#recommendationResult').html("<div><img alt='Loading' src='App_Themes/cn/images/Progress.gif' /> 正在加载... </div>");

        //store ignored Recommend Items
       

        //get recommendation
        jQuery.post("handles/edit.ashx", { func: 'recommendation.change.all', token: tokenStr, type: gThisPageEditType }, BatchLoadSuggestion, "json");
    });
}

function GetEdittedListOnload() {
    var tokenStr = $.trim($('#editTokenInvisibleContainer').text());
    //load all edited entity list when start
    jQuery.post("handles/edit.ashx", { func: 'load.editted.list', token: tokenStr, type: gThisPageEditType }, function (result) {
        if (null == result) {
            alert("ERROR> 获取数据失败!");
            return;
        }
        //render list
        RenderEdittedItemPanel(result);
        //set page
        RenderEdittedItemByPage(1);
    }, "json");
}



function RenderEdittedItemPanel(result) {
    if (result.length == 0) {
        $('#selectedItemView').html("请从左侧选择相关项添加到这里");
        return;
    }
    //render
    for (var i = 0; i < result.length; i++) {
        $(RenderEdittedItem1(result[i])).appendTo($('#selectedItemView'));
        //$(RenderEdittedItem(result[i])).appendTo($('#selectedItemView'));
    }
    //bind edit hover
    BindEditIconHover();
}

function RenderEdittedItemByPage(page) {
    var edittedItems = $('#selectedItemView .selected-item');
    //verify
    if (!edittedItems.length) return;

    var total = edittedItems.length;
    var countInLastPage = total % gItemCountInPage;
    var pageCount = (total - countInLastPage) / gItemCountInPage + 1;
    if (countInLastPage == 0) pageCount--;
    if (pageCount > 0) countInLastPage = 5;
    var requestPage = page - 1;
    if (requestPage < 0) requestPage = 0;
    if (requestPage >= pageCount) requestPage = pageCount - 1;
    var start = requestPage * gItemCountInPage;
    var end = start + gItemCountInPage;
    //hide all items
    edittedItems.hide();
    //only show specific items
    for (i = start; i < end; i++) {
        edittedItems.eq(i).show();
    }
    //render navigator
    RenderPageNav(requestPage, pageCount);
    //update label
    if (gThisPageEditType == '1') {
        $('#personTabCountDisplay').html(total + "");
    }
    else if (gThisPageEditType == '3') {
        $('#orgTabCountDisplay').html(total + "");
    }
}

function RenderPageNav(zeroBasedIndex, pageCount) {
    if (pageCount == 1) return;

    var start = zeroBasedIndex - 2;
    if (start < 0) start = 0;
    var end = start + 5;
    if (end > pageCount) end = pageCount;
    if (end - start < 5) start = end - 5;
    if (start < 0) start = 0;
    var html = "<div class='page-nav-new'>";
    //prev page
    if (zeroBasedIndex > start) {
        html += "<div class='page-nav-prev'>"
            + "<a onclick='RenderEdittedItemByPage(" + (zeroBasedIndex) + ")' href='javascript:'>"
            + "<img src='App_Themes/cn/images/prePage.png' src='上一页' />"
            + "</a></div>";
    }
    for (i = start; i < end; i++) {
        var p = i + 1;
        if (i != zeroBasedIndex) {
            html += "<div class='page-nav-select'><a onclick='RenderEdittedItemByPage(" + p + ")' href='javascript:'>" + p + "</a></div>"
        }
        else {
            html += "<div class='page-nav-current'>" + p + "</div>";
        }
    }
    if (zeroBasedIndex + 1 < end) {
        html += "<div class='page-nav-next'>"
            + "<a onclick='RenderEdittedItemByPage(" + (zeroBasedIndex + 2) + ")' href='javascript:'>"
            + "<img src='App_Themes/cn/images/nextPage.png' src='下一页' />"
            + "</a>"
            + "</div>";
    }
    html += "</div>";
    //update navigator
    $("#selectedItemPageNavView").html(html);
}

function ScanForExistingWiki(entityType) {
    var wikiScan = $(".selected-item :visible .displayDatabaseResult");
    //verify
    if (!wikiScan.length) return;

    var tokenStr = $.trim($('#editTokenInvisibleContainer').text());
    //set attributes
    for (i = 0; i < wikiScan.length; i++) {
        //already scanned?
        if (wikiScan.eq(i).text() != "") continue;

        var entity = $.trim(wikiScan.eq(i).attr('entity'));
        jQuery.post("handles/edit.ashx", { func: 'lookup.database.count', token: tokenStr, name: entity, type: entityType }, function (result) {
            if (null == result) {
                alert("ERROR> 获取数据失败!");
                return;
            }
            //update HTML
            $("span[entity='" + result.Key + "']").html(result.Html);
        }, "json");
    }
}

function OnFilterButtonClick(textbox) {
    var keywordStr = $.trim($(textbox).val());
    var tokenStr = $.trim($('#editTokenInvisibleContainer').text());
    //verify
    if (keywordStr == "") return;
    //progress image
    $('#recommendationResult').html(gGeneralLoadingDisplay);
    $('#recommendationResultOpr').html("");
    //get recommendation
    jQuery.post("handles/edit.ashx", { func: 'search.entity.by.keyword', token: tokenStr, type: gThisPageEditType, keyword: keywordStr }, BatchLoadSuggestion, "json");
}

function OnAddSuggestionClicked(a) {
    var tokenStr = $.trim($('#editTokenInvisibleContainer').text());
    var ehash = $(a).parents(".editSuggestedItem").attr("ehash");
    //post
    jQuery.post("handles/edit.ashx", { func: 'recommendation.add', token: tokenStr, hash: ehash, type: gThisPageEditType }, function (result) {
        if (null == result) {
            alert("ERROR: 更新数据失败！");
            return;
        }
        //append next suggestion
        if (result.Item1 != null) {
            $(RenderSuggestedItem(result.Item1)).appendTo($('#recommendationResult')).slideDown();
        }
        //update editted items
        if ($("#selectedItemView .selected-item").length == 0) {
            $("#selectedItemView").html("");
        }

        $(RenderEdittedItem1(result.Item2)).appendTo($('#selectedItemView'));

        //bind edit hover
        BindEditIconHover();
        
        //move to last page
        RenderEdittedItemByPage(100000000);
        
        //guanxi graph
        if (gThisPageEditType == '1') {
            requestXML();
        }
        
        //update block
        GetBlockForEachSuggestion();
    }, "json");
    //remove
    $(a).parents(".editSuggestedItem").slideUp(function () {
        $(this).remove();
    });
}

function OnRemoveVerifiedEditted(a) {
    alert("由于该项已经通过了系统的认证，您暂时无法删除该项！");
}

function OnRemoveEditted(a) {
    if (!confirm("您确认移除这条关系？")) {
        return;
    }
    var tokenStr = $.trim($('#editTokenInvisibleContainer').text());
    var pageStr = $.trim($('#hiddenPageNumber').text());
    var ehashStr = $(a).parents(".main").attr("ehash");
    //get result
    jQuery.post("handles/edit.ashx", { func: 'delete.selected.entity', token: tokenStr, hash: ehashStr }, function (result) {
        if (result != "ok") {
            return;
        }
        //remove item
        $(a).parents('.selected-item').slideUp(function () {
            $(this).remove();
            //removed all
            if ($("#selectedItemView .selected-item").length == 0) {
                $('#selectedItemView').html("请从左侧选择相关项添加到这里");
                $('#selectedItemPageNavView').html("");
                return;
            }
            //render again
            if ($(".page-navigator .current").length == 0) {
                RenderEdittedItemByPage(1);
            }
            else {
                RenderEdittedItemByPage(parseInt($(".page-navigator .current").text(), 10));
            }
        });
    }, "text/plain");
}

function FormatRelOprPanel() {
    return "<div class='rel-opr-panel'>"
    + "<div class='rel-suggest'>"
    + "</div>"
    + "<div class='rel-opr'>"
    + "<input type='button' class='ok'>"
    + "<input type='button' value='取消' class='cancel'>"
    + "</div>"
    + "</div>";
}

function AddRelOprPanel()
{
    return "<div class='rel-opr-panel'>"
    + "</div>";
}

function AddSuggestPanel() {
    return "<div class='rel-suggest'>"
    + "</div>";
}

function AddOperBunttons() {
    return "<div class='rel-opr'>"
    + "<input type='button' class='ok'>"
    + "<input type='button' value='取消' class='cancel'>"
    + "</div>";
}

function LabelAssertSelectionClick(a) {
    LableAssertFlag = $(a).attr('value');
}

function FormatLabelSelectionMenu() {
    return "<div class = 'label-select-menu'>"
    + "<input class = 'relation-assert' id = 'first-assert' type = 'radio' onclick ='LabelAssertSelectionClick(this)' name = 'assert' value='0' /><span class = 'span-assert'  id = 'span1'></span>"
    + "<br>"
    + "<input class = 'relation-assert' id = 'second-assert' type = 'radio' onclick ='LabelAssertSelectionClick(this)' name = 'assert' value='1' /><span class = 'span-assert'  id = 'span2'></span>"
    + "<br>"
    + "<input class = 'relation-assert' id = 'third-assert' type = 'radio'  onclick ='LabelAssertSelectionClick(this)' name = 'assert' value='2' /><span class = 'span-assert'  id = 'span3'></span>"
    + "</div>";
}

function FormatLabelAssert() {
    return "<div class = 'label-assertion'>"
    +"</div>"
}

function SetSelectionMenu(firstName, secondName, relationTag, positionInPage) {
    var fisrtAssert = " " + firstName + "是" + secondName + "的" + relationTag;
    var SecondAssert = "  " + secondName + "是" + firstName + "的" + relationTag;
    var ThirdAssert = " " + firstName + "和" + secondName + "是" + relationTag + "的关系";
    $(positionInPage + ".relation-assert#first-assert").attr("checked", true);
    $(positionInPage + ".span-assert#span1").text(fisrtAssert);
    $(positionInPage + ".span-assert#span2").text(SecondAssert);
    $(positionInPage + ".span-assert#span3").text(ThirdAssert);
}

function FormatRelTagRecommendation(tag, edition, related) {
    return "<div class='rel-suggest-item'>"
    + "<a href='javascript:' onclick ='OnItemMoreClick(\"" + edition + "+" + related + "+" + tag + "\", event)'>" + tag + "</a>"
    + "<img class='rel-suggest-item-add' src='/App_Themes/cn/images/addguanxi.png'/>"
    + "</div>"
    + "";
}



function OnEditRelationshipClick1(a) {
    //reset edit panel
    ResetAllRelationOprPanel();
    //reset link panel
    ResetAllWikiOprPanel();

    LableAssertFlag = '0';
    var tokenStr = $.trim($('#editTokenInvisibleContainer').text());
    var ehashStr = $(a).parents(".main").attr('ehash');

    var secondName = $.trim($(".main[ehash='" + ehashStr + "'] .info .name").text());
    var firstName = $.trim($("#nameHeader").text());
    var relationTag = $.trim($(".main[ehash='" + ehashStr + "'] .other .rel .rel-val-invisible").text());
    var menuPosition = ".main[ehash='" + ehashStr + "'] .rel-opr-panel .label-select-menu ";
    //hide current tag
    $(".main[ehash='" + ehashStr + "'] .other .rel .rel-val").hide();
    //hide edit button
    $(".main[ehash='" + ehashStr + "'] .other .rel .rel-edit").hide();
    //add textbox
    if (relationTag != "") {
        $("<input type=\"text\" class=\"textbox clickouttextbox\" />").appendTo($(".main[ehash='" + ehashStr + "'] .other .rel")).val($(".main[ehash='" + ehashStr + "'] .other .rel .rel-val-invisible").text());
    }
    else {
        $("<input type=\"text\" class=\"textbox clickouttextbox\" style=\"color:#AAAAAA;\"/>").appendTo($(".main[ehash='" + ehashStr + "'] .other .rel")).val(gRelationTextInputInit);
    }

    //check empty
    if ($.trim($(".main[ehash='" + ehashStr + "'] .other .rel .textbox").val()) == FormatEmptyRelTagStr($.trim($(".main[ehash='" + ehashStr + "'] .info .name").text()))) {
        $(".main[ehash='" + ehashStr + "'] .other .rel .textbox").val("");
    }
    //add operation panel
    $(AddRelOprPanel()).appendTo($(".main[ehash='" + ehashStr + "']"));
    
    $(AddSuggestPanel()).appendTo($(".main[ehash='" + ehashStr + "'] .rel-opr-panel"));

    if ((entitytype == 1 && gThisPageEditType == '1') || (entitytype == 3 && gThisPageEditType == '3')) 
    {
        //add selection menu
        $(FormatLabelSelectionMenu()).appendTo($(".main[ehash='" + ehashStr + "'] .rel-opr-panel"));
        //set selection menu
        SetSelectionMenu(firstName, secondName, relationTag, menuPosition);

        if (relationTag == "") $(".main[ehash='" + ehashStr + "'] .rel-opr-panel .label-select-menu").hide();
    }
    if ((entitytype == 1 && gThisPageEditType == '3') ) {
        $(FormatLabelAssert()).appendTo($(".main[ehash='" + ehashStr + "'] .rel-opr-panel"));
        var newAssert = "";
        if (relationTag != "") {
            newAssert = firstName + "是" + secondName + "的" + relationTag;
        }
       $(".main[ehash='" + ehashStr + "'] .rel-opr-panel .label-assertion").html(newAssert);
    }
    if ((entitytype == 3 && gThisPageEditType == '1')) {
        $(FormatLabelAssert()).appendTo($(".main[ehash='" + ehashStr + "'] .rel-opr-panel"));
        var newAssert = "";
        if (relationTag != "") {
            newAssert = secondName + "是" + firstName + "的" + relationTag;
        }
        $(".main[ehash='" + ehashStr + "'] .rel-opr-panel .label-assertion").html(newAssert);
    }
    $(AddOperBunttons()).appendTo($(".main[ehash='" + ehashStr + "'] .rel-opr-panel"));

    $(".main[ehash='" + ehashStr + "'] .other .rel .textbox").keyup(function () {
        relationTag = $(this).val();
        if ((entitytype == 1 && gThisPageEditType == '1') || (entitytype == 3 && gThisPageEditType == '3')) {
            SetSelectionMenu(firstName, secondName, relationTag, menuPosition);
            $(".main[ehash='" + ehashStr + "'] .rel-opr-panel .label-select-menu").show()
        }
        if ((entitytype == 1 && gThisPageEditType == '3')) {
            $(".main[ehash='" + ehashStr + "'] .rel-opr-panel .label-assertion").html(firstName + "是" + secondName + "的" + relationTag);
        }
        if ((entitytype == 3 && gThisPageEditType == '1'))
        { $(".main[ehash='" + ehashStr + "'] .rel-opr-panel .label-assertion").html(secondName + "是" + firstName + "的" + relationTag); }
    });
    
    //show loading
    $(".main[ehash='" + ehashStr + "'] .rel-opr-panel .rel-suggest").html(gGeneralLoadingDisplay);
    //okay click
    $(".main[ehash='" + ehashStr + "'] .rel-opr-panel .rel-opr .ok").click(function () {
        //assign the assertions selected to relationship display
        var formatTagAssert = "";
        if ((entitytype == 1 && gThisPageEditType == '1') || (entitytype == 3 && gThisPageEditType == '3')) {
            switch (LableAssertFlag) {
                case '0': formatTagAssert = firstName + "是" + secondName + "的" + relationTag; break;
                case '1': formatTagAssert = secondName + "是" + firstName + "的" + relationTag; break;
                case '2': formatTagAssert = firstName + "和" + secondName + "是" + relationTag + "的关系"; break;
            } //switch
        }
        if ((entitytype == 1 && gThisPageEditType == '3')) {
            LableAssertFlag = '0';
            if (relationTag != "") {
                formatTagAssert = firstName + "是" + secondName + "的" + relationTag;
            }
        }
        if ((entitytype == 3 && gThisPageEditType == '1')) {
            LableAssertFlag = '0';
            if (relationTag != "") {
                formatTagAssert = secondName + "是" + firstName + "的" + relationTag;
            }
        }
        if (formatTagAssert == "") formatTagAssert = FormatEmptyRelTagStr($.trim($(".main[ehash='" + ehashStr + "'] .info .name").text()));

        if (relationTag != "") {
            $(".main[ehash='" + ehashStr + "'] .other .rel .rel-val").html(relationTag);
            $(".main[ehash='" + ehashStr + "'] .other .rel .rel-val-invisible").html(relationTag);
        }
        //reset edit panel
        ResetAllRelationOprPanel();
        //update tag
        if (relationTag != "") {
            if ((entitytype != 3 || gThisPageEditType != '3')) {
                jQuery.post("handles/edit.ashx", { func: 'update.relation.tag', token: tokenStr, type: gThisPageEditType, hash: ehashStr, tag: relationTag, direc: LableAssertFlag }, function (result) {
                    if (result == null
                        || result == "") {
                        $(".main[ehash='" + ehashStr + "'] .other .rel .rel-val").html(FormatEmptyRelTagStr($.trim($(".main[ehash='" + ehashStr + "'] .info .name").text())));
                    }
                }, "text/plain");
            }
        }
    });
    
    //cancel click
    $(".main[ehash='" + ehashStr + "'] .rel-opr-panel .rel-opr .cancel").click(function () {
        //reset edit panel
        ResetAllRelationOprPanel();
    });
    //post-back
    jQuery.post("handles/edit.ashx", { func: 'get.relation.tag.edit', token: tokenStr, type: gThisPageEditType, hash: ehashStr }, function (result) {
        
        var relSuggest = $(".main[ehash='" + result.Key + "'] .rel-opr-panel .rel-suggest");
        if (entitytype == 3 && gThisPageEditType == '3') {
            relSuggest.html("");
            $(FormatRelTagRecommendation("上级机构", result.EditionName, result.RelatedName)).appendTo(relSuggest);
            $(FormatRelTagRecommendation("下级机构", result.EditionName, result.RelatedName)).appendTo(relSuggest);
            $(FormatRelTagRecommendation("合作伙伴", result.EditionName, result.RelatedName)).appendTo(relSuggest);
            $(FormatRelTagRecommendation("竞争对手", result.EditionName, result.RelatedName)).appendTo(relSuggest);
        }
        else {
            //clear panel
            relSuggest.html("没有找到合适的推荐");
            //empty result?
            if (null == result || result.Tags.length == 0) return;
            //set content
            relSuggest.html("");

            for (i = 0; i < result.Tags.length; i++) {
                $(FormatRelTagRecommendation(result.Tags[i], result.EditionName, result.RelatedName))
                    .appendTo(relSuggest);
            }
        }
        
        //replace add
        $(".main[ehash='" + result.Key + "'] .rel-opr-panel .rel-suggest .rel-suggest-item-add").click(function () {
            LableAssertFlag = '0';
            var textbox = $(this).parents(".main").children(".other").children(".rel").children("INPUT");
            //replace
            relationTag = $(this).parent().text();
            //set text
            textbox.val(relationTag);

            if ((entitytype == 1 && gThisPageEditType == '1') || (entitytype == 3 && gThisPageEditType == '3')) {
                //reset selection menu
                SetSelectionMenu(firstName, secondName, relationTag, menuPosition);
                $(".main[ehash='" + ehashStr + "'] .rel-opr-panel .label-select-menu").show()
            }
        });
    }, "json");
}


function OnEditRelationshipClick(a) {
    //reset edit panel
    ResetAllRelationOprPanel();

    var tokenStr = $.trim($('#editTokenInvisibleContainer').text());
    var ehashStr = $(a).parents('.main').attr('ehash');
    //hide current tag
    $(".main[ehash='" + ehashStr + "'] .other .rel .rel-val").hide();
    //hide edit button
    $(".main[ehash='" + ehashStr + "'] .other .rel .rel-edit").hide();
    //add textbox
    $("<input type=\"text\" class=\"textbox\" />").appendTo($(".main[ehash='" + ehashStr + "'] .other .rel")).val($(".main[ehash='" + ehashStr + "'] .other .rel .rel-val").text());
    //check empty
    if ($.trim($(".main[ehash='" + ehashStr + "'] .other .rel .textbox").val()) == FormatEmptyRelTagStr($.trim($(".main[ehash='" + ehashStr + "'] .info .name").text()))) {
        $(".main[ehash='" + ehashStr + "'] .other .rel .textbox").val("");
    }
    //add operation panel
    $(FormatRelOprPanel()).appendTo($(".main[ehash='" + ehashStr + "']"))
    //show loading
    $(".main[ehash='" + ehashStr + "'] .rel-opr-panel .rel-suggest").html(gGeneralLoadingDisplay);
    //okay click
    $(".main[ehash='" + ehashStr + "'] .rel-opr-panel .rel-opr .ok").click(function () {
        //assign text in textbox to relationship display
        var textbox = $(".main[ehash='" + ehashStr + "'] .other .rel .textbox");
        var t = $.trim(textbox.val()).replace(/\s+|,|，/g, ",");
        var tags = t.split(",");
        var formatedTags = "";
        var submitTags = "";
        //format tags
        for (i = 0; i < tags.length; i++) {
            if (tags[i] == "") continue;
            if (formatedTags.indexOf(tags[i]) >= 0) continue;
            //tags to display
            if (formatedTags != "") formatedTags += ", ";
            formatedTags += $.trim(tags[i]);
            //tags for server
            if (submitTags != "") submitTags += "+";
            submitTags += "\"" + $.trim(tags[i]) + "\"";
        }
        //empty?
        if (formatedTags == "") formatedTags = FormatEmptyRelTagStr($.trim($(".main[ehash='" + ehashStr + "'] .info .name").text()));
        //set html
        $(".main[ehash='" + ehashStr + "'] .other .rel .rel-val").html(formatedTags);
        //reset edit panel
        ResetAllRelationOprPanel();
        //update tag
        jQuery.post("handles/edit.ashx", { func: 'update.relation.tag', token: tokenStr, type: gThisPageEditType, hash: ehashStr, tag: submitTags }, function (result) {
            if (result == null
                || result == "") {
                $(".main[ehash='" + ehashStr + "'] .other .rel .rel-val").html("");
            }
            //update tag
            $(".main[ehash='" + ehashStr + "'] .other .rel .rel-val").html(result);
        }, "text/plain");
    });
    //cancel click
    $(".main[ehash='" + ehashStr + "'] .rel-opr-panel .rel-opr .cancel").click(function () {
        //reset edit panel
        ResetAllRelationOprPanel();
    });
    //post-back
    jQuery.post("handles/edit.ashx", { func: 'get.relation.tag.edit', token: tokenStr, type: gThisPageEditType, hash: ehashStr }, function (result) {
        var relSuggest = $(".main[ehash='" + result.Key + "'] .rel-opr-panel .rel-suggest");
        //clear panel
        relSuggest.html("没有找到合适的推荐");
        //empty result?
        if (null == result || result.Tags.length == 0) return;
        //set content
        relSuggest.html("");
        for (i = 0; i < result.Tags.length; i++) {
            $(FormatRelTagRecommendation(result.Tags[i], result.EditionName, result.RelatedName))
                .appendTo(relSuggest);
        }
        //bind add
        $(".main[ehash='" + result.Key + "'] .rel-opr-panel .rel-suggest .rel-suggest-item-add").click(function () {
            var textbox = $(this).parents(".main").children(".other").children(".rel").children("INPUT");
            var t = $.trim(textbox.val());
            //append
            if (t != "") t += ", ";
            t += $(this).parent().text();
            //set text
            textbox.val(t);
            //remove
            $(this).parent().parent().remove();
        });
    }, "json");
}

function ResetAllRelationOprPanel() {
    var existingTagOprPanel = $(".selected-item .main .rel-opr-panel");
    //empty?
    if (existingTagOprPanel.length == 0) return;
    //reset
    for (i = 0; i < existingTagOprPanel.length; i++) {
        var panel = existingTagOprPanel.eq(i);
        //show relation/edit
        panel.parents(".main").children(".other").children(".rel").children(".rel-val").show();
        panel.parents(".main").children(".other").children(".rel").children(".rel-edit").show();
        //remove textbox
        panel.parents(".main").children(".other").children(".rel").children(".textbox").remove();
        //remove selection menu
        panel.parents(".main").children(".other").children(".rel").children(".label-select-menu").remove();
        //remove panel
        panel.slideUp(function () {
            $(this).remove();
        });
    }
}

function ResetAllWikiOprPanel() {
    $(".selected-item .main .connect").slideUp(function () {
        $(this).remove();
    });
}

function FormatEmptyWikiPanel() {
    return "<div class='connect'><div class='empty'>"
        + gGeneralLoadingDisplay
        + "</div></div>";
}

function FormatWikiEntityItem(en, ehash) {
    return "<div class='en' eid='" + en.Id + "' ehash='" + ehash + "'>"
        + "<div class='pho'>"
        + "<img src='portrait.aspx?id=" + en.Id + "' alt='" + en.Name + "'>"
        + "</div>"
        + "<div class='detail'>"
        + "<div class='name'>" + en.Name + "</div>"
        + "<div class='label'>" + en.Label + "</div>"
        + "</div>"
        + "</div>";
}

function FormatWikiEntityListPanel() {
    return "<div class='en-prev'>"
        + "<a href='javascript:'>"
        + "<img alt='上一页' src='App_Themes/cn/images/view_prepage.png'></a>"
        + "</div>"
        + "<div class='en-body'>"
        + "</div>";
}

function FormatWikiEntityListNext() {
    return "<div class='en-next'>"
        + "<a href='javascript:'>"
        + "<img alt='下一页' src='App_Themes/cn/images/view_nextpage.png'></a>"
        + "</div>";
}

function MappingToNonWiki(a) {
    var tokenStr = $.trim($('#editTokenInvisibleContainer').text());
    var ehashStr = $(a).parents(".main").attr('ehash');
    var eid = "-1";

    //update
    jQuery.post("handles/edit.ashx", { func: 'map.wiki.entity', token: tokenStr, entityId: eid, hash: ehashStr }, function (result) {
        if (null == result || result == "") return;
        var newHashCode = result;

        //set name, photo, label
        $(".main[ehash='" + ehashStr + "']").siblings(".photo").children("IMG").attr("src", "/App_Themes/cn/images/notentity48.png");
        var nameText = $(".main[ehash='" + ehashStr + "'] .info .name").text();
        $(".main[ehash='" + ehashStr + "'] .info .name").html(nameText);
        $(".main[ehash='" + ehashStr + "'] .info .label").html("");

        //close
        ResetAllWikiOprPanel();
    }, "text/plain");
}

function OnMappingWikiEHashTryGet(a) {
    var ehash = $(a).parents(".selected-item").children(".main").attr("ehash");
    OnMappingWikiEHash(ehash);
}

function OnMappingWikiEHash(ehashStr) {
    var tokenStr = $.trim($('#editTokenInvisibleContainer').text());
    //already opened?
    if ($(".main[ehash='" + ehashStr + "'] .connect").length) {
        //close
        $(".main[ehash='" + ehashStr + "'] .connect").slideUp(function () {
            $(this).remove();
        });
        return;
    }

    //remove existing panel
    ResetAllWikiOprPanel();
    //remove existing relatino
    ResetAllRelationOprPanel();

    //add a new panel
    $(FormatEmptyWikiPanel()).appendTo($(".main[ehash='" + ehashStr + "']"));
    //post-back
    jQuery.post("handles/edit.ashx", { func: 'get.existing.entity', token: tokenStr, type: gThisPageEditType, hash: ehashStr }, function (result) {
        var connectPanel = $(".main[ehash='" + result.Item1 + "'] .connect");
        //set empty string
        connectPanel.html("<div class='empty'>没有在百科中找到对应名字的词条</div>");
        //check result
        if (null == result || result.Item2.length == 0) return;
        //set content
        connectPanel.html("");
        //instruction line and list line
        $("<div class='instr'><div class='none'><a href='javascript:' onclick='MappingToNonWiki(this);'>都不是</a></div><div class='t'>有多人叫这个名字，您添加的是下面的哪一个？</div></div><div class='list'></div>").appendTo(connectPanel);
        //en-prev and en-body
        $(FormatWikiEntityListPanel()).appendTo(connectPanel.children(".list"));
        //entity list
        for (i = 0; i < result.Item2.length; i++) {
            $(FormatWikiEntityItem(result.Item2[i], result.Item1)).appendTo(connectPanel.children(".list").children(".en-body"));
        }
        //en-next
        $(FormatWikiEntityListNext()).appendTo(connectPanel.children(".list").children(".en-body"));

        //bind entity click
        connectPanel.children(".list").children(".en-body").children(".en").click(function () {
            var tokenStr = $.trim($('#editTokenInvisibleContainer').text());
            var ehashStr = $(this).attr('ehash');
            var eid = $(this).attr('eid');

            var thisItem = this;

            //update
            jQuery.post("handles/edit.ashx", { func: 'map.wiki.entity', token: tokenStr, entityId: eid, hash: ehashStr }, function (result) {
                if (null == result) return;
                var newHash = result;

                //set name, photo, label
                $(".main[ehash='" + ehashStr + "']").siblings(".photo").children("IMG").attr("src", "portrait.aspx?id=" + eid);
                $(".main[ehash='" + ehashStr + "'] .info .name").html($(thisItem).children(".detail").children(".name").text());
                $(".main[ehash='" + ehashStr + "'] .info .label").html($(thisItem).children(".detail").children(".label").text());

                //update relation hash
                if (newHash != ehashStr) {
                    $(".main[ehash='" + ehashStr + "']").parent().children(".photo").unbind('click');
                    $(".main[ehash='" + ehashStr + "']").attr("ehash", newHash);
                }

                //close
                ResetAllWikiOprPanel();
            }, "text/plain");
        });

        var allEntites = connectPanel.children(".list").children(".en-body").children(".en");
        //hide prev
        connectPanel.children(".list").children(".en-prev").hide();
        //hide next
        if (allEntites.length < 4) {
            connectPanel.children(".list").children(".en-body").children(".en-next").hide();
        }
        for (i = 3; i < allEntites.length; i++) allEntites.eq(i).hide();
        //bind page up
        connectPanel.children(".list").children(".en-prev").children("A").click(function () {
            var connectPanel = $(this).parents(".main").children(".connect");
            //verify
            if (connectPanel.length == 0) return;

            var allEntites = connectPanel.children(".list").children(".en-body").children(".en");
            //verify
            if (allEntites.length == 0) return;

            var firstVisible = 0;
            //find first visible entity
            for (i = 0; i < allEntites.length; i++) {
                if (allEntites.eq(i).is(":visible")) {
                    firstVisible = i;
                    break;
                }
            }
            //hide all entity
            for (i = 0; i < allEntites.length; i++) allEntites.eq(i).hide();
            connectPanel.children(".list").children(".en-prev").hide();
            connectPanel.children(".list").children(".en-body").children(".en-next").hide();
            //prev page
            firstVisible = firstVisible >= 3 ? (firstVisible - 3) : 0;
            //set visible
            for (i = firstVisible; i < allEntites.length && i < firstVisible + 3; i++) allEntites.eq(i).show();
            if (firstVisible > 0) connectPanel.children(".list").children(".en-prev").show();
            if (firstVisible + 3 < allEntites.length) connectPanel.children(".list").children(".en-body").children(".en-next").show();
        });
        //bind page down
        connectPanel.children(".list").children(".en-body").children(".en-next").children("A").click(function () {
            var connectPanel = $(this).parents(".main").children(".connect");
            //verify
            if (connectPanel.length == 0) return;

            var allEntites = connectPanel.children(".list").children(".en-body").children(".en");
            //verify
            if (allEntites.length == 0) return;

            var firstVisible = 0;
            //find first visible entity
            for (i = 0; i < allEntites.length; i++) {
                if (allEntites.eq(i).is(":visible")) {
                    firstVisible = i;
                    break;
                }
            }
            //hide all entity
            for (i = 0; i < allEntites.length; i++) allEntites.eq(i).hide();
            connectPanel.children(".list").children(".en-prev").hide();
            connectPanel.children(".list").children(".en-body").children(".en-next").hide();
            //next page
            firstVisible = firstVisible + 3 < allEntites.length ? (firstVisible + 3) : 0;
            //set visible
            for (i = firstVisible; i < allEntites.length && i < firstVisible + 3; i++) allEntites.eq(i).show();
            if (firstVisible > 0) connectPanel.children(".list").children(".en-prev").show();
            if (firstVisible + 3 < allEntites.length) connectPanel.children(".list").children(".en-body").children(".en-next").show();
        });
    }, "json");    
}

function OnMappingWiki(a) {
    var ehashStr = $(a).parents(".main").attr('ehash');
    OnMappingWikiEHash(ehashStr);
}

function bindClickoutTextBox() {
    $(".clickouttextbox").live('focus', function () {
        if ($(this).val() == gRelationTextInputInit) {
            $(this).val("");
            $(this).css("color", "#000000");
        }
    });

    $(".clickouttextbox").live('blur', function () {
        if ($(this).val() == "") {
            $(this).val(gRelationTextInputInit);
            $(this).css("color", "#AAAAAA");
        }
    });
}