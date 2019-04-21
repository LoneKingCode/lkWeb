// 字母和数字
jQuery.validator.addMethod("letterNumber", function (value, element) {
    return this.optional(element) || /^[a-zA-Z0-9]+$/.test(value);
}, "只能包括英文字母和数字");

// 汉字字母数字
jQuery.validator.addMethod("cnLetterNumber", function (value, element) {
    log(value)
    return this.optional(element) || /^[\u4E00-\u9FA5a-zA-Z0-9]+$/.test(value);
}, "只能包括汉字,字母和数字");

// 汉字
jQuery.validator.addMethod("chinese", function (value, element) {
    return this.optional(element) || /^[\u4E00-\u9FA5]+$/.test(value);
}, "只能包括汉字");

// 汉字和中文符号
jQuery.validator.addMethod("chineseAll", function (value, element) {
    return this.optional(element) || /^[\u3400-\u4DB5\u4E00-\u9FA5\u9FA6-\u9FBB\uF900-\uFA2D\uFA30-\uFA6A\uFA70-\uFAD9\uFF00-\uFFEF\u2E80-\u2EFF\u3000-\u303F\u31C0-\u31EF]+$/.test(value);
}, "只能包括汉字和中文符号");

// 邮箱
jQuery.validator.addMethod("isEmail", function (value, element) {
    var tel = /^([a-zA-Z0-9._-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
    return this.optional(element) || (tel.test(value));
}, "请输入邮箱");

// 身份证号码验证
jQuery.validator.addMethod("isIdCard", function (value, element) {
    return this.optional(element) || isIdCardNo(value);
}, "请输入正确的身份证号码");

// 手机号码验证
jQuery.validator.addMethod("isMobile", function (value, element) {
    var length = value.length;
    var mobile = /^(1\d{10})$/;
    return this.optional(element) || (length == 11 && mobile.test(value));
}, "请输入正确的手机号码");

// 电话号码验证
jQuery.validator.addMethod("isTel", function (value, element) {
    var tel = /^\d{3,4}-?\d{7,9}$/;
    return this.optional(element) || (tel.test(value));
}, "请输入正确的电话号码");

// 联系电话(手机/电话皆可)验证
jQuery.validator.addMethod("isContactPhone", function (value, element) {
    var length = value.length;
    var mobile = /^(1\d{10})$/;
    var tel = /^\d{3,4}-?\d{7,9}$/;
    return this.optional(element) || (tel.test(value) || mobile.test(value));
}, "请输入正确的联系电话");

// 邮政编码验证
jQuery.validator.addMethod("isZipCode", function (value, element) {
    var tel = /^\d{6}$/;
    return this.optional(element) || (tel.test(value));
}, "请输入正确的邮政编码");

function isIdCardNo(num) {
    var factorArr = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1);
    var parityBit = new Array("1", "0", "X", "9", "8", "7", "6", "5", "4", "3", "2");
    var varArray = new Array();
    var intValue;
    var lngProduct = 0;
    var intCheckDigit;
    var intStrLen = num.length;
    var idNumber = num;
    // initialize
    if ((intStrLen != 15) && (intStrLen != 18)) {
        return false;
    }
    // check and set value
    for (i = 0; i < intStrLen; i++) {
        varArray[i] = idNumber.charAt(i);
        if ((varArray[i] < '0' || varArray[i] > '9') && (i != 17)) {
            return false;
        } else if (i < 17) {
            varArray[i] = varArray[i] * factorArr[i];
        }
    }
    if (intStrLen == 18) {
        //check date
        var date8 = idNumber.substring(6, 14);
        if (isDate8(date8) == false) {
            return false;
        }
        // calculate the sum of the products
        for (i = 0; i < 17; i++) {
            lngProduct = lngProduct + varArray[i];
        }
        // calculate the check digit
        intCheckDigit = parityBit[lngProduct % 11];
        // check last digit
        if (varArray[17] != intCheckDigit) {
            return false;
        }
    }
    else { //length is 15
        //check date
        var date6 = idNumber.substring(6, 12);
        if (isDate6(date6) == false) {
            return false;
        }
    }
    return true;
}
function isDate6(sDate) {
    if (!/^\d{6}$/.test(sDate)) {
        return false;
    }
    var year, month, day;
    year = sDate.substring(0, 4);
    month = sDate.substring(4, 6);
    if (year < 1700 || year > 2500) return false
    if (month < 1 || month > 12) return false
    return true
}
function isDate8(sDate) {
    if (!/^\d{8}$/.test(sDate)) {
        return false;
    }
    var year, month, day;
    year = sDate.substring(0, 4);
    month = sDate.substring(4, 6);
    day = sDate.substring(6, 8);
    var iaMonthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    if (year < 1700 || year > 2500) return false
    if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) iaMonthDays[1] = 29;
    if (month < 1 || month > 12) return false
    if (day < 1 || day > iaMonthDays[month - 1]) return false
    return true
}


