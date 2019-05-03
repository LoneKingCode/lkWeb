$(function () {

})

var lkWeb = {};

lkWeb.LayerIndex = 0;

lkWeb.GoAction = function (area, ctrl, action, values, isOpen, title, width, height) {
    var curWwwPath = window.document.location.href;
    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8083
    var localhostPath = curWwwPath.substring(0, pos);
    var url = "";
    if (IsNotEmpty(values))
        url = localhostPath + "/" + area + "/" + ctrl + "/" + action + "/" + values;
    else
        url = localhostPath + "/" + area + "/" + ctrl + "/" + action;
    if (isOpen == true) {
        lkWeb.LayerIndex = layer.open({
            type: 2,
            title: title,
            shadeClose: true,
            shade: 0.8,
            area: [width, height],
            content: url
        });
    }
    else
        window.location.href = url;
}

lkWeb.OpenLayer = function (url, title, width, height) {
    lkWeb.LayerIndex = layer.open({
        type: 2,
        title: title,
        shadeClose: true,
        shade: 0.8,
        area: [width, height],
        content: url
    });
}
lkWeb.CloseLayer = function () {
    layer.close(lkWeb.LayerIndex);
    //    var index = parent.layer.getFrameIndex(window.name);
}
//主要用在 添加/编辑页面
lkWeb.RefreshAndClose = function () {
    if (parent.lkTable)
        parent.lkTable.draw(false);
    parent.lkWeb.CloseLayer();
}
lkWeb.Reload = function () {
    parent.window.location.reload();
}
lkWeb.Close = function () {
    parent.lkWeb.CloseLayer();

}
lkWeb.GetCsrfToken = function () {
    return $("input[name='__RequestVerificationToken']").val();
}

//删除多个
lkWeb.DeleteMulti = function (area, ids, ctrl, table, value) {
    if (ids.length < 1) {
        parent.layer.alert("请选择要删除的数据");
        return;
    }
    parent.layer.confirm("确认删除" + ids.length + "条数据？", {
        btn: ["确认", "取消"]
    }, function () {
        var postUrl = '/' + area + '/' + ctrl + '/Delete';
        var _value = "";
        if (IsNotEmpty(value))
            _value = value;
        $.ajax(
            {
                type: 'post',
                url: postUrl,
                data: {
                    ids: ids,
                    extraValue: _value,
                    __RequestVerificationToken: lkWeb.GetCsrfToken()
                },
                success: function (result) {
                    if (result.flag == true) {
                        if (IsNotEmpty(result.msg))
                            parent.layer.alert(result.msg)
                        else
                            parent.layer.alert("删除成功")
                        if (IsNotEmpty(table))
                            table.draw(false);//刷新datatable
                        else {
                            window.location.reload();
                        }
                    }
                    else {
                        if (IsNotEmpty(result.msg))
                            parent.layer.alert(result.msg);
                        else
                            parent.layer.alert("删除失败");
                    }
                },
                error: function (err) {
                    console.log(err);
                    parent.layer.alert("删除失败");
                }
            })
    }, function () {

    }
    )
}

//删除单个
lkWeb.Delete = function (area, id, ctrl, table, value) {
    parent.layer.confirm("确认删除？", {
        btn: ["确认", "取消"]
    },
        function () {
            var postUrl = '/' + area + '/' + ctrl + '/Delete';
            var _value = "";
            if (IsNotEmpty(value))
                _value = value;
            $.ajax(
                {
                    type: 'post',
                    url: postUrl,
                    data: {
                        id: id,
                        value: _value,
                        __RequestVerificationToken: lkWeb.GetCsrfToken()
                    },
                    success: function (result) {
                        if (result.flag == true) {
                            parent.layer.alert("删除成功")
                            if (table != null && table != undefined)
                                table.draw(false);//刷新datatable
                            else
                                window.location.reload();
                        }
                        else {
                            if (IsNotEmpty(result.msg))
                                parent.layer.alert("操作失败," + result.msg);
                            else
                                parent.layer.alert("删除失败");
                        }
                    },
                    error: function (err) {
                        parent.layer.alert("删除失败");
                        console.log(err);
                    }
                })
        }, function () {

        }
    )
}

