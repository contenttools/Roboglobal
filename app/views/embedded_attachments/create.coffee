$.colorbox.close();
$('#attached_video_id').val(<%= @embedded_attachment.id %>)
$('.attached_video_embedded').html('<%= raw @url %>')
$('.attached_video_embedded').show()
$('.remove_video').removeClass("hide")
