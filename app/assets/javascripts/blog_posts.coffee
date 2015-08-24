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

bind_attachment_choose_button = ->
  $('.chosen_attachment').click ->
    $('#attached_image_id').val($(this).attr('id'))
    $.colorbox.close()
    $('.attached_image').attr('src', $(this).parent().parent().find('img').attr('src'));
    $('.remove_image').removeClass("hide")

bind_remove_image = ->
  $(".remove_image").click ->
    $('.attached_image').attr('alt', '')
    $('.attached_image').attr('src', '')
    $('#attached_image_id').val('')
    $('.remove_image').addClass('hide')

(($) ->
  window.Blog || (window.Blog = {})

  Blog.init = ->
    init_controls()

  init_controls = ->
    bind_date_picker()
    bind_attachment_choose_button()
    bind_remove_image()
).call(this)
