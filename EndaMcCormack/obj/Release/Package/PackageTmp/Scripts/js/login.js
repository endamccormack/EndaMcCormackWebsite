function getPasswordHash(PasswordElement, nonceElement, hashElement) {
    var $ = jquery_1_7_2_min;
    var password = jquery_1_7_2_min('#' + PasswordElement).attr('value');
    var nonce = $('#' + nonceElement).attr('value');
    $('#' + hashElement).attr('value', $.sha256(password + nonce));
    $('#' + nonceElement).attr('value', '');

}