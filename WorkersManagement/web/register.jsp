<%@include file="Layout/_header_customer.jsp" %>

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
    <h3 class="title1">SignUp Here</h3>
    <p class="creating">Having hands on experience in creating innovative designs,I do offer design 
        solutions which harness.</p>
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
                    <h4>Confirm Password* :</h4>
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



<%@include file="Layout/_footer.jsp" %>  
