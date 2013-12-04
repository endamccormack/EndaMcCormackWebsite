


var $ = jquery_1_7_2_min;
$(document).ready(function () {

    var form = $("#form1");

    var fname = $("#fName");
    var fnamedesc = $("#fNameDesc");
    var lname = $("#lName");
    var lnamedesc = $("#lNameDesc");
    var email = $("#email");
    var message = $("#message") ;
    var emaildesc = $("#emailDesc");
    var emailVer = $("#emailVer");
    var emailVerdesc = $("#emailVerDesc");
    var message = $("#message");
    var messagedesc = $("#messageDesc");

    fname.blur(enableButton);
    lname.blur(enableButton);
    email.blur(enableButton);
    emailVer.blur(enableButton);
    message.blur(enableButton);

    fname.keyup(enableButton);
    lname.keyup(enableButton);
    email.keyup(enableButton);
    emailVer.keyup(enableButton);
    message.keyup(enableButton);


    function enableButton() {
        if (validatefname() & validatelname() & validateemail() & validateemailVer() & validateMessage())
            // $("#submit").removeAttr('disabled');
            $("#IsValid").val("true");
        else
            $("#IsValid").val("false");
    };


    function validatefname() {

        if (fname.val().length < 3) {
            fname.addClass("error");
            fnamedesc.text("Minimum of 3 letter names");
            $(fnamedesc).slideDown('slow');
            fnamedesc.addClass("error");
            return false;
        }
        else {
            fname.removeClass("error");
            fnamedesc.text("First name meets validation");
            $(fnamedesc).slideUp('slow');
            fnamedesc.removeClass("error");
            fname.addClass("pass");
            return true;
        }

    }

    function validatelname() {

        if (lname.val().length < 3) {
            lname.addClass("error");
            lnamedesc.text("Minimum of 3 letter names");
            $(lnamedesc).slideDown('slow');
            lnamedesc.addClass("error");
            return false;
        }
        else {
            lname.removeClass("error");
            lnamedesc.text("Last name meets validation");
            $(lnamedesc).slideUp('slow');
            lnamedesc.removeClass("error");
            lname.addClass("pass");
            return true;

        }

    }

    function validateemail() {

        var filter = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);

        if (filter.test(email.val())) {
            email.removeClass("error");
            emaildesc.text("Email address meets validation");
            $(emaildesc).slideUp('slow');
            emaildesc.removeClass("error")
            email.addClass("pass");
            return true;
        }
        else {
            email.removeClass("pass");
            email.addClass("error");
            emaildesc.text("Please enter a valid email");
            $(emaildesc).slideDown('slow');
            emaildesc.addClass("error");
            return false;
        }

    }
    function validateemailVer() {
        if (email.val() != emailVer.val()) {
            emailVer.addClass("error");
            emailVerdesc.text("email addresses do not match");
            $(emailVerdesc).slideDown('slow');
            emailVerdesc.addClass("error");
            return false;
        }
        else {
            emailVer.removeClass("error");
            emailVerdesc.text("email address Confirmed");
            $(emailVerdesc).slideUp('slow');
            emailVerdesc.removeClass("error");
            emailVer.addClass("pass");
            return true;
        }
    }

    function validateMessage() {
        if (message.val().length < 1) {
            message.removeClass("pass");
            message.addClass("error");
            messagedesc.text("Please enter some message as it is required");
            $(messagedesc).slideDown('slow');
            messagedesc.addClass("error");
            return false; 
        }
        else {
            message.removeClass("error");
            messagedesc.text("Message entered");
            $(messagedesc).slideUp('slow');
            messagedesc.removeClass("error")
            message.addClass("pass");
            return true;
        }
        

    }
});

