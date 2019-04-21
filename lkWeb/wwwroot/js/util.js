
function openLayer(url, title, width, height,callback) {
    return layer.open({
        type: 2,
        title: title,
        shadeClose: true,
        shade: 0.8,
        area: [width, height],
        content: url,
        success: function (layero, index) {
            if (isFunction(callback))
                callback(layero, index)
        }
    });
}

function showMsg(content, type = 'success') {
    var icon = 0
    switch (type) {
        case 'warning':
            icon = 0
            break
        case 'success':
            icon = 1
            break
        case 'error':
            icon = 2
            break
        case 'question':
            icon = 3
            break
        case 'lock':
            icon = 4
            break
        case 'sad':
            icon = 5
            break
        case 'happy':
            icon = 6
            break
        default:
            icon = 0
    }
    layer.msg(content, { icon: icon });
}
function showAlert(content) {
    layer.alert(content)
}
function showConfirm(msg, callback) {
    layer.confirm(msg, { icon: 3, title: '提示' }, function (index) {
        if (isFunction(callback))
            callback()

        layer.close(index);
    });
}
function ajaxPost(url, isAddCsrfToken, data, success, error, type = 'post', dataType = 'json', async = true, msgTitle = '') {
    if (isAddCsrfToken)
        data['csrfmiddlewaretoken'] = getCsrfToken()
    var index = layer.load();
    $.ajax({
        url: url,
        data: data,
        type: type,
        dataType: dataType,
        async: async,
        success: function (result) {
            if (isFunction(success))
                success(result)
            else
                layer.msg('操作成功')
            layer.close(index)
        },
        error: function (res) {
            if (isFunction(error))
                error(res)
            else
                layer.msg('操作失败')
        },

    })
}
function getCsrfToken() {
    return $("input[name='csrfmiddlewaretoken']").val()
}
function escapeHtml(s) {
    s = "" + s;
    return s.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;").replace(/'/g, "&apos;");;

}

function unescapeHtml(s) {
    s = "" + s;
    return s.replace(/&lt;/g, "<").replace(/&gt;/g, ">").replace(/&amp;/g, "&").replace(/&quot;/g, '"').replace(/&apos;/g, "'");
}


function getUrlFileName(url) {
    var fileName = url.split("//")[1].split("/");
    fileName = fileName[fileName.length - 1];
    return fileName
}

function IsEmpty(value) {
    return !IsNotEmpty(value);
}

function IsNotEmpty(value) {
    return value != "" && value != null && value != undefined && value != 'undefined' && value != 'null';
}

function IsFunction(func) {
    return typeof func == "function";
}

//时间戳 到秒
var time = function () {
    var time = (new Date()).valueOf();
    return parseInt(time / 1000);
}

var UUID = function () {
    return 'uuid_' + time() + '_' + Math.ceil(Math.random() * 10000)
}

//为指定字符前添加前缀 s:字符 n:返回的长度 prefix:前缀
function prefixStr(s, n, prefix) {
    return (Array(n).join(prefix) + s).slice(-n);
}

//添加末尾字符 如果本身没有此字符的话
function addTailStr(s, tailStr) {
    if (s[s.length - 1] != tailStr)
        return s + tailStr
    else
        return s
}

var urlEncode = function (str) {
    try {
        return encodeURIComponent(str);
    } catch (e) {
        return str;
    }
};

var urlDecode = function (str) {
    try {
        return decodeURIComponent(str);
    } catch (e) {
        return str;
    }
};

//生成from到to的随机数；整数，包含to不包含from
var roundFromTo = function (from, to) {
    var react = to - from;
    return Math.ceil(Math.random() * react + from);
}
var roundString = function (len) {
    var result = "";
    var charArr = '01234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    len = len || 5;
    for (var i = 0; i < len; i++) {
        var index = roundFromTo(0, charArr.length) - 1;
        result += charArr.charAt(index);
    }
    return result;
}


function Queue(size) {
    var list = [];
    //向队列中添加数据
    this.push = function (data) {
        if (data == null || data == undefined) {
            return false;
        }
        //如果传递了size参数就设置了队列的大小
        if (size != null && !isNaN(size)) {
            if (list.length == size) {
                this.pop();
            }
        }
        list.push(data);
        return true;
    }

    //从队列中取出数据
    this.pop = function () {
        var e = list.pop();
        if (e == null || e == undefined)
            return false
        return e
    }
    this.empty = function () {
        list = []
    }
    //返回队列的大小
    this.size = function () {
        return list.length;
    }

    //返回队列的内容
    this.query = function () {
        return list;
    }
}



var log = function () {
    console.log.apply(console, arguments)
}

//获取指定的URL参数值
function getParam(paramName) {
    paramValue = "", isFound = !1;
    if (this.location.search.indexOf("?") == 0 && this.location.search.indexOf("=") > 1) {
        arrSource = unescape(this.location.search).substring(1, this.location.search.length).split("&"), i = 0;

        while (i < arrSource.length && !isFound) arrSource[i].indexOf("=") > 0 && arrSource[i].split("=")[0].toLowerCase() == paramName.toLowerCase() && (paramValue = arrSource[i].split("=")[1], isFound = !0), i++
    }
    return paramValue == "" && (paramValue = null), paramValue
}



