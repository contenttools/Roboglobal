$.colorbox.close();
$('#attached_file_id').val(<%= @pdf_attachment.id %>)
$('.attached_file_pdf').attr('src','<%= @url %>')
$('.remove_file').removeClass("hide")
