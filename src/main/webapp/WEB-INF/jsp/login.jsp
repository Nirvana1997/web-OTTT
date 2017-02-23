<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- 上面这两行是java代码的引用 --%>

<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6 lt8"> <![endif]-->
<!--[if IE 7 ]> <html lang="en" class="no-js ie7 lt8"> <![endif]-->
<!--[if IE 8 ]> <html lang="en" class="no-js ie8 lt8"> <![endif]-->
<!--[if IE 9 ]> <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js"> <!--<![endif]-->

<script type="text/javascript" src="/static/js/jquery-3.1.1.min.js"></script>
<%--<script type="text/javascript" src="../../static/js/log.js"></script>--%>
<script language="JavaScript">
    function webLogin() {   //定义一个名为webLogin的js函数（在java中我们称呼函数为方法）
        var loginname = $("#username").val();
        //var是申明一个变量的关键字，loginname为变量名，
        //$("#u")是找到一个标签ID为"u"的标签，.val() 是获取对应ID标签的值
        if ("" == loginname) {  //u标签的值为空
            //只有通过 $("#u") 的形式才能获取一个标签。
            $("#username").tips({  // .tips 是js提示标签的调用方 法，具体的轮廓如上面的登陆页面的提示标签
                side: 2,
                msg: '用户名不得为空',  //提示的信息
                bg: '#AE81FF',  //背景色
                time: 3 //呈现的时间
            });
            $("#username").focus();    //让u标签获取输入焦点
            return false;   //返回false，打断js的执行
        }
        var loginpwd = $("#password").val();
        if (loginpwd == "") {
            $("#password").tips({
                side: 2,
                msg: '密码不得为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#password").focus();
            return false;
        }

        $.ajax({    //使用jquery下面的ajax开启网络请求
            type: "POST",   //http请求方式为POST
            url: '<%=request.getContextPath()%>/userAction/login',  //请求接口的地址
            data: {loginId: loginname, pwd: loginpwd},  //存放的数据，服务器接口字段为loginId和pwd，分别对应用户登录名和密码
            dataType: 'json',   //当这里指定为json的时候，获取到了数据后会自动解析的，只需要 返回值.字段名称 就能使用了
            cache: false,   //不用缓存
            success: function (data) {  //请求成功，http状态码为200。返回的数据已经打包在data中了。
                if (data.code == 1) {   //获判断json数据中的code是否为1，登录的用户名和密码匹配，通过效验，登陆成功
                    window.location.href = "<%=request.getContextPath()%>/mvc/home";    //跳转到主页
                } else {    //登录不成功
                    alert(data.msg);    //弹出对话框，提示返回的错误信息
                    $("#username").focus();
                }
            }
        });
    }

    function webReg() {
        //用户名判断
        var username = $("#usernamesignup").val();
        if(username == ""){
            alert("用户名不能为空");
            return false;
        }
        //密码判断
        var pwd = $("#passwordsignup").val();
        var pwd_cfm = $("#passwordsignup_confirm").val();
        if(pwd!=pwd_cfm){
            alert("两次密码不一致");
            return false;
        }
        //各类信息判断
        //电话
        var cell_number = $("#cell_number").val();
        var cellnum_regex = /^1\d{10}$/;
        if(!cellnum_regex.test(cell_number)){
            alert("手机号码格式错误");
            return false;
        }
        //性别
        var sex = $("#sex").val();
        var sex_regex = /^[男女]$/;
        if(!sex_regex.test(sex)){
            alert("性别格式错误");
            return false;
        }
        var age = $("#age").val();
        if(age<0||age>150){
            alert("年龄应在0到150之间");
            return false;
        }

        //信息均正确
        $.ajax({
            type:"POST",
            url: '<%=request.getContextPath()%>/userAction/reg',
            data:{loginId: username, pwd: pwd, name: $("#namesignup").val(), sex: sex, age: age, cellNumber: cell_number},
            dataType:"json",
            cache:false,
            success:function (data) {
                if(data.code==1){
                    window.location.href = data.data.nextUrl;
                }
                else{
                    alert(data.msg);
                    $("#usernamesignup").focus();
                }
            }
        })
    }
</script>
<head>
    <meta charset="UTF-8"/>
    <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
    <title>登陆</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Login and Registration Form with HTML5 and CSS3"/>
    <meta name="author" content="Codrops"/>
    <link rel="shortcut icon" href="../favicon.ico">
    <link rel="stylesheet" type="text/css" href="/static/css/demo.css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/style3.css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/animate-custom.css"/>
</head>
<body>
<div class="container">
    <!-- Codrops top bar -->
    <div class="codrops-top">
        <a href="">
            <strong>&laquo; Previous Demo: </strong>Responsive Content Navigator
        </a>
        <span class="right">
                    <a href=" http://tympanus.net/codrops/2012/03/27/login-and-registration-form-with-html5-and-css3/login.jsp">
                        <strong>Back to the Codrops Article</strong>
                    </a>
                </span>x
        <div class="clr"></div>
    </div><!--/ Codrops top bar -->
    <header>
        <h1>Wepapp<span>Login</span></h1>
        <%--<nav class="codrops-demos">--%>
        <%--<span>Click <strong>"Join us"</strong> to see the form switch</span>--%>
        <%--<a href="index.html">Demo 1</a>--%>
        <%--<a href="index2.html">Demo 2</a>--%>
        <%--<a href="login.jsp" class="current-demo">Demo 3</a>--%>
        <%--</nav>--%>
    </header>
    <section>
        <div id="container_demo">
            <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
            <a class="hiddenanchor" id="toregister"></a>
            <a class="hiddenanchor" id="tologin"></a>
            <div id="wrapper">
                <div id="login" class="animate form">
                    <form action=""
                          name="loginform"
                          accept-charset="utf-8"
                          id="login_form"
                          class="loginForm"
                          method="post">
                        <h1>Log in</h1>
                        <p>
                            <label for="username" class="uname" data-icon="u"> Your email or username </label>
                            <input id="username" name="loginId" required="required" type="text"
                                   placeholder="myusername or mymail@mail.com"/>
                        </p>
                        <p>
                            <label for="password" class="youpasswd" data-icon="p"> Your password </label>
                            <input id="password" name="pwd" required="required" type="password"
                                   placeholder="eg. X8df!90EO"/>
                        </p>
                        <p class="keeplogin">
                            <input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping"/>
                            <label for="loginkeeping">Keep me logged in</label>
                        </p>
                        <p class="login button">
                            <input type="button" value="Login" onclick="webLogin()"/>
                        </p>
                        <p class="change_link">
                            Not a member yet ?
                            <a href="#toregister" class="to_register">Join us</a>
                        </p>
                    </form>
                </div>

                <div id="register" class="animate form">
                    <form action="" method="post" accept-charset="utf-8" autocomplete="on">
                        <h1> Sign up </h1>
                        <p>
                            <label for="usernamesignup" class="uname" data-icon="u">Your username</label>
                            <input id="usernamesignup" name="loginId" required="required" type="text"
                                   placeholder="mysuperusername690"/>
                        </p>
                        <p>
                            <label for="namesignup" class="name" data-icon="n">Your name</label>
                            <input id="namesignup" name="name" required="required" type="text" placeholder="张三"/>
                        </p>
                        <%--<p> --%>
                        <%--<label for="emailsignup" class="youmail" data-icon="e" > Your name</label>--%>
                        <%--<input id="emailsignup" name="emailsignup" required="required" type="email" placeholder="mysupermail@mail.com"/> --%>
                        <%--</p>--%>
                        <p>
                            <label for="passwordsignup" class="youpasswd" data-icon="p">Your password </label>
                            <input id="passwordsignup" name="pwd" required="required" type="password"
                                   placeholder="eg. X8df!90EO"/>
                        </p>
                        <p>
                            <label for="passwordsignup_confirm" class="youpasswd" data-icon="p">Please confirm your
                                password </label>
                            <input id="passwordsignup_confirm" name="pwd_confirm" required="required" type="password"
                                   placeholder="eg. X8df!90EO"/>
                        </p>
                        <p>
                            <label for="cell_number" class="cellnumber" data-icon="c">Your cellphone number </label>
                            <input id="cell_number" name="cellNumber" required="required" type="text"
                                   placeholder="13913913922"/>
                        </p>
                        <p>
                            <label for="sex" class="yousex" data-icon="s">Your sex </label>
                            <input id="sex" name="sex" required="required" type="text" placeholder="男／女"/>
                        </p>
                        <p>
                            <label for="age" class="youage" data-icon="p">Your age </label>
                            <input id="age" name="age" required="required" type="text" placeholder="eg.30"/>
                        </p>
                        <p class="signin button">
                            <input type="button" onclick="webReg()" value="Sign up"/>
                        </p>
                        <p class="change_link">
                            Already a member ?
                            <a href="#tologin" class="to_register"> Go and log in </a>
                        </p>
                    </form>
                </div>

            </div>
        </div>
    </section>
</div>
</body>
</html>