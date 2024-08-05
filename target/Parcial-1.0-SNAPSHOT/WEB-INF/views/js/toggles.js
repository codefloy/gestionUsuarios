function toggleResetPswd(e){
    e.preventDefault();
    $('#logreg-forms .form-signin').toggle();
    $('#logreg-forms .form-reset').toggle();
}

function toggleSignUp(e){
    e.preventDefault();
    $('#logreg-forms .form-signin').toggle();
    $('#logreg-forms .form-signup').toggle();
}

$(()=>{
    // Login Register Form
//    $('#logreg-forms #forgot_pswd').click(toggleResetPswd);
//    $('#logreg-forms #cancel_reset').click(toggleResetPswd);
    $('#logreg-forms #btn-signup').click(toggleSignUp);
    $('#logreg-forms #cancel_signup').click(toggleSignUp); //mostrar el login
    //$('#logreg-forms #cancel_signup').click(toggleSignUp); //mostrar el login
});


