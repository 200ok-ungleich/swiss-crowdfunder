// This is the manifest file for /static/countdown
//= require jquery.countdown

var dateNow = new Date();
var dateRelease = Date.parse($('.your-clock').data('date'));
var dif = dateRelease - dateNow.getTime();

var secondsToRelease = dif / 1000;

var clock = $('.your-clock').FlipClock(secondsToRelease, {
    clockFace: 'DailyCounter',
    countdown: true
});