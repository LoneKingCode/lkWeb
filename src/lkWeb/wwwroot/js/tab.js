$(function () {
    var lastTabClick = null;
    $(".L_menuTab").click(function () {
        $("#content-main > iframe").each(function (i, n) {
            var obj = $(n);
           
        })
    })

    var flag = false;
    $(".L_menuItem").click(function () {
        var template = "<a href=\"javascript:;\" class=\"L_menuTab active\" data-id=\"{0}\">{1}<\/a>";
        var dataUrl = $(this).attr("data-url");
        $(".page-tabs-content > a").each(function (i, n) {
            var tab = $(n);
            var dataId = tab.attr("data-id");
            if (dataUrl == dataId) {
                ClearTabActive();
                tab.removeClass("active").addClass("active");
                flag = true;
                return; //跳出each
            }
        });
        if (flag) {
            flag = false;
            return;
        }
        var tabHtml = template.format(dataUrl, $(this).html());
        ClearTabActive();
        $(".page-tabs-content").append(tabHtml);
    })

    function ClearTabActive() {
        $(".page-tabs-content").children().each(function (i, n) {
            var tab = $(n);
            tab.removeClass("active");
        });
    }
    function AddIframe(dataId) {
        var template = "<iframe id=\"{0}\" data-id=\"{1}\" style=\"width: calc(100 %); height: calc(100 %); border: 0; margin: 0; padding: 0; min - height: 400px; overflow - y:scroll\" src=\"{2}\"></iframe>";


    }
    function HiddenAllFrame() {
        $("#content-main > iframe").each(function (i, n) {
            var obj = $(n);
            obj.removeClass("Hidden").addclass("Hidden");
        })
    }

})