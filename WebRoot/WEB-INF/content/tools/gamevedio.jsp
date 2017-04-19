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
    <link href="//vjs.zencdn.net/5.11/video-js.min.css" rel="stylesheet">
    <script src="//vjs.zencdn.net/5.11/video.min.js"></script>

</head>
<body>
<%@ include file="/WEB-INF/content/common/header.jsp" %>

<div class="am-container " id="main">
    <video
            id="my-player"
            class="video-js"
            controls
            preload="auto"
            poster="//vjs.zencdn.net/v/oceans.png"
            data-setup='{}'>
        <source src="//vjs.zencdn.net/v/oceans.mp4" type="video/mp4"></source>
        <source src="//vjs.zencdn.net/v/oceans.webm" type="video/webm"></source>
        <source src="//vjs.zencdn.net/v/oceans.ogv" type="video/ogg"></source>
        <p class="vjs-no-js">
            To view this video please enable JavaScript, and consider upgrading to a
            web browser that
            <a href="http://videojs.com/html5-video-support/" target="_blank">
                supports HTML5 video
            </a>
        </p>
    </video>
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