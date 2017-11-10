// This is the manifest file for /static/countdown

var dateNow = new Date();
var dateRelease = Date.parse($('.your-clock').data('date'));

var dif = dateRelease - dateNow.getTime();

var secondsToRelease = dif / 1000;

if (secondsToRelease <= 0) {
    console.log(secondsToRelease, $('#active-campaign').length)
    window.location = $('#active-campaign').attr('href');
} else {
    $('body').removeClass('hide');
}

var clock = $('.your-clock').FlipClock(secondsToRelease, {
    clockFace: 'DailyCounter',
    countdown: true
});