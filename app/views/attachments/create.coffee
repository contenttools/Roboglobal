$.colorbox.close();
$('#attached_image_id').val(<%= @attachment.id %>)
$('.attached_image').attr('src','<%= @url %>')
$('.remove_image').removeClass("hide")