//**dataURL to blob**
function dataURLtoBlob(dataurl) {
    var arr = dataurl.split(','), mime = arr[0].match(/:(.*?);/)[1],
        bstr = atob(arr[1]), n = bstr.length, u8arr = new Uint8Array(n);
    while (n--) {
        u8arr[n] = bstr.charCodeAt(n);
    }
    return new Blob([u8arr], { type: mime });
}

//**blob to dataURL**
function blobToDataURL(blob, callback) {
    var a = new FileReader();
    a.onload = function (e) { callback(e.target.result); }
    a.readAsDataURL(blob);
}




var ltrim = function (str, remove) {
    if (typeof (str) != 'string' || str.length <= 0) return "";
    remove = remove == undefined ? ' ' : remove;
    while (str.substring(0, remove.length) == remove) {
        str = str.substring(remove.length);
    }
    return str;
}

var rtrim = function (str, remove) {
    if (typeof (str) != 'string' || str.length <= 0) return "";
    remove = remove == undefined ? ' ' : remove;
    while (str.substring(str.length - remove.length) == remove) {
        str = str.substring(0, str.length - remove.length);
    }
    return str;
}

var trim = function (str, remove) {
    if (remove == undefined) {
        return str.replace(/(^\s*)|(\s*$)/g, "");
    }
    return ltrim(rtrim(str, remove), remove);
}

//var obj1 = $.extend({}, obj);//浅拷贝
//var obj2 = $.extend(true, {}, obj);//深拷贝

$.objClone = function (obj) {
    return $.extend(true, {}, obj);
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

String.prototype.contains = function (str) {
    return this.indexOf(str) != -1
}


/**
* 如果想将日期字符串格式化,需先将其转换为日期类型Date
* 以下是提供几种常用的
*
* var da = new Date().format('yyyy-MM-dd hh:mm:ss'); //将日期格式串,转换成先要的格式
* alert("格式化日期类型 \n" + new Date() + "\n 为字符串：" + da);
*
* var str = "2014/01/01 01:01:01" // yyyy/mm/dd这种格式转化成日期对像可以用new Date(str);在转换成指定格式
* alert("格式化字符串\n" + str + " 为日期格式 \n" + new Date(str).format('yyyy-MM-dd hh:mm:ss'))
*
*
* var str1 = "2014-12-31 00:55:55" // yyyy-mm-dd这种格式的字符串转化成日期对象可以用new Date(Date.parse(str.replace(/-/g,"/")));
* alert("格式化字符串\n" + str1 + " 为日期格式 \n" + new Date(Date.parse(str1.replace(/-/g, "/"))).format('yyyy-MM-dd hh:mm:ss'))
*
*
* 日期加月
* 先将字符转换成Date类型才可以使用
* var str1 = "2014-12-31 00:55:55" // yyyy-mm-dd这种格式的字符串转化成日期对象可以用new Date(Date.parse(str.replace(/-/g,"/")));
* 例如 var saveDate = new Date(Date.parse(str1.replace(/-/g, "/"))).addMonth(5)
* addMonth(月数) 必须为整数
*/
Date.prototype.format = function (format) {
    var date = {
        "M+": this.getMonth() + 1,
        "d+": this.getDate(),
        "h+": this.getHours(),
        "m+": this.getMinutes(),
        "s+": this.getSeconds(),
        "q+": Math.floor((this.getMonth() + 3) / 3),
        "S+": this.getMilliseconds()
    };
    if (/(y+)/i.test(format)) {
        format = format.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length));
    }
    for (var k in date) {
        if (new RegExp("(" + k + ")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length == 1
                ? date[k] : ("00" + date[k]).substr(("" + date[k]).length));
        }
    }
    return format;
}

Date.daysInMonth = function (year, month) {
    if (month == 1) {
        if (year % 4 == 0 && year % 100 != 0)
            return 29;
        else
            return 28;
    } else if ((month <= 6 && month % 2 == 0) || (month = 6 && month % 2 == 1))
        return 31;
    else
        return 30;
};

Date.prototype.addMonth = function (addMonth) {
    var y = this.getFullYear();
    var m = this.getMonth();
    var nextY = y;
    var nextM = m;
    //如果当前月+要加上的月>11 这里之所以用11是因为 js的月份从0开始
    if (m > 11) {
        nextY = y + 1;
        nextM = parseInt(m + addMonth) - 11;
    } else {
        nextM = this.getMonth() + addMonth
    }
    var daysInNextMonth = Date.daysInMonth(nextY, nextM);
    var day = this.getDate();
    if (day > daysInNextMonth) {
        day = daysInNextMonth;
    }
    return new Date(nextY, nextM, day);
};
