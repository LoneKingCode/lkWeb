var mapp = mapp || {};
$(function () {
    //计算元素集合的总宽度
    function calSumWidth(elements) {
        var width = 0;
        $(elements).each(function () {
            width += $(this).outerWidth(true);
        });
        return width;
    }
    //滚动到指定选项卡
    function scrollToTab(element) {
        var marginLeftVal = calSumWidth($(element).prevAll()), marginRightVal = calSumWidth($(element).nextAll());
        // 可视区域非tab宽度
        var tabOuterWidth = calSumWidth($(".content-tabs").children().not(".J_menuTabs"));
        //可视区域tab宽度
        var visibleWidth = $(".content-tabs").outerWidth(true) - tabOuterWidth;
        //实际滚动宽度
        var scrollVal = 0;
        if ($(".page-tabs-content").outerWidth() < visibleWidth) {
            scrollVal = 0;
        } else if (marginRightVal <= (visibleWidth - $(element).outerWidth(true) - $(element).next().outerWidth(true))) {
            if ((visibleWidth - $(element).next().outerWidth(true)) > marginRightVal) {
                scrollVal = marginLeftVal;
                var tabElement = element;
                while ((scrollVal - $(tabElement).outerWidth()) > ($(".page-tabs-content").outerWidth() - visibleWidth)) {
                    scrollVal -= $(tabElement).prev().outerWidth();
                    tabElement = $(tabElement).prev();
                }
            }
        } else if (marginLeftVal > (visibleWidth - $(element).outerWidth(true) - $(element).prev().outerWidth(true))) {
            scrollVal = marginLeftVal - $(element).prev().outerWidth(true);
        }
        $('.page-tabs-content').animate({
            marginLeft: 0 - scrollVal + 'px'
        }, "fast");
    }
    //查看左侧隐藏的选项卡
    function scrollTabLeft() {
        var marginLeftVal = Math.abs(parseInt($('.page-tabs-content').css('margin-left')));
        // 可视区域非tab宽度
        var tabOuterWidth = calSumWidth($(".content-tabs").children().not(".J_menuTabs"));
        //可视区域tab宽度
        var visibleWidth = $(".content-tabs").outerWidth(true) - tabOuterWidth;
        //实际滚动宽度
        var scrollVal = 0;
        if ($(".page-tabs-content").width() < visibleWidth) {
            return false;
        } else {
            var tabElement = $(".J_menuTab:first");
            var offsetVal = 0;
            while ((offsetVal + $(tabElement).outerWidth(true)) <= marginLeftVal) {//找到离当前tab最近的元素
                offsetVal += $(tabElement).outerWidth(true);
                tabElement = $(tabElement).next();
            }
            offsetVal = 0;
            if (calSumWidth($(tabElement).prevAll()) > visibleWidth) {
                while ((offsetVal + $(tabElement).outerWidth(true)) < (visibleWidth) && tabElement.length > 0) {
                    offsetVal += $(tabElement).outerWidth(true);
                    tabElement = $(tabElement).prev();
                }
                scrollVal = calSumWidth($(tabElement).prevAll());
            }
        }
        $('.page-tabs-content').animate({
            marginLeft: 0 - scrollVal + 'px'
        }, "fast");
    }
    //查看右侧隐藏的选项卡
    function scrollTabRight() {
        var marginLeftVal = Math.abs(parseInt($('.page-tabs-content').css('margin-left')));
        // 可视区域非tab宽度
        var tabOuterWidth = calSumWidth($(".content-tabs").children().not(".J_menuTabs"));
        //可视区域tab宽度
        var visibleWidth = $(".content-tabs").outerWidth(true) - tabOuterWidth;
        //实际滚动宽度
        var scrollVal = 0;
        if ($(".page-tabs-content").width() < visibleWidth) {
            return false;
        } else {
            var tabElement = $(".J_menuTab:first");
            var offsetVal = 0;
            while ((offsetVal + $(tabElement).outerWidth(true)) <= marginLeftVal) {//找到离当前tab最近的元素
                offsetVal += $(tabElement).outerWidth(true);
                tabElement = $(tabElement).next();
            }
            offsetVal = 0;
            while ((offsetVal + $(tabElement).outerWidth(true)) < (visibleWidth) && tabElement.length > 0) {
                offsetVal += $(tabElement).outerWidth(true);
                tabElement = $(tabElement).next();
            }
            scrollVal = calSumWidth($(tabElement).prevAll());
            if (scrollVal > 0) {
                $('.page-tabs-content').animate({
                    marginLeft: 0 - scrollVal + 'px'
                }, "fast");
            }
        }
    }

    //通过遍历给菜单项加上data-index属性
    $(".J_menuItem").each(function (index) {
        if (!$(this).attr('data-index')) {
            $(this).attr('data-index', index);
        }
    });

    //定义全局变量，控制iframe的index
    Stabindex = 10000;
    function menuItem() {
        // 获取标识数据
        var dataUrl = $(this).attr('data-url'),
            dataIndex = $(this).data('index'),
            menuName = $.trim($(this).text()),
            flag = true;
        if (dataUrl == undefined || $.trim(dataUrl).length == 0) return false;

        // 选项卡菜单已存在
        $('.J_menuTab').each(function () {
            if ($(this).data('id') == dataUrl) {
                if (!$(this).hasClass('active')) {
                    $(this).addClass('active').siblings('.J_menuTab').removeClass('active');
                    // 显示tab对应的内容区
                    scrollToTab(this);


                    $('.J_mainContent .J_iframe').each(function () {
                        if ($(this).data('id') == dataUrl) {
                            var _this = $(this);
                            // 显示首页tab对应的内容区，并且刷新
                            _this.attr('src', dataUrl);
                            _this.on('load', function () {
                                _this.show().siblings('.J_iframe').hide();

                                //window.open怎么办?
                                var sifram = _this.contents().find('.S_menuItem');

                                sifram.on('click', SmenuItem);

                            })

                            return false;
                        }
                    });
                }
                flag = false;
                return false;
            } else {
                //因为是遍历，所以在url和id不相等的时候已经刷新了~上面的只要更换到内容区即可，第一个默认首页，所以一定会刷到
                $('.J_mainContent .J_iframe').each(function () {
                    if ($(this).data('id') == dataUrl) {
                        var _this = $(this);
                        // 刷新iframe内容
                        _this.attr('src', dataUrl);
                        _this.on('load', function () {
                            _this.show().siblings('.J_iframe').hide();
                            //window.open怎么办?
                            var sifram = _this.contents().find('.S_menuItem');

                            sifram.on('click', SmenuItem);
                        })

                        return false;
                    }
                });
            }
        });

        // 选项卡菜单不存在
        if (flag) {
            var str = '<a href="javascript:;" class="active J_menuTab" data-id="' + dataUrl + '">' + menuName + ' <i class="glyphicon glyphicon-remove-circle"></i></a>';
            $('.J_menuTab').removeClass('active');

            // 添加选项卡对应的iframe
            var str1 = '<iframe class="J_iframe" name="iframe' + dataIndex + '" width="100%" height="100%" src="' + dataUrl + '" frameborder="0" data-id="' + dataUrl + '" seamless></iframe>';
            $('.J_mainContent').find('iframe.J_iframe').hide().parents('.J_mainContent').append(str1);


            // 显示loading提示
            // var loading = layer.load();

            //$('.J_mainContent iframe:visible').load(function () {
            //    //iframe加载完成后隐藏loading提示
            //    layer.close(loading);
            //});

            //  添加选项卡
            $('.J_menuTabs .page-tabs-content').append(str);
            scrollToTab($('.J_menuTab.active'));

            $("[name='iframe" + dataIndex + "']").on('load', function () {
                //window.open怎么办?
                var sifram = $(this).contents().find('.S_menuItem');

                sifram.on('click', SmenuItem);
            })
        }
        return false;
    }
    mapp.menuItem = menuItem;

    $('.J_menuItem').on('click', menuItem);



    $("[name='iframe0']").on('load', function () {
        //window.open怎么办?
        var sifram = $(this).contents().find('.S_menuItem');

        sifram.on('click', SmenuItem);
    })


    // 在框架中打开新标签
    function SmenuItem() {
        // 获取标识数据
        var _this = $(this);
        var dataUrl = _this.attr("data-url");
        var menuName = _this.text();
        var dataIndex = Stabindex,

            flag = true;
        if (dataUrl == undefined || $.trim(dataUrl).length == 0) return false;


        var str = '<a href="javascript:;" class="active J_menuTab" data-id="' + dataUrl + '">' + menuName + ' <i class="glyphicon glyphicon-remove-circle"></i></a>';
        $('.J_menuTab').removeClass('active');

        // 添加选项卡对应的iframe
        var str1 = '<iframe class="J_iframe" name="iframe' + dataIndex + '" width="100%" height="100%" src="' + dataUrl + '" frameborder="0" data-id="' + dataUrl + '" seamless></iframe>';
        $('.J_mainContent').find('iframe.J_iframe').hide().parents('.J_mainContent').append(str1);

        $('.J_menuTabs .page-tabs-content').append(str);
        scrollToTab($('.J_menuTab.active'));
        Stabindex--;
        return false;
    }







    // 关闭选项卡菜单
    function closeTab() {
        var closeTabId = $(this).parents('.J_menuTab').data('id');
        var currentWidth = $(this).parents('.J_menuTab').width();
        var $this = $(this);
        // 当前元素处于活动状态
        if ($(this).parents('.J_menuTab').hasClass('active')) {

            // 当前元素后面有同辈元素，使后面的一个元素处于活动状态
            if ($(this).parents('.J_menuTab').next('.J_menuTab').size()) {

                var activeId = $(this).parents('.J_menuTab').next('.J_menuTab:eq(0)').data('id');
                $(this).parents('.J_menuTab').next('.J_menuTab:eq(0)').addClass('active');


                var marginLeftVal = parseInt($('.page-tabs-content').css('margin-left'));
                if (marginLeftVal < 0) {
                    $('.page-tabs-content').animate({
                        marginLeft: (marginLeftVal + currentWidth) + 'px'
                    }, "fast");
                }

                if ($(this).parents('.J_menuTab').text().indexOf('精品文章') >= 0) {
                    var options = {
                        title: "当前修改还未进行同步离开将丢失，是否离开？",
                        showCancelButton: true,
                        cancelButtonText: "取消",
                        confirmButtoText: "离开",
                        confirmButtonColor: "#18a689",
                        closeOnConfirm: true,
                        closeOnCancel: true,
                        timer: 2000
                    };
                    swal(options, function (isConfirm) {
                        if (isConfirm) {
                            $('.J_mainContent .J_iframe').each(function () {
                                if ($this.data('id') == activeId) {
                                    $this.show().siblings('.J_iframe').hide();
                                    return false;
                                }
                            });

                            //  移除当前选项卡
                            $this.parents('.J_menuTab').remove();

                            // 移除tab对应的内容区
                            $('.J_mainContent .J_iframe').each(function () {
                                if ($this.data('id') == closeTabId) {
                                    $this.remove();
                                    return false;
                                }
                            });
                        } else {
                            return false;
                        }
                    });
                } else {
                    $('.J_mainContent .J_iframe').each(function () {
                        if ($(this).data('id') == activeId) {
                            $(this).show().siblings('.J_iframe').hide();
                            return false;
                        }
                    });
                    //  移除当前选项卡
                    $this.parents('.J_menuTab').remove();

                    // 移除tab对应的内容区
                    $('.J_mainContent .J_iframe').each(function () {
                        if ($this.data('id') == closeTabId) {
                            $this.remove();
                            return false;
                        }
                    });
                }

            }

            // 当前元素后面没有同辈元素，使当前元素的上一个元素处于活动状态
            if ($(this).parents('.J_menuTab').prev('.J_menuTab').size()) {
                var activeId = $(this).parents('.J_menuTab').prev('.J_menuTab:last').data('id');
                $(this).parents('.J_menuTab').prev('.J_menuTab:last').addClass('active');


                if ($(this).parents('.J_menuTab').text().indexOf('精品文章') >= 0) {
                    var options = {
                        title: "当前修改还未进行同步离开将丢失，是否离开？",
                        showCancelButton: true,
                        cancelButtonText: "取消",
                        confirmButtoText: "离开",
                        confirmButtonColor: "#18a689",
                        closeOnConfirm: true,
                        closeOnCancel: true,
                        timer: 2000
                    };
                    swal(options, function (isConfirm) {
                        if (isConfirm) {
                            $('.J_mainContent .J_iframe').each(function () {
                                if ($this.data('id') == activeId) {
                                    $this.show().siblings('.J_iframe').hide();
                                    return false;
                                }
                            });
                            //  移除当前选项卡
                            $this.parents('.J_menuTab').remove();

                            // 移除tab对应的内容区
                            $('.J_mainContent .J_iframe').each(function () {
                                if ($this.data('id') == closeTabId) {
                                    $this.remove();
                                    return false;
                                }
                            });
                        } else {
                            return false;

                        }
                    });
                } else {
                    $('.J_mainContent .J_iframe').each(function () {
                        if ($(this).data('id') == activeId) {
                            $(this).show().siblings('.J_iframe').hide();
                            return false;
                        }
                    });

                    //  移除当前选项卡
                    $(this).parents('.J_menuTab').remove();

                    // 移除tab对应的内容区
                    $('.J_mainContent .J_iframe').each(function () {
                        if ($(this).data('id') == closeTabId) {
                            $(this).remove();
                            return false;
                        }
                    });
                }
            }
        }
        // 当前元素不处于活动状态
        else {
            if ($(this).parents('.J_menuTab').text().indexOf('精品文章') >= 0) {
                var options = {
                    title: "当前修改还未进行同步离开将丢失，是否离开？",
                    showCancelButton: true,
                    cancelButtonText: "取消",
                    confirmButtoText: "离开",
                    confirmButtonColor: "#18a689",
                    closeOnConfirm: true,
                    closeOnCancel: true,
                    timer: 2000
                };
                swal(options, function (isConfirm) {
                    if (isConfirm) {
                        $('.J_mainContent .J_iframe').each(function () {
                            if ($this.data('id') == activeId) {
                                $this.show().siblings('.J_iframe').hide();
                                return false;
                            }
                        });
                        //  移除当前选项卡
                        $this.parents('.J_menuTab').remove();

                        // 移除tab对应的内容区
                        $('.J_mainContent .J_iframe').each(function () {
                            if ($this.data('id') == closeTabId) {
                                $this.remove();
                                return false;
                            }
                        });
                    } else {
                        return false;

                    }

                });
            } else {
                $('.J_mainContent .J_iframe').each(function () {
                    if ($(this).data('id') == activeId) {
                        $(this).show().siblings('.J_iframe').hide();
                        return false;
                    }
                });
                //  移除当前选项卡
                $(this).parents('.J_menuTab').remove();

                // 移除tab对应的内容区
                $('.J_mainContent .J_iframe').each(function () {
                    if ($(this).data('id') == closeTabId) {
                        $(this).remove();
                        return false;
                    }
                });
            }
            scrollToTab($('.J_menuTab.active'));
        }
        return false;
    }

    $('.J_menuTabs').on('click', '.J_menuTab i', closeTab);

    //关闭其他选项卡
    function closeOtherTabs() {
        $('.page-tabs-content').children("[data-id]").not(":first").not(".active").each(function () {
            $('.J_iframe[data-id="' + $(this).data('id') + '"]').remove();
            $(this).remove();
        });
        $('.page-tabs-content').css("margin-left", "0");
    }
    $('.J_tabCloseOther').on('click', closeOtherTabs);

    //滚动到已激活的选项卡
    function showActiveTab() {
        scrollToTab($('.J_menuTab.active'));
    }
    $('.J_tabShowActive').on('click', showActiveTab);


    // 点击选项卡菜单
    function activeTab() {
        if (!$(this).hasClass('active')) {
            var currentId = $(this).data('id');
            // 显示tab对应的内容区
            $('.J_mainContent .J_iframe').each(function () {
                if ($(this).data('id') == currentId) {
                    $(this).show().siblings('.J_iframe').hide();
                    return false;
                }
            });
            $(this).addClass('active').siblings('.J_menuTab').removeClass('active');
            scrollToTab(this);
        }
    }

    $('.J_menuTabs').on('click', '.J_menuTab', activeTab);

    //刷新iframe
    function refreshTab() {
        var target = $('.J_iframe[data-id="' + $(this).data('id') + '"]');
        var url = target.attr('src');
                //显示loading提示
                var loading = layer.load();
                target.attr('src', url).load(function () {
                    //关闭loading提示
                    layer.close(loading);
                });
    }

    $('.J_menuTabs').on('dblclick', '.J_menuTab', refreshTab);

    // 左移按扭
    $('.J_tabLeft').on('click', scrollTabLeft);

    // 右移按扭
    $('.J_tabRight').on('click', scrollTabRight);

    // 关闭全部
    $('.J_tabCloseAll').on('click', function () {
        $('.page-tabs-content').children("[data-id]").not(":first").each(function () {
            $('.J_iframe[data-id="' + $(this).data('id') + '"]').remove();
            $(this).remove();
        });
        $('.page-tabs-content').children("[data-id]:first").each(function () {
            $('.J_iframe[data-id="' + $(this).data('id') + '"]').show();
            $(this).addClass("active");
        });
        $('.page-tabs-content').css("margin-left", "0");
    });

});
