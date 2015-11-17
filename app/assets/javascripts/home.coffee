bind_scroll_bar = ->
  window.addEventListener 'scroll', (e) ->
    distanceY = window.pageYOffset || document.documentElement.scrollTop
    if distanceY > 0
      $('.navbar-fixed-top').addClass('white-header')
    else
      $('.navbar-fixed-top').removeClass('white-header')


bind_our_sector_content = ->
  $(".sector-circule").click (e) ->
    target_content = $(this).attr('class').split(' ')[0];
    target_content = target_content + "-content"
    $(".active-content").removeClass("active-content").addClass("hidden-content")
    $(".#{target_content}").removeClass("hidden-content").addClass("active-content")

sector_hover_in = ->
  $(this).siblings('span').addClass 'fixed-overlay'
  return

sector_hover_out = ->
  $(this).siblings('span').removeClass 'fixed-overlay'
  return

bind_our_sector_hover = ->
  $('.sector-effect .text').hover sector_hover_in, sector_hover_out


$(window).load (e) ->
  video = document.getElementById("home_vid")
  if video
    video.play()

(($) ->
  window.Home || (window.Home = {})

  Home.init = ->
    init_controls()

  init_controls = ->
    bind_scroll_bar()
    bind_our_sector_content()
    bind_our_sector_hover()
).call(this)
