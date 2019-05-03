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
    //选择日期
    $('.datepicker-date').datePicker({
        hasShortcut: true,
        format: 'YYYY-MM-DD',
        shortcutOptions: [{
            name: '今天',
            day: '0'
        }, {
            name: '昨天',
            day: '-1'
        }, {
            name: '一周前',
            day: '-7'
        }]
    });
    //选择日期时间
    $('.datepicker-datetime').datePicker({
        format: 'YYYY-MM-DD HH:mm'
    });
})
function uploadFile(url, fileInputId, inputId, columnId) {
    lkWeb.Upload(fileInputId, url, { 'id': columnId }, function (result) {
        $("#" + inputId).val(result.data)
    })
}