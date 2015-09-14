bind_application_content_click = ->
  $(".applications").click (e) ->
    target_content = $(this).attr('class').split(' ')[0]
    $(this).parent().find('.active').removeClass("active")
    $(this).addClass("active")
    target_content = target_content + "-application"
    $(".active-application").removeClass("active-application").addClass("hidden-application")
    $(".#{target_content}").removeClass("hidden-application").addClass("active-application")

bind_technology_content_click = ->
  $(".technologies").click (e) ->
    target_content = $(this).attr('class').split(' ')[0]
    $(this).parent().find('.active').removeClass("active")
    $(this).addClass("active")
    target_content = target_content + "-technology"
    $(".active-technology").removeClass("active-technology").addClass("hidden-technology")
    $(".#{target_content}").removeClass("hidden-technology").addClass("active-technology")


(($) ->
  window.OurSectors || (window.OurSectors = {})

  OurSectors.init = ->
    bind_application_content_click()
    bind_technology_content_click()
).call(this)
