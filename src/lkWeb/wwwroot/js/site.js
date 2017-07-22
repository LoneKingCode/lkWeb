$(function () {
    //绑定菜单点击时 打开到frame内
    var frm = $("#frmBody");
    var menu = $("#lkMenu");
    menu.find("a").each(function () {
        $(this).click(function () {

            var url = $(this).attr("data-url");
            var text = $(this).text();

            if (url != "#") {
                //显示loading提示
                var loading = layer.load(2);
                frm.load(function () {
                    //iframe加载完成后隐藏loading提示
                    layer.close(loading);
                });
                frm.attr("src", url);
            }
        }
        )
    })
})