<%--
  Created by IntelliJ IDEA.
  User: qianzhihao
  Date: 2017/1/16
  Time: 下午3:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
    <title>HelloWorld</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Login and Registration Form with HTML5 and CSS3"/>
    <meta name="author" content="Codrops"/>
    <script type="text/javascript" src="/static/js/log.js"></script>
    <link rel="shortcut icon" href="../favicon.ico">
    <link rel="stylesheet" type="text/css" href="/static/css/demo.css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/style3.css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/animate-custom.css"/>
</head>
<body>
<div class="container">
    <header>
        <h1>Hello World</h1>

    </header>
    <section>
        <div id="container_demo">
            <%--<a href="/mvc/login">登陆</a>--%>
            <%--<!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->--%>
            <%--<a class="hiddenanchor" id="toregister"></a>--%>
            <%--<a class="hiddenanchor" id="tologin"></a>--%>
            <div id="wrapper">
                <div id="login" class="animate form">
                        <h1>Web APP</h1>
                        <p class="login button">
                            <a href="/mvc/login" value="login">Login</a>
                        </p>
                </div>
            </div>
        </div>
    </section>
</div>
</div>

</body>
</html>
