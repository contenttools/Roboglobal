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

(($) ->
  window.Home || (window.Home = {})

  Home.init = ->
    init_controls()
    bind_our_sector_content()

  init_controls = ->
    bind_scroll_bar()
).call(this)
