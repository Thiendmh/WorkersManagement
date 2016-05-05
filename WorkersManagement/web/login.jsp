
<!DOCTYPE HTML>
<html>
    <head>
        <title>Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Novus Admin Panel Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- Bootstrap Core CSS -->
        <link href="${pageContext.request.contextPath}/Assets/css/bootstrap.css" rel='stylesheet' type='text/css' />
        <!-- Custom CSS -->
        <link href="${pageContext.request.contextPath}/Assets/css/style.css" rel='stylesheet' type='text/css' />
        <!-- font CSS -->
        <!-- font-awesome icons -->
        <link href="${pageContext.request.contextPath}/Assets/css/font-awesome.css" rel="stylesheet"> 
        <!-- //font-awesome icons -->
        <!-- js-->
        <script src="${pageContext.request.contextPath}/Assets/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/Assets/js/modernizr.custom.js"></script>
        <!--webfonts-->
        <link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
        <!--//webfonts--> 
        <!--animate-->
        <link href="${pageContext.request.contextPath}/Assets/css/animate.css" rel="stylesheet" type="text/css" media="all">
        <script src="${pageContext.request.contextPath}/Assets/js/wow.min.js"></script>
        <script>
            new WOW().init();
        </script>
        <!--//end-animate-->
        <!-- Metis Menu -->
        <script src="${pageContext.request.contextPath}/Assets/js/metisMenu.min.js"></script>
        <script src="${pageContext.request.contextPath}/Assets/js/custom.js"></script>
        <link href="${pageContext.request.contextPath}/Assets/css/custom.css" rel="stylesheet">
        <!--//Metis Menu -->
    </head> 
    <body class="cbp-spmenu-push">
        <div class="main-content">
            <!--left-fixed -navigation-->

            <div >
                <div class="main-page login-page ">
                    <h3 class="title1">Login Page</h3>
                    <div class="widget-shadow">
                        <div class="login-top">
                            <h4>Welcome to Login page ! <br> Not a Member? <a data-toggle="modal" data-target="#myModal">  Sign Up »</a> </h4>
                            <!-- Modal -->
                            <div id="myModal" class="modal fade" role="dialog">
                                <div class="modal-dialog modal-lg">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h3 class="modal-title" class="title1">SignUp Here</h3>
                                        </div>
                                        <div class="modal-body">
                                            <script type="text/javascript">
            var ck_name = /^[A-Za-z0-9 ]{3,20}$/;
            var ck_email = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
            var ck_username = /^[A-Za-z0-9_]{1,20}$/;
            var ck_password = /^[A-Za-z0-9!@#$%^&*()_]{6,20}$/;
            var ck_phoneNumber = /^[(]{0,1}[0-9]{3}[)]{0,1}[-\s\.]{0,1}[0-9]{3}[-\s\.]{0,1}[0-9]{4}$/;

            function validate(form) {
                var email = form.txtEmail.value;
                var username = form.txtUsername.value;
                var password = form.txtPassword.value;
                var phone = form.txtTel.value;
                var name = form.txtName.value;
                var errors = [];

                if (!ck_email.test(email)) {
                    errors[errors.length] = "You must enter a valid email address.";
                }
                if (!ck_username.test(username)) {
                    errors[errors.length] = "You valid UserName no special char .";
                }

                if (!ck_password.test(password)) {
                    errors[errors.length] = "You must enter a valid Password min 6 char.";
                }
                if (!ck_phoneNumber.test(phone)) {
                    errors[errors.length] = "You must enter a valid Phone number."
                }
                if (!ck_name.test(name)) {
                    errors[errors.length] = "You must enter a valid name."
                }
                if (form.txtPassword.value != form.txtConfirm.value) {
                    errors[errors.length] = "Please check that you've entered and confirmed your password!"
                }
                if (errors.length > 0) {
                    reportErrors(errors);
                    return false;
                }

                return true;
            }

            function reportErrors(errors) {
                var msg = "Please Enter Valide Data...\n";
                for (var i = 0; i < errors.length; i++) {
                    var numError = i + 1;
                    msg += "\n" + numError + ". " + errors[i];
                }
                alert(msg);
            }
                                            </script>

                                            <div class="main-page signup-page">

                                                <div class="sign-up-row widget-shadow">
                                                    <form method="post" action="ReisterServlet?action=addUser" onSubmit="return validate(this);" name="form">
                                                        <h5>Personal Information :</h5>
                                                        <div class="sign-u">
                                                            <div class="sign-up1">
                                                                <h4>Username* :</h4>
                                                            </div>
                                                            <div class="sign-up2">
                                                                <input type="text" name="txtUsername" required>
                                                            </div>
                                                            <div class="clearfix"> </div>
                                                        </div>
                                                        <div class="sign-u">
                                                            <div class="sign-up1">
                                                                <h4>Name* :</h4>
                                                            </div>
                                                            <div class="sign-up2">
                                                                <input type="text" name="txtName" required>
                                                            </div>
                                                            <div class="clearfix"> </div>
                                                        </div>
                                                        <div class="sign-u">
                                                            <div class="sign-up1">
                                                                <h4>DOB :</h4>
                                                            </div>
                                                            <div class="sign-up2">
                                                                <input type="text" name="txtDob">
                                                            </div>
                                                            <div class="clearfix"> </div>
                                                        </div>
                                                        <div class="sign-u">
                                                            <div class="sign-up1">
                                                                <h4>Tel:</h4>
                                                            </div>
                                                            <div class="sign-up2">
                                                                <input type="text" name="txtTel">
                                                            </div>
                                                            <div class="clearfix"> </div>
                                                        </div>
                                                        <div class="sign-u">
                                                            <div class="sign-up1">
                                                                <h4>Email* :</h4>
                                                            </div>
                                                            <div class="sign-up2">
                                                                <input type="text" name="txtEmail" required>
                                                            </div>
                                                            <div class="clearfix"> </div>
                                                        </div>
                                                        <div class="sign-u">
                                                            <div class="sign-up1">
                                                                <h4>Address:</h4>
                                                            </div>
                                                            <div class="sign-up2">
                                                                <input type="text" name="txtAdd" required>
                                                            </div>
                                                            <div class="clearfix"> </div>
                                                        </div>
                                                        <div class="sign-u">
                                                            <div class="sign-up1">
                                                                <h4>About:</h4>
                                                            </div>
                                                            <div class="sign-up2">
                                                                <input type="text" name="txtAbout" required>
                                                            </div>
                                                            <div class="clearfix"> </div>
                                                        </div>

                                                        <h6>Login Information :</h6>
                                                        <div class="sign-u">
                                                            <div class="sign-up1">
                                                                <h4>Password* :</h4>
                                                            </div>
                                                            <div class="sign-up2">
                                                                <input type="password" name="txtPassword" required>
                                                            </div>
                                                            <div class="clearfix"> </div>
                                                        </div>
                                                        <div class="sign-u">
                                                            <div class="sign-up1">
                                                                <h4>Confirm Pass* :</h4>
                                                            </div>
                                                            <div class="sign-up2">
                                                                <input type="password" name="txtConfirm" required>
                                                            </div>
                                                            <div class="clearfix"> </div>
                                                        </div>
                                                        <div class="sub_home">
                                                            <input type="submit" value="Submit">
                                                            <div class="clearfix"> </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>  
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>
                        <div class="login-body">
                            <form action="LoginServlet?action=login" method="POST">
                                <input type="text" class="user" name="txtUsername" placeholder="Enter your username" required="">
                                <input type="password" name="txtPwd" class="lock" placeholder="Password">
                                <input type="submit" name="Log In" value="Login">
                                <div class="forgot-grid">
                                    <!--                                    <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Remember me</label>-->

                                    <div class="clearfix"> </div>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="login-page-bottom">
                        <h5> - OR -</h5>
                        <div class="social-btn"><a href="#"><i class="fa fa-facebook"></i><i>Sign In with Facebook</i></a></div>
                        <div class="social-btn sb-two"><a href="#"><i class="fa fa-twitter"></i><i>Sign In with Twitter</i></a></div>
                    </div>
                </div>
            </div>

        </div>
        <!-- Classie -->
        <script src="${pageContext.request.contextPath}/Assets/js/classie.js"></script>
        <script>
                                                        var menuLeft = document.getElementById('cbp-spmenu-s1'),
                                                                showLeftPush = document.getElementById('showLeftPush'),
                                                                body = document.body;

                                                        showLeftPush.onclick = function () {
                                                            classie.toggle(this, 'active');
                                                            classie.toggle(body, 'cbp-spmenu-push-toright');
                                                            classie.toggle(menuLeft, 'cbp-spmenu-open');
                                                            disableOther('showLeftPush');
                                                        };

                                                        function disableOther(button) {
                                                            if (button !== 'showLeftPush') {
                                                                classie.toggle(showLeftPush, 'disabled');
                                                            }
                                                        }
        </script>
        <!--scrolling js-->
        <script src="${pageContext.request.contextPath}/Assets/js/jquery.nicescroll.js"></script>
        <script src="${pageContext.request.contextPath}/Assets/js/scripts.js"></script>
        <!--//scrolling js-->
        <!-- Bootstrap Core JavaScript -->
        <script src="${pageContext.request.contextPath}/Assets/js/bootstrap.js"></script>
    </body>
</html>