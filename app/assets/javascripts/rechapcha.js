<script src="https://www.google.com/recaptcha/api.js?render=6LeqmN0UAAAAAFaPPqyVQzL1RaW40VAa-AxTWFGj"></script>
grecaptcha.ready(function () {
    grecaptcha.execute('6LeqmN0UAAAAAFaPPqyVQzL1RaW40VAa-AxTWFGj', { action: 'contact' }).then(function (token) {
        var recaptchaResponse = document.getElementById('recaptchaResponse');
        recaptchaResponse.value = token;
    });
});