lkWeb.AjaxPost = function (url, data, successCallBack, errorCallBack, table) {
    data.__RequestVerificationToken = lkWeb.GetCsrfToken()
    $.ajax(
        {
            type: 'post',
            url: url,
            data: data,
            success: function (result) {
                if (result.flag == true) {
                    if (IsFunction(successCallBack))
                        successCallBack(result);
                    else
                        if (IsNotEmpty(result.msg))
                            parent.layer.alert(result.msg);
                        else
                            parent.layer.alert("操作成功");
                }
                else {
                    if (IsNotEmpty(result.msg))
                        parent.layer.alert("操作失败," + result.msg);
                    else
                        parent.layer.alert("操作失败");
                }
            },
            error: function (err) {

                if (IsFunction(errorCallBack))
                    errorCallBack(err);
                else
                    parent.layer.alert("操作失败");
                console.log(err);
            }
        })
}
lkWeb.AjaxGet = function () {

}

lkWeb.Upload = function (controlId, url, formParams, successCallback, errorCallback) {
    var fileObj = document.getElementById(controlId).files[0]; // js 获取文件对象
    if (typeof (fileObj) == "undefined" || fileObj.size <= 0) {
        alert("请选择文件");
        return;
    }
    var formFile = new FormData();
    formFile.append("file", fileObj); //加入文件对象
    formFile.append("__RequestVerificationToken", lkWeb.GetCsrfToken());
    for (var key in formParams) {
        formFile.append(key, formParams[key])
    }
    lkWeb.ShowLoad()
    var data = formFile;
    $.ajax({
        url: url,
        data: data,
        type: "Post",
        dataType: "json",
        async: true,
        cache: false,//上传文件无需缓存
        processData: false,//用于对data参数进行序列化处理 这里必须false
        contentType: false, //必须
        success: function (result) {
            if (result.flag == true) {
                if (IsFunction(successCallback))
                    successCallback(result)
                else
                    parent.layer('操作成功')
            }
            else {
                if (IsFunction(errorCallback))
                    errorCallback(result)
                else {
                    if (IsNotEmpty(result.msg))
                        parent.layer.alert(result.msg);
                    else
                        parent.layer.alert("操作失败")
                }
            }
            lkWeb.CloseLoad()
        },
        error: function (err) {
            if (IsFunction(errorCallback))
                errorCallback(result)
            else
                parent.layer.alert("请求失败");
            lkWeb.CloseLoad()
        }
    })
}
//form validation
lkWeb.FormValidation = function (validationForm, successCallBack, successMsg) {
    validationForm.data("validator").settings.ignore = ""; //validate默认对隐藏的元素是不进行校验的，所以忽略了select框的校验
    validationForm.data("validator").settings.focusInvalid = true;
    log(validationForm.data("validator").settings.ignore)
    var option = {
        datatype: "json",
        success: function (data) {
            if (data.flag == true) {
                if (IsNotEmpty(successMsg))
                    layer.alert(successMsg);
                else if (IsNotEmpty(data.msg))
                    layer.alert(data.msg);
                setTimeout(function () {
                    if (IsFunction(successCallBack))
                        successCallBack();
                }, 1200)
            }
            else {
                layer.alert('操作失败,' + data.msg);
            }
        },
        error: function (error) {
            layer.alert("提交请求失败");
            // console.log(error);
        }
    };
    // jQuery Unobtrusive Validation 只能这样设置才有效
    validationForm.data("validator").settings.submitHandler = function (form) {
        $(form).ajaxSubmit(option);
        return false;
    };
}

//Layer
var layerIndex = -1;
lkWeb.ShowLoad = function () {
    layerIndex = layer.load(1, {
        shade: [0.1, '#fff'] //0.1透明度的白色背景
    });
}
lkWeb.CloseLoad = function () {
    layer.close(layerIndex);
}

lkWeb.Confirm = function (msg, successCallBack, cancelCallBack) {
    var _layer = IsNotEmpty(parent.layer) ? parent.layer : layer
    _layer.confirm(msg, {
        btn: ["确认", "取消"]
    },
        function () {
            if (IsFunction(successCallBack))
                successCallBack();
        }, function () {
            if (IsFunction(cancelCallBack))
                cancelCallBack();
        }
    )
}

//Datatable
lkWeb.Search = function (searchKey, table) {
    _searchKey = searchKey;
    table.search(_searchKey).draw(); //！！！！！！！！！！！搜索暂时无效 很无奈！！！ 只能先这样代替了
}
var _searchKey = "";
var _value = "";
//tableID:控件ID，columns:列集合，dataUrl:获取数据的URL，value:补充的值给后台(QueryBase)用
lkWeb.LoadTable = function (tableID, colums, dataUrl, value) {
    _value = value;
    var config = {
        "processing": true, //载入数据的时候是否显示“载入中”
        "bInfo": true, //是否显示是否启用底边信息栏
        "ajax": {
            url: dataUrl,
            type: "post",
            data: function (d) {
                var param = {}; //d是原始的数据 不过太长了，只取需要的数据出来
                param.start = d.start;//开始的数据位置
                param.length = d.length;//获取的数据长度
                //取得排序的字段
                if (d.columns && d.order && d.order.length > 0) {
                    var orderBy = d.columns[d.order[0].column].name;
                    var orderDir = d.order[0].dir;
                    param.orderBy = orderBy;
                    param.orderDir = orderDir; //asc or desc
                }
                param.searchKey = _searchKey;
                param.value = _value;
                param.__RequestVerificationToken = lkWeb.GetCsrfToken()
                return param;
            }

        },
        "searching": false,
        "serverSide": true, //启用服务器端分页
        'autoWidth': true,
        "sPaginationType": "full_numbers",
        "oLanguage": {
            "sProcessing": "请求数据中......",
            "sLengthMenu": "每页显示 _MENU_ 条记录",
            "sZeroRecords": "抱歉， 没有找到",
            "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
            "sInfoEmpty": "没有数据",
            "sInfoFiltered": "(从 _MAX_ 条数据中检索)",
            "sSearch": "搜索",
            "oPaginate": {
                "sFirst": "<span class=\"glyphicon glyphicon-step-backward\"></span>",
                "sPrevious": "<span class=\"glyphicon glyphicon-backward\"></span>",
                "sNext": "<span class=\"glyphicon glyphicon-forward\"></span>",
                "sLast": "<span class=\"glyphicon glyphicon-step-forward\"></span>"
            }
        },
        "sZeroRecords": "没有检索到数据",
        "retrieve": true,
        "paging": true,
        "ordering": true,
        "info": true,
        "aoColumns": colums,
        "destroy": true,
        "order": [],
        "fnInitComplete": function (oSettings, json) {
            //为每个td设置title属性 有的内容过长 省略号隐藏了 
            //这样的话鼠标放上面可以显示全部
            $("#" + tableID + " tbody td").each(function (i, n) {
                $(n).attr("title", $(n).text());
            });
        }
    };
    var table = $("#" + tableID).DataTable(config);

    return table;
}


//获取checkbox集合选中的 第一个的value值
lkWeb.GetCheckValue = function (chkList) {
    var checkValue = "";
    chkList.each(function (i, n) {
        if ($(n).prop("checked")) {
            checkValue = $(n).val();
            return false; //break
        }

    })
    return checkValue;
}

lkWeb.GetCheckValueList = function (chkList) {
    var values = [];
    chkList.each(function (i, n) {
        if ($(n).prop("checked")) {
            values.push($(n).val());
        }
    })
    return values;
}

lkWeb.GetCurrentUrl = function () {
    return window.location.protocol + "://" + window.location.host;
}


