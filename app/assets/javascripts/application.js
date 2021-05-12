// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.

//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require jquery
//= require rails-ujs
//= require moment
//= require fullcalendar
//= require activestorage
// require turbolinks
//= require_tree .

$(function(){
  $('#calendar').fullCalendar({
  //   eventSources : [
  //   {
  //     googleCalendarApiKey: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
  //     googleCalendarId: 'japanese__ja@holiday.calendar.google.com',

  //     rendering: 'background',
  //     color:"#ffd0d0"
  //   }
  // ],
    events: "member/matters.json",
    titleFormat: "スケジュール　YYYY年　M月",
    dayNamesShort: ["日", "月", "火", "水", "木", "金", "土"],
    header: {
      left: "",
      center: "title",
      right: "today prev,next"
    },
    eventColor: "#26A69A",
    eventTextColor: "#FFFFFF",
    eventRender: function(event, element) {
      element.css("font-size", "0.8em");
      element.css("padding", "5px");
    }
  });
});
