# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
bind_date_picker = ->
  $('.datepicker').datepicker({
    format: "yyyy/mm/dd",
    todayBtn: true,
    autoclose: true,
    todayHighlight: true,
});

(($) ->
  window.Blog || (window.Blog = {})

  Blog.init = ->
    init_controls()

  init_controls = ->
    bind_date_picker()
).call(this)
