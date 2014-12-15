/**
 * Created by lukas on 02/12/14.
 */
function showPassword() {

    var key_attr = $('#key').attr('type');

    if (key_attr != 'text') {

        $('.checkbox').addClass('show');
        $('#key').attr('type', 'text');

    } else {

        $('.checkbox').removeClass('show');
        $('#key').attr('type', 'password');

    }

}

function checkEmail() {
    var inputBox = document.getElementById('email');

    inputBox.onkeyup = function () {
        if (inputBox.value.contains("@")) {
            filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            if (filter.test(inputBox.value)) {
                document.getElementById('emailsuccess').classList.remove('hidden')
                document.getElementById('emailwrong').classList.add('hidden')
                document.getElementById('emailcontent').classList.add('text-success')
                document.getElementById('emailcontent').classList.remove('text-red')
                document.getElementById('emailcontent').innerHTML = "Email-Adresse ist korrekt";
            } else {
                document.getElementById('emailsuccess').classList.add('hidden')
                document.getElementById('emailwrong').classList.remove('hidden')
                document.getElementById('emailcontent').classList.remove('text-success')
                document.getElementById('emailcontent').classList.add('text-red')
                document.getElementById('emailcontent').innerHTML = "Email Unvollständig: Hoster fehlt"
            }

        } else {
            document.getElementById('emailsuccess').classList.add('hidden')
            document.getElementById('emailwrong').classList.remove('hidden')
            document.getElementById('emailcontent').classList.remove('text-success')
            document.getElementById('emailcontent').classList.add('text-red')
            document.getElementById('emailcontent').innerHTML = "Email Unvollständig: @ fehlt!"
        }
    }
}

function checkPassword() {
    var inputBox = document.getElementById('key');

    inputBox.onkeyup = function () {
        // at least one number, one lowercase and one uppercase letter
        // at least six characters
        var re = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}/;

        if (re.test(inputBox.value)) {
            document.getElementById('keysuccess').classList.remove('hidden')
            document.getElementById('keywrong').classList.add('hidden')
            document.getElementById('keycontent').classList.add('text-success')
            document.getElementById('keycontent').classList.remove('text-red')
            document.getElementById('keycontent').innerHTML = "Passwort ist konform";
        } else {
            document.getElementById('keysuccess').classList.add('hidden')
            document.getElementById('keywrong').classList.remove('hidden')
            document.getElementById('keycontent').classList.remove('text-success')
            document.getElementById('keycontent').classList.add('text-red')
            document.getElementById('keycontent').innerHTML = "Passwort is unkomform"
        }
    }
}

