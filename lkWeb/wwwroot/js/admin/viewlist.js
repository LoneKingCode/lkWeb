
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
            $(n).attr("data-date-format", "yyyy-mm-dd hh:ii");
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


    //上传文件相关
    $(".images").each(function (i, n) {
        var id = $(n).attr('id');
        if (IsNotEmpty(id))
            var viewer = new Viewer(document.getElementById(id));
    });

    $(".file-list").on("click", ".file-delete", function () {
        log('del')
        var fileIdInput = $(this).parent().parent().siblings('.file-ids');
        var fileIds = fileIdInput.val();
        var delFileId = $(this).attr("data-file");
        if (IsNotEmpty(fileIds)) {
            var fileIdArr = fileIds.split(",")
            for (var i = 0; i < fileIdArr.length; i++) {
                if (fileIdArr[i] == delFileId) {
                    fileIdArr.splice(i, 1);
                    break;
                }
            }
            fileIdInput.val(unique(fileIdArr).join(','));
            $(this).parent().remove();
        }
        else {
            fileIdInput.val('');
        }
    });

    $(".file-upload").click(function () {
        var fileItemTpl = '<div class="file-item" data-file="{3}">' +
            '<img src="~/images/file_icon/icon_file/{0}.png" />' +
            '<label>{1}</label>' +
            '<a href="{2}" download>查看</a> <span class="file-delete" data-file="{3}">删除</span></div>';
        var maximum = $(this).attr("data-maximum");
        var filelist = $(this).siblings(".file-list");
        log('length', filelist.children('.file-item').length)
        if (filelist.children('.file-item').length >= maximum) {
            showMsg('最多上传' + maximum + '个', 'warning');
            return;
        }
        else {
            var fileId = 'aaa/aa/aa' + Math.round(Math.random() * 100);
            var fileType = 'rar';
            var fileName = '测试添加噢';
            var fileItemHtml = fileItemTpl.format(fileType, fileName, fileId, fileId);
            filelist.append(fileItemHtml);

            var fileIdInput = $(this).parent().parent().siblings('.file-ids');
            var fileIds = fileIdInput.val();
            if (IsNotEmpty(fileIds)) {
                var fileIdArr = fileIds.split(",");
                fileIdArr.push(fileId);
                fileIdInput.val(unique(fileIdArr).join(','));
            }
            else {
                fileIdInput.val(fileId);
            }
        }
    })
});

function uploadFile(url, fileInputId, inputId, columnId) {
    lkWeb.Upload(fileInputId, url, { 'id': columnId }, function (result) {
        $("#" + inputId).val(result.data)
    })
}