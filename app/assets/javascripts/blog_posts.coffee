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

bind_pdf_attachment_choose_button = ->
  $('.chosen_pdf_attachment').click ->
    $('#attached_file_id').val($(this).attr('id'))
    $.colorbox.close()
    $('.attached_file_pdf').attr('src', $(this).parent().parent().find('img').attr('src'));
    alert $(this).parent().parent().find('img').attr('src')
    $('.remove_file').removeClass("hide")

bind_remove_file = ->
  $(".remove_file").click ->
    $('.attached_file_pdf').attr('alt', '')
    $('.attached_file_pdf').attr('src', '')
    $('#attached_file_id').val('')
    $('.remove_file').addClass('hide')

(($) ->
  window.Blog || (window.Blog = {})

  Blog.init = ->
    init_controls()

  init_controls = ->
    bind_date_picker()
    bind_attachment_choose_button()
    bind_remove_image()
    bind_pdf_attachment_choose_button()
    bind_remove_file()
).call(this)
