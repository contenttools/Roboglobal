bind_featured_content_resize = ->
  allVideos = $('.featured-content iframe')
  fluidEl = $('.featured-content')
  fix_image_resize(allVideos, fluidEl) if allVideos.length > 0

bind_blog_news_image_resize = ->
  allVideos = $('.blog-news-image iframe')
  fluidEl = $('.blog-news-image')
  fix_image_resize(allVideos, fluidEl) if allVideos.length > 0

bind_home_video_post_resize = ->
  allVideos = $('.home-video-post iframe')
  fluidEl = $('.home-video-post')
  fix_image_resize(allVideos, fluidEl) if allVideos.length > 0

bind_featured_video_resize = ->
  allVideos = $('.featured-video iframe')
  fluidEl = $('.featured-video')
  fix_image_resize(allVideos, fluidEl) if allVideos.length > 0

fix_image_resize = (allVideos, fluidEl) ->
  allVideos.each ->
    $(this).attr('data-aspectRatio', @height / @width).removeAttr('height').removeAttr 'width'

  $(window).resize(->
    newWidth = fluidEl.width()
    allVideos.each ->
      el = $(this)
      el.width(newWidth).height newWidth * el.attr('data-aspectRatio')

  ).resize()

(($) ->
  window.VideoResize || (window.VideoResize = {})

  VideoResize.init = ->
    init_controls()

  init_controls = ->
    bind_featured_content_resize()
    bind_blog_news_image_resize()
    bind_home_video_post_resize()
    bind_featured_video_resize()
).call(this)
