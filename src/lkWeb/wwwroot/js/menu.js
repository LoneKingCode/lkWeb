$(function () {
    //角色主页 确定操作
    $("#btnOperate").click(function () {
        var select = $("#sltOperate");
        var selectVal = select.val();
        if (selectVal == "delete") {
            var menuIDs = "";
            $(":checkbox:checked", "#table_menu").each(function (i, n) {
                if ($(n).attr("class") == "checkAll") return true;//相当于continue
                menuIDs += $(n).val() + ",";
            })

            menuIDs = menuIDs.substr(0, menuIDs.length - 1);
            DeleteMenus(menuIDs);
        }

    })
    //角色主页 增加角色
    $("#btnGoToAddMenu").click(function () {
        lkWeb.GoAction("menu", "add", 0);
    })
})

//增加角色
function AddMenu() {
    var option = {
        datatype: "json",
        success: function (data) {
            if (data.flag == true) {
                alert("增加成功");
                lkWeb.GoAction("menu", "index", 0);
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
    $("#form-addMenu").ajaxSubmit(option);
}
//删除多个角色
function DeleteMenus(menuIDs) {
    if (confirm('确认删除?')) {
        $.ajax(
            {
                type: 'post',
                url: '/Admin/Menu/DeleteMulti',
                data: {
                    MenuIDs: menuIDs
                },
                success: function (result) {
                    if (result.flag == true) {
                        alert("删除多个成功")
                        table_menu.fnReloadAjax(table_menu.fnSettings()); //刷新datatable
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
//删除角色
function DeleteMenu(menuID) {
    if (confirm('确认删除?')) {
        $.ajax(
            {
                type: 'post',
                url: '/Admin/Menu/Delete',
                data: {
                    MenuID: menuID
                },
                success: function (result) {
                    if (result.flag == true) {
                        alert("删除成功")
                        table_menu.fnReloadAjax(table_menu.fnSettings()); //刷新datatable
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

//跳转到编辑角色页面
function GoToEditMenu(menuID) {
    lkWeb.GoAction("menu", "edit", menuID);
}

//编辑角色
function EditMenu() {
    var option = {
        datatype: "json",
        success: function (data) {
            if (data.flag == true) {
                alert("保存成功");
                lkWeb.GoAction("menu", "index", 0);
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
    $("#form-editMenu").ajaxSubmit(option);
}