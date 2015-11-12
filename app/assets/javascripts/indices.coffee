# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
bind_pdf_attachment_choose_button = ->
  $('.chosen_pdf_attachment').click ->
    $('#attached_file_id').val($(this).attr('id'))
    $.colorbox.close()
    $('.attached_file_pdf').attr('src', $(this).parent().parent().find('img').attr('src'));
    $('.remove_file').removeClass("hide")

bind_remove_file = ->
  $(".remove_file").click ->
    $('.attached_file_pdf').attr('alt', '')
    $('.attached_file_pdf').attr('src', '')
    $('#attached_file_id').val('')
    $('.remove_file').addClass('hide')

(($) ->
  window.Indices || (window.Indices = {})

  Indices.init = ->
    init_controls()

  init_controls = ->
    bind_pdf_attachment_choose_button()
    bind_remove_file()
).call(this)
