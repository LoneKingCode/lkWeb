
var lkWeb = {};

lkWeb.GoAction = function () {

}

lkWeb.DeleteUser = function (userID) {
    $.ajax(
        {
            type: 'post',
            url: '/Admin/User/Delete',
            data: {
                UserID: userID
            },
            success: function (result) {
                if (result.flag == true)
                {
                    alert("删除成功")                     
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

lkWeb.EditUser = function () {
    var option = {
        datatype: "json",
        success: function (data) {
            if (data.flag == true) {
                alert("保存成功");
            }
            else {
                alert(data.msg);
            }
        },
        error: function (error) {
            alert('提交请求失败');
            console.log(error);
        }
    };
    $("#form-editUser").ajaxSubmit(option);
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