
var lkWeb = {};

lkWeb.GoAction = function (ctrl, action, values) {
    var curWwwPath = window.document.location.href;
    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8083
    var localhostPath = curWwwPath.substring(0, pos);
    window.location.href = localhostPath + "/admin/" + ctrl + "/" + action + "/" + values;
}

//删除多个
lkWeb.DeleteMulti = function (ids, model, table) {
    if (confirm('确认删除?')) {
        $.ajax(
            {
                type: 'post',
                url: '/Admin/' + model + '/DeleteMulti',
                data: {
                    ids: ids
                },
                success: function (result) {
                    if (result.flag == true) {
                        alert("删除多个成功")
                        table.fnReloadAjax(table.fnSettings()); //刷新datatable
                    }
                    else {
                        alert("删除多个失败");
                    }
                },
                error: function (err) {
                    console.log(err);
                }
            })
    }
}

//删除单个
lkWeb.Delete = function (id, model, table) {

    if (confirm('确认删除?')) {
        $.ajax(
            {
                type: 'post',
                url: '/Admin/' + model + '/Delete',
                data: {
                    id: id
                },
                success: function (result) {
                    if (result.flag == true) {
                        alert("删除成功")
                        table.fnReloadAjax(table.fnSettings()); //刷新datatable
                    }
                    else {
                        alert("删除失败");
                    }
                },
                error: function (err) {
                    console.log(err);
                }
            })
    }


}

//add this plug in
//you can call the below function to reload the table with current state
//Datatables刷新方法
//oTable.fnReloadAjax(oTable.fnSettings());
$.fn.dataTableExt.oApi.fnReloadAjax = function (oSettings) {
    //oSettings.sAjaxSource = sNewSource;
    this.fnClearTable(this);
    this.oApi._fnProcessingDisplay(oSettings, true);
    var that = this;

    $.getJSON(oSettings.sAjaxSource, null, function (json) {
        /* Got the data - add it to the table */
        for (var i = 0; i < json.aaData.length; i++) {
            that.oApi._fnAddData(oSettings, json.aaData[i]);
        }
        oSettings.aiDisplay = oSettings.aiDisplayMaster.slice();
        that.fnDraw(that);
        that.oApi._fnProcessingDisplay(oSettings, false);
    });
}

//两种调用方式
//var template1 = "我是{0}，今年{1}了";
//var template2 = "我是{name}，今年{age}了";
//var result1 = template1.format("loogn", 22);
//var result2 = template2.format({ name: "loogn", age: 22 });
String.prototype.format = function (args) {
    var result = this;
    if (arguments.length > 0) {
        if (arguments.length == 1 && typeof (args) == "object") {
            for (var key in args) {
                if (args[key] != undefined) {
                    var reg = new RegExp("({" + key + "})", "g");
                    result = result.replace(reg, args[key]);
                }
            }
        }
        else {
            for (var i = 0; i < arguments.length; i++) {
                if (arguments[i] != undefined) {
                    var reg = new RegExp("({)" + i + "(})", "g");
                    result = result.replace(reg, arguments[i]);
                }
            }
        }
    }
    return result;
}