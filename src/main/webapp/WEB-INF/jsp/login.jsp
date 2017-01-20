<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- 上面这两行是java代码的引用 --%>

<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6 lt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7 lt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8 lt8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="UTF-8" />
        <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
        <title>登陆</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
        <meta name="author" content="Codrops" />
        <script type="text/javascript" src="/static/js/login.js"></script>
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="/static/css/demo.css" />
        <link rel="stylesheet" type="text/css" href="/static/css/style3.css" />
		<link rel="stylesheet" type="text/css" href="/static/css/animate-custom.css" />
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
                <div id="container_demo" >
                    <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <form  action="<%=request.getContextPath()%>/userAction/login" method="post" autocomplete="on">
                                <h1>Log in</h1> 
                                <p> 
                                    <label for="username" class="uname" data-icon="u" > Your email or username </label>
                                    <input id="username" name="loginId" required="required" type="text" placeholder="myusername or mymail@mail.com"/>
                                </p>
                                <p> 
                                    <label for="password" class="youpasswd" data-icon="p"> Your password </label>
                                    <input id="password" name="pwd" required="required" type="password" placeholder="eg. X8df!90EO" />
                                </p>
                                <p class="keeplogin"> 
									<input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" /> 
									<label for="loginkeeping">Keep me logged in</label>
								</p>
                                <p class="login button"> 
                                    <input type="submit" value="Login" /> 
								</p>
                                <p class="change_link">
									Not a member yet ?
									<a href="#toregister" class="to_register">Join us</a>
								</p>
                            </form>
                        </div>

                        <div id="register" class="animate form">
                            <form  action="<%=request.getContextPath()%>/userAction/reg" method="post" autocomplete="on">
                                <h1> Sign up </h1> 
                                <p> 
                                    <label for="usernamesignup" class="uname" data-icon="u">Your username</label>
                                    <input id="usernamesignup" name="loginId" required="required" type="text" placeholder="mysuperusername690" />
                                </p>
                                <p>
                                    <label for="namesignup" class="name" data-icon="n">Your name</label>
                                    <input id="namesignup" name="name" required="required" type="text" placeholder="张三" />
                                </p>
                                <%--<p> --%>
                                    <%--<label for="emailsignup" class="youmail" data-icon="e" > Your name</label>--%>
                                    <%--<input id="emailsignup" name="emailsignup" required="required" type="email" placeholder="mysupermail@mail.com"/> --%>
                                <%--</p>--%>
                                <p> 
                                    <label for="passwordsignup" class="youpasswd" data-icon="p">Your password </label>
                                    <input id="passwordsignup" name="pwd" required="required" type="password" placeholder="eg. X8df!90EO"/>
                                </p>
                                <p> 
                                    <label for="passwordsignup_confirm" class="youpasswd" data-icon="p">Please confirm your password </label>
                                    <input id="passwordsignup_confirm" name="pwd_confirm" required="required" type="password" placeholder="eg. X8df!90EO"/>
                                </p>
                                <p>
                                    <label for="cell_number" class="cellnumber" data-icon="c">Your cellphone number </label>
                                    <input id="cell_number" name="cellNumber" required="required" type="text" placeholder="13913913922"/>
                                </p>
                                <p>
                                    <label for="sex" class="yousex" data-icon="s">Your sex </label>
                                    <input id="sex" name="sex" required="required" type="text" placeholder="男／女"/>
                                </p>
                                <p>
                                    <label for="age" class="youage" data-icon="p">Your age </label>
                                    <input id="age" name="age" required="required" type="password" placeholder="eg.30"/>
                                </p>
                                <p class="signin button"> 
									<input type="submit" value="Sign up"/> 
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