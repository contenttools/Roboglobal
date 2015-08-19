bind_scroll_bar = ->
  window.addEventListener 'scroll', (e) ->
    distanceY = window.pageYOffset || document.documentElement.scrollTop
    console.log distanceY
    if distanceY > 0
      $('.navbar-fixed-top').addClass('white-header')
    else
      $('.navbar-fixed-top').removeClass('white-header')

(($) ->
  window.Home || (window.Home = {})

  Home.init = ->
    init_controls()

  init_controls = ->
    bind_scroll_bar()
).call(this)
