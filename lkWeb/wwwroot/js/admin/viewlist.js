
$(function () {

    if ($("#lkForm").length != 0)
        lkWeb.FormValidation($("#lkForm"), function () {
            lkWeb.RefreshAndClose();
        });

    $('.select').select2({
        placeholder: '请选择',
        allowClear: true,
        dropdownParent: $("body")
    }
    );
    $('.select').on("select2:select", function (e) {
        log(e)
        // $(e.target).select2("close");
    });
    //验证无效
    $(".select").on("select2:close", function (e) {
        log('close')
        $(this).valid();
        return false;
    });

    $(".datetimepicker").each(function (i, n) {
        var dateFormat = $(n).attr("data-date-format");
        if (IsEmpty(dateFormat)) //未设置日期格式的 默认为此格式
            $(n).attr("data-date-format","yyyy-mm-dd hh:ii");
        if (dateFormat.indexOf('ii') > 0)
            minView = 0;
        else if (dateFormat.indexOf('hh') > 0)
            minView = 1;
        else
            minView = 2;
        $(n).datetimepicker({
            autoclose: true,
            todayBtn: true,
            language: 'zh-CN',
            pickerPosition: "bottom-left",
            todayHighlight: true,
            minView: minView //0到分钟 1到小时 2及以上到日
        });
    });
})
function uploadFile(url, fileInputId, inputId, columnId) {
    lkWeb.Upload(fileInputId, url, { 'id': columnId }, function (result) {
        $("#" + inputId).val(result.data)
    })
}