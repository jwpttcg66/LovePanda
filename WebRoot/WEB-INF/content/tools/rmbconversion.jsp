<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <!-- 引入基本库和js，css文件 -->
    <%@ include file="/WEB-INF/content/common/taglib.jsp" %>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="大小写转换">
    <meta name="keywords" content="人民币 大小写转换">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>工具</title>
    <meta property="qc:admins" content="17257406576415156651636"/>
    <!-- Set render engine for 360 browser -->
    <meta name="renderer" content="webkit">
    <link rel="icon" href="${base}/favicon.ico" type="image/x-icon"/>
    <script src="${base}/baguetteBox/js/baguetteBox.min.js"></script>
    <link rel="stylesheet" href="${base}/baguetteBox/css/baguetteBox.css">
    <style type="text/css">
        .am-badge {
            margin-right: 2px;
            border-radius: 3px;
        }
    </style>
    <script language="JavaScript" type="text/JavaScript">
        function convertCurrency(currencyDigits) {
// Constants:
            var MAXIMUM_NUMBER = 99999999999.99;
            // Predefine the radix characters and currency symbols for output:
            var CN_ZERO = "零";
            var CN_ONE = "壹";
            var CN_TWO = "贰";
            var CN_THREE = "叁";
            var CN_FOUR = "肆";
            var CN_FIVE = "伍";
            var CN_SIX = "陆";
            var CN_SEVEN = "柒";
            var CN_EIGHT = "捌";
            var CN_NINE = "玖";
            var CN_TEN = "拾";
            var CN_HUNDRED = "佰";
            var CN_THOUSAND = "仟";
            var CN_TEN_THOUSAND = "万";
            var CN_HUNDRED_MILLION = "亿";
            var CN_SYMBOL = "人民币";
            var CN_DOLLAR = "元";
            var CN_TEN_CENT = "角";
            var CN_CENT = "分";
            var CN_INTEGER = "整";

// Variables:
            var integral;    // Represent integral part of digit number.
            var decimal;    // Represent decimal part of digit number.
            var outputCharacters;    // The output result.
            var parts;
            var digits, radices, bigRadices, decimals;
            var zeroCount;
            var i, p, d;
            var quotient, modulus;

// Validate input string:
            currencyDigits = currencyDigits.toString();
            if (currencyDigits == "") {
                alert("请输入小写金额！");
                return "";
            }
            if (currencyDigits.match(/[^,.\d]/) != null) {
                alert("小写金额含有无效字符！");
                return "";
            }
            if ((currencyDigits).match(/^((\d{1,3}(,\d{3})*(.((\d{3},)*\d{1,3}))?)|(\d+(.\d+)?))$/) == null) {
                alert("小写金额的格式不正确！");
                return "";
            }

// Normalize the format of input digits:
            currencyDigits = currencyDigits.replace(/,/g, "");    // Remove comma delimiters.
            currencyDigits = currencyDigits.replace(/^0+/, "");    // Trim zeros at the beginning.
            // Assert the number is not greater than the maximum number.
            if (Number(currencyDigits) > MAXIMUM_NUMBER) {
                alert("金额过大，应小于1000亿元！");
                return "";
            }

// Process the coversion from currency digits to characters:
            // Separate integral and decimal parts before processing coversion:
            parts = currencyDigits.split(".");
            if (parts.length > 1) {
                integral = parts[0];
                decimal = parts[1];
                // Cut down redundant decimal digits that are after the second.
                decimal = decimal.substr(0, 2);
            }
            else {
                integral = parts[0];
                decimal = "";
            }
            // Prepare the characters corresponding to the digits:
            digits = new Array(CN_ZERO, CN_ONE, CN_TWO, CN_THREE, CN_FOUR, CN_FIVE, CN_SIX, CN_SEVEN, CN_EIGHT, CN_NINE);
            radices = new Array("", CN_TEN, CN_HUNDRED, CN_THOUSAND);
            bigRadices = new Array("", CN_TEN_THOUSAND, CN_HUNDRED_MILLION);
            decimals = new Array(CN_TEN_CENT, CN_CENT);
            // Start processing:
            outputCharacters = "";
            // Process integral part if it is larger than 0:
            if (Number(integral) > 0) {
                zeroCount = 0;
                for (i = 0; i < integral.length; i++) {
                    p = integral.length - i - 1;
                    d = integral.substr(i, 1);
                    quotient = p / 4;
                    modulus = p % 4;
                    if (d == "0") {
                        zeroCount++;
                    }
                    else {
                        if (zeroCount > 0) {
                            outputCharacters += digits[0];
                        }
                        zeroCount = 0;
                        outputCharacters += digits[Number(d)] + radices[modulus];
                    }
                    if (modulus == 0 && zeroCount < 4) {
                        outputCharacters += bigRadices[quotient];
                        zeroCount = 0;
                    }
                }
                outputCharacters += CN_DOLLAR;
            }
            // Process decimal part if there is:
            if (decimal != "") {
                for (i = 0; i < decimal.length; i++) {
                    d = decimal.substr(i, 1);
                    if (d != "0") {
                        outputCharacters += digits[Number(d)] + decimals[i];
                    }
                }
            }
            // Confirm and return the final output string:
            if (outputCharacters == "") {
                outputCharacters = CN_ZERO + CN_DOLLAR;
            }
            if (decimal == "") {
                outputCharacters += CN_INTEGER;
            }
            outputCharacters = CN_SYMBOL + outputCharacters;
            return outputCharacters;
        }
    </script>

</head>
<body>
<%@ include file="/WEB-INF/content/common/header.jsp" %>

<div class="am-container " id="main">
    <div class="am-g am-g-fixed">
        <h3>人民币小写在线转换成大写 v6.0</h3>

        <div class="am-u-md-8"> 小写金额：
            <input name="Digits" type="text" id="Digits" class="input2" onFocus="this.className='inputtext-bor'"
                   onBlur="this.className='inputtext'" value="1688.99" size="40"/>
            <br/>
            <br/>
            大写金额：
            <input name="Result" type="text" class="input2" id="Result" size="40"/>
            <br/>
            <br/>
            <input id="Convert" type="button" class="button" value="转换为大写金额" name="Convert"
                   onclick="Result.value = convertCurrency(Digits.value);"/>
            <br/>
            <br/>
            <br/>
        </div>

        <div class="am-u-md-4" id="my-side">
            <%@ include file="/WEB-INF/content/common/side.jsp" %>
        </div>
    </div>
    <!-- 多说分享 -->
    <div class="ds-share" data-thread-key="rmbconversion_1" data-title="人民币小写在线转换成大写"
         data-url="${siteUrl}/tools/rmbconversion">
        <div class="ds-share-aside-left">
            <div class="ds-share-aside-inner">
            </div>
            <div class="ds-share-aside-toggle">分享到</div>
        </div>
    </div>
</div>




<!-- 底部 -->
<%@ include file="/WEB-INF/content/common/footer.jsp" %>
<script type="text/javascript">
    $(function () {
        baguetteBox.run('.baguetteBox', {
            animation: 'fadeIn'
        });
    });
    $(function () {
        $(".beauty-keyword-show").each(function () {
            var ht = $(this).html();
            $(this).html('');
            if (ht != '' && ht != undefined && ht != ' ') {
                var arr = ht.split(" ");
                for (var i = 0; i < arr.length; i++) {
                    if (arr[i].trim() != "") {
                        $(this).append("<a class='am-badge am-badge-success' href='${base}/index/search?keyword=" + arr[i] + "'>" + arr[i] + "</a>");
                    }
                }
            }
        })
    });
    $("img").lazyload({effect: 'fadeIn'});
</script>
<script language="javascript">
    var a, b, c, d;
    function shu(x) {
        if (jg.value == 0) {
            jg.value = x;
        }
        else {
            if (x == ".") {
                var kk = jg.value
                if (kk.indexOf(".") < 0) {
                    jg.value = jg.value + x;
                }
            }
            else {
                jg.value = jg.value + x;
            }
        }
//programing by downyi.com
    }
    function yunsuan(y) {
        switch (y) {
            case "+":
                d = "+"
                break
            case "-":
                d = "-"
                break
            case "x":
                d = "x"
                break
            case "/":
                d = "/"
        }
        a = Number(jg.value);
        jg.value = ""
    }
    function dengyu() {
        b = Number(jg.value)
        if (a != undefined && b != 0 && d != undefined) {
            switch (d) {
                case "+":
                    c = a + b;
                    break;
                case "-":
                    c = a - b;
                    break;
                case "x":
                    c = a * b;
                    break;

                case "/":
                    c = a / b;
            }
            jg.value = c;
            a = 0;
            b = 0;
            d = undefined;
            Digits.value = c;
            Result.value = convertCurrency(Digits.value);
        }
    }
    function qc() {
        a = 0;
        b = 0;
        d = undefined;
        jg.value = "0";
    }
    function shanchu() {
        var bs = jg.value;
        bs = bs.substr(0, bs.length - 1);
        jg.value = bs;
        jg.focus();
    }
    function pf() {
        var h = Number(jg.value);
        if (h != 0) {
            h = h * h;
            jg.value = h;
        }
    }
    function jc() {
        var p = 1;
        var q = parseInt(jg.value)
        if (q != 0 && q != NaN) {
            for (i = 1; i <= q; i++) {
                p = p * i;
            }
            jg.value = p;
        }

    }
    function setfocus() {
        jg.focus();
        ts = startTime()
    }
    function kf() {
        if (jg.value != ".") {
            jg.value = Math.sqrt(Number(jg.value))
        }
    }

    function checkkey() {
        var p = /[^0-9]/
        if (p.test(jg.value) == true) {
            jg.value = ""
            jg.focus
        }
    }
    function startTime() {
        var today = new Date()
        var h = today.getHours()
        var m = today.getMinutes()
        var s = today.getSeconds()
        m = checkTime(m)
        s = checkTime(s)
        document.getElementById('sjxs').innerHTML = h + ":" + m + ":" + s
        t = setTimeout('startTime()', 500)
    }

    function checkTime(i) {
        if (i < 10) {
            i = "0" + i
        }
        return i
    }
    function timeshow() {

        if (document.getElementById('sjxs').style.display != "none") {
            document.getElementById('sjxs').style.display = "none"
        }
        else {
            document.getElementById('sjxs').style.display = "block"
        }

    }

</script>

</body>
</html>