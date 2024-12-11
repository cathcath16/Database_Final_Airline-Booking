$("#submit").click(function () {
    var result = true;
    $(".error").remove();
    
    var password_ = $("#password").val();
    var passwordError = checkFieldLength(password_, 8, 16, "Password should be between 8 to 16 characters.");
    if (passwordError) {
        $('#password').after(passwordError);
        result = false;
    }

    var user_name = $("#username").val();
    if (user_name.length < 1) {
        $("#username").after("<span class='error'>This field is required.</span>");
        result = false;
    }

    var phone_no_ = $('#phone_no').val();
    var phoneError = phone_no_validation(phone_no_);
    if (phoneError) {
        $("#phone_no").after(phoneError);
        result = false;
    }

    var first_name_ = $('#first_name').val();
    if (first_name_.length < 1) {
        $("#first_name").after("<span class='error'>This field is required.</span>");
        result = false;
    }

    var last_name_ = $('#last_name').val();
    if (last_name_.length < 1) {
        $("#last_name").after("<span class='error'>This field is required.</span>");
        result = false;
    }

    var emailId = $("#email_id").val();
    if (emailId.length < 1) {
        $("#email_id").after("<span class='error'>This field is required.</span>");
        result = false;
    } else {
        var regEx = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
        var validEmail = regEx.test(emailId);
        if (!validEmail) {
            $("#email_id").after("<span class='error'>Please Enter valid Email ID</span>");
            result = false;
        }
    }

    if (result) {
        $.post("SignUp.php", {
            username: $("#username").val(),
            password: $("#password").val(),
            email_id: $("#email_id").val(),
            first_name: $('#first_name').val(),
            last_name: $('#last_name').val(),
            phone_no: $('#phone_no').val()
        }, function(data) {
            $("div.result").html(data);  // Display server response
        });
    }
});


