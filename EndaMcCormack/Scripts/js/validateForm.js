



$(document).ready(function () {

    var form = $("#finalForm");

    var fname = $("#fName");
    var fnamedesc = $("#fNameDesc");
    var lname = $("#lName");
    var lnamedesc = $("#lNameDesc");
    var email = $("#email");
    var emaildesc = $("#emailDesc");
    var emailVer = $("#emailVer");
    var emailVerdesc = $("#emailVerDesc");

    var password = $("#password");
    var passworddesc = $("#passwordDesc");
    var passwordver = $("#passwordVer");
    var passwordverdesc = $("#passwordVerDesc");
    var dob = $("#datepicker");
    var dobdesc = $("#dobDesc");

    var add1 = $("#add1");
    var add1Desc = $("#add1Desc");
    var add2 = $("#add2");
    var add2Desc = $("#add2Desc");
    var town = $("#town");
    var townDesc = $("#townDesc");
    var country = $("#country");
    var countryDesc = $("#countryDesc");
    var phone = $("#phone");
    var phoneDesc = $("#phoneDesc");

    fname.blur(validatefname);
    lname.blur(validatelname);
    email.blur(validateemail);
    emailVer.blur(validateemailVer);

    password.blur(validatepassword);
    passwordver.blur(validatepasswordver);
    dob.blur(validationdob);

    add1.blur(validateadd1);
    add2.blur(validateadd2);
    town.blur(validatetown);
    country.blur(validatecountry);
    phone.blur(validatephone);

    fname.keyup(validatefname);
    lname.keyup(validatelname);
    email.keyup(validateemail);
    emailVer.keyup(validateemailVer);

    password.keyup(validatepassword);
    passwordver.keyup(validatepasswordver);
    dob.keyup(validationdob);

    add1.keyup(validateadd1);
    add2.keyup(validateadd2);
    town.keyup(validatetown);
    country.keyup(validatecountry);
    phone.keyup(validatephone);

    form.submit(function () {
        if (validateName() & validateEmail() & validatePass1() & validatePass2() & validateMessage())
            return true
        else
            return false;
    });


    function validatefname() {

        if (fname.val().length < 3) {
            fname.addClass("error");
            fnamedesc.text("Minimum of 3 letter names");
            fnamedesc.addClass("error");
            return false;
        }
        else {
            fname.removeClass("error");
            fnamedesc.text("");
            fnamedesc.removeClass("error");
            fname.addClass("pass");
            return true;
        }

    }

    function validatelname() {

        if (lname.val().length < 3) {
            lname.addClass("error");
            lnamedesc.text("Minimum of 3 letter names");
            lnamedesc.addClass("error");
            return false;
        }
        else {
            lname.removeClass("error");
            lnamedesc.text("");
            lnamedesc.removeClass("error");
            lname.addClass("pass");
            return true;
        }

    }

    function validateemail() {

        var filter = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);

        if (filter.test(email.val())) {
            email.removeClass("error");
            emaildesc.text("");
            emaildesc.removeClass("error")
            email.addClass("pass");
            return true;
        }
        else {
            email.removeClass("pass");
            email.addClass("error");
            emaildesc.text("Please enter a valid email");
            emaildesc.addClass("error");
            return false;
        }

    }
    function validateemailVer() {
        if (email.val() != emailVer.val()) {
            emailVer.addClass("error");
            emailVerdesc.text("email addresses do not match");
            emailVerdesc.addClass("error");
            return false;
        }
        else {
            emailVer.removeClass("error");
            emailVerdesc.text("email address Confirmed");
            emailVerdesc.removeClass("error");
            emailVer.addClass("pass");
            return true;
        }

    }

    function validatepassword() {
        if (password.val().length < 5) {
            password.addClass("error");
            passworddesc.text("Invalid Password, Min 5 characters Letters and Numbers");
            passworddesc.addClass("error");
            return false;
        }
        else {
            password.removeClass("error");
            passworddesc.text("Valid Password");
            passworddesc.removeClass("error");
            password.addClass("pass");
            return true;
        }

    }

    function validatepasswordver() {

        if (passwordver.val() != password.val()) {
            passwordver.addClass("error");
            passwordverdesc.text("Passowrds do not match");
            passwordverdesc.addClass("error");
            return false;
        }
        else {
            passwordver.removeClass("error");
            passwordverdesc.text("Passwords Confirmed");
            passwordverdesc.removeClass("error");
            passwordver.addClass("pass");
            return true;
        }

    }
    function validationdob() {
        if (dob.val() != "") {
            dob.addClass("error");
            dobdesc.text("not a valid date");
            dobdesc.addClass("error");
            return false;
        }
        else {
            dob.removeClass("error");
            dobdesc.text("");
            dobdesc.removeClass("error");
            dob.addClass("pass");
            return true;
        }

    }

    function validateadd1() {
        if (add1.val().length < 3) {
            add1.addClass("error");
            add1Desc.text("Minimum of 3 letter names");
            add1Desc.addClass("error");
            return false;
        }
        else {
            add1.removeClass("error");
            add1Desc.text("");
            add1Desc.removeClass("error");
            add1.addClass("pass");
            return true;
        }

    }

    function validateadd2() {
        if (add2.val().length < 3) {
            add2.addClass("error");
            add2Desc.text("Minimum of 3 letter names");
            add2Desc.addClass("error");
            return false;
        }
        else {
            add2.removeClass("error");
            add2Desc.text("");
            add2Desc.removeClass("error");
            add2.addClass("pass");
            return true;
        }

    }

    function validatetown() {
        if (town.val().length < 3) {
            town.addClass("error");
            townDesc.text("Minimum of 3 letter towns");
            townDesc.addClass("error");
            return false;
        }
        else {
            town.removeClass("error");
            townDesc.text("");
            townDesc.removeClass("error");
            town.addClass("pass");
            return true;
        }

    }

    function validatecountry() {
        if (country.val().length < 3) {
            country.addClass("error");
            countryDesc.text("Minimum of 3 letter Countries");
            countryDesc.addClass("error");
            return false;
        }
        else {
            country.removeClass("error");
            countryDesc.text("");
            countryDesc.removeClass("error");
            country.addClass("pass");
            return true;
        }

    }

    function validatephone() {
        var filter = /^([0-9]{10})$/;
        //If its a valid email
        if (filter.test(phone.val())) {
            phone.removeClass("error");
            phoneDesc.text("");
            phoneDesc.removeClass("error")
            phone.addClass("pass");
            return true;
        }
            //If not valid
        else {
            phone.removeClass("pass");
            phone.addClass("error");
            phoneDesc.text("Please enter a valid number");
            phoneDesc.addClass("error");
            return false;
        }

    }
});

