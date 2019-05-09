

$(function () {

    $("#btnConfirm").click(function () {
        var hasError = false;
        $("input[type='file']").each(function (i, n) {
            var minimum = $(n).attr("data-minimum");
            var filelist = $(n).siblings(".file-list");
            log(minimum, filelist)
            if (IsNotEmpty(minimum)) {
                if (filelist.children('.file-item').length < minimum) {
                    showMsg('最少上传' + minimum + '个', 'warning');
                    hasError = true;
                }
            }
        })

        if (!hasError) {
            $("#btnSubmit").click();
        }
    })
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

    imageViewer();

    $(".file-list").on("click", ".file-delete", function () {
        var ctrl = $(this)
        showConfirm('确认删除？', function () {
            var fileIdInput = ctrl.parent().parent().siblings('.file-ids');
            var fileIds = fileIdInput.val();
            var delFileId = ctrl.attr("data-file");
            if (IsNotEmpty(fileIds)) {
                var fileIdArr = fileIds.split(",")
                for (var i = 0; i < fileIdArr.length; i++) {
                    if (fileIdArr[i] == delFileId) {
                        fileIdArr.splice(i, 1);
                        break;
                    }
                }
                fileIdInput.val(unique(fileIdArr).join(','));
                log(ctrl.parent().parent().siblings("input[type='file']").first().attr('data-type'))
                if (ctrl.parent().parent().siblings("input[type='file']").first().attr('data-type') == "images") {
                    ctrl.parent().remove();
                    imageViewer();
                }
                else
                    ctrl.parent().remove();

            }
            else {
                fileIdInput.val('');
            }
        });

    });


});

viewers = [];
function imageViewer() {
    for (var i = 0; i < viewers.length; i++) {
        viewers[i].destroy();
    }
    viewers = [];
    $(".images").each(function (i, n) {
        var id = $(n).attr('id');
        if (IsNotEmpty(id)) {
            var viewer = new Viewer(document.getElementById(id));
            viewers.push(viewer);
        }
    });
}

var fileItemTpl = '<div class="file-item" data-file="{2}">' +
    '<img src="/images/file_icon/icon_file/{0}.png" />' +
    '<label>{1}</label>' +
    '<a href="{2}" download>查看</a>&nbsp; <span class="file-delete" data-file="{2}">删除</span></div>';
var imgItemTpl = '<div class="file-item" data-file="{2}">' +
    '<img src="/images/file_icon/icon_file/{0}.png" />' +
    '<label>{1}</label>' +
    '<a href="{2}" target="_blank">查看</a>&nbsp;<span class="file-delete" data-file="{2}">删除</span></div>';
function uploadFile(ctrl, url, columnId) {
    var maximum = $(ctrl).attr("data-maximum");
    var filelist = $(ctrl).siblings(".file-list");
    if (IsEmpty(maximum))
        maximum = 1;
    if (filelist.children('.file-item').length >= maximum) {
        showMsg('最多上传' + maximum + '个', 'warning');
        return;
    }
    lkWeb.Upload($(ctrl).attr('id'), url, { 'id': columnId }, function (result) {

        var itemTpl = fileItemTpl;
        var isImage = $(ctrl).attr('data-type') == 'images';
        if (isImage) {
            itemTpl = imgItemTpl;
        }
        var fileId = result.data.fileUrl;
        var fileType = result.data.fileType;
        var fileName = result.data.fileName;
        var fileItemHtml = itemTpl.format(fileType, fileName, fileId);
        filelist.append(fileItemHtml);

        var fileIdInput = $(ctrl).siblings('.file-ids');
        var fileIds = fileIdInput.val();
        if (IsNotEmpty(fileIds)) {
            var fileIdArr = fileIds.split(",");
            fileIdArr.push(fileId);
            fileIdInput.val(unique(fileIdArr).join(','));
        }
        else {
            fileIdInput.val(fileId);
        }
        if (isImage)
            imageViewer();

    });
}