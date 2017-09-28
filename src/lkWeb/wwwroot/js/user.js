$(function () {
    //用户主页 确定操作
    $("#btnOperate").click(function () {
        var select = $("#sltOperate");
        var selectVal = select.val();
        if (selectVal == "delete") {
            var userIds = "";
            $(":checkbox:checked", "#table_user").each(function (i, n) {
                if ($(n).attr("class") == "checkAll") return true;//相当于continue
                userIds += $(n).val() + ",";
            })

            userIds = userIds.substr(0, userIds.length - 1);
            DeleteUsers(userIds);
        }
        else if (selectVal == "disable") {
            alert("disable");
        }

    })
    //用户主页 增加用户
    $("#btnGoToAddUser").click(function () {
        lkWeb.GoAction("user", "add", 0);
    })


})

//编辑用户 保存信息
function ModifyUser() {
    if ($("#txtNewPwdAgain").val() != $("#txtNewPwd").val()) {
        alert("两次输入的密码不相同");
        return;
    }
    var option = {
        datatype: "json",
        success: function (data) {
            if (data.flag == true) {
                alert("保存成功");
                lkWeb.GoAction("user", "index", 0);
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

//删除多个用户
function DeleteUsers(userIDs) {
    if (confirm('确认删除?')) {
        $.ajax(
            {
                type: 'post',
                url: '/Admin/User/DeleteMulti',
                data: {
                    UserIDs: userIDs
                },
                success: function (result) {
                    if (result.flag == true) {
                        alert("删除多个成功")
                        table_user.fnReloadAjax(table_user.fnSettings()); //刷新datatable
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

//删除单个用户
function DeleteUser(userID) {
    if (confirm('确认删除?')) {
        $.ajax(
            {
                type: 'post',
                url: '/Admin/User/Delete',
                data: {
                    UserID: userID
                },
                success: function (result) {
                    if (result.flag == true) {
                        alert("删除成功")
                        table_user.fnReloadAjax(table_user.fnSettings()); //刷新datatable
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

//修改用户
function GoToEditUser(userID) {
    lkWeb.GoAction("user", "edit", userID);
}

//增加用户
function AddUser() {
    if ($("#txtPwdAgain").val() != $("#txtPwd").val()) {
        alert("两次输入的密码不相同");
        return;
    }
    var option = {
        datatype: "json",
        success: function (data) {
            if (data.flag == true) {
                alert("增加成功");
                lkWeb.GoAction("user", "index", 0);
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
    $("#form-addUser").ajaxSubmit(option);
}