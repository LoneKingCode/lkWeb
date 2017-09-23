$(function () {
    $("#btnOperate").click(function () {
        var select = $("#sltOperate");
        var selectVal = select.val();
        if (selectVal == "delete") {
            var userIds="";
            $(":checkbox:checked", "#table_user").each(function (i, n) {
                if ($(n).attr("class") == "checkAll") return true;//相当于continue
                userIds += $(n).val() + ",";
            })
           
            userIds = userIds.substr(0, userIds.length - 1);
            lkWeb.DeleteUsers(userIds);
        }
        else if (selectVal == "disable") {
            alert("disable");
        }

    })
})