bind_scroll_bar = ->
  window.addEventListener 'scroll', (e) ->
    distanceY = window.pageYOffset || document.documentElement.scrollTop
    if distanceY > 0
      $('.navbar-fixed-top').addClass('white-header')
    else
      $('.navbar-fixed-top').removeClass('white-header')

(($) ->
  window.HeaderScroll || (window.HeaderScroll = {})

  HeaderScroll.init = ->
    init_controls()

  init_controls = ->
    bind_scroll_bar()
).call(this)
