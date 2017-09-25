$(function () {
    //角色主页 确定操作
    $("#btnOperate").click(function () {
        var select = $("#sltOperate");
        var selectVal = select.val();
        if (selectVal == "delete") {
            var roleIDs = "";
            $(":checkbox:checked", "#table_role").each(function (i, n) {
                if ($(n).attr("class") == "checkAll") return true;//相当于continue
                roleIDs += $(n).val() + ",";
            })

            roleIDs = roleIDs.substr(0, roleIDs.length - 1);
            DeleteRoles(roleIDs);
        }

    })
    //角色主页 增加角色
    $("#btnGoToAddRole").click(function () {
        lkWeb.GoAction("role", "add", 0);
     })
})

//增加角色
function AddRole() {
    var option = {
        datatype: "json",
        success: function (data) {
            if (data.flag == true) {
                alert("增加成功");
                lkWeb.GoAction("role", "index", 0);
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
    $("#form-addRole").ajaxSubmit(option);
}
//删除多个角色
function DeleteRoles(roleIDs) {
    $.ajax(
        {
            type: 'post',
            url: '/Admin/Role/DeleteMulti',
            data: {
                roleIDs: roleIDs
            },
            success: function (result) {
                if (result.flag == true) {
                    alert("删除多个成功")
                    table_role.fnReloadAjax(table_role.fnSettings()); //刷新datatable
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
//删除角色
function DeleteRole(roleID) {
    $.ajax(
        {
            type: 'post',
            url: '/Admin/Role/Delete',
            data: {
                UserID: userID
            },
            success: function (result) {
                if (result.flag == true) {
                    alert("删除成功")
                    table_role.fnReloadAjax(table_role.fnSettings()); //刷新datatable
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

//跳转到编辑角色页面
function GoToEditRole(roleID) {
    lkWeb.GoAction("role", "edit", roleID);
}

//编辑角色
function EditRole() {
    var option = {
        datatype: "json",
        success: function (data) {
            if (data.flag == true) {
                alert("保存成功");
                lkWeb.GoAction("role", "index", 0);
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
    $("#form-editRole").ajaxSubmit(option);
}