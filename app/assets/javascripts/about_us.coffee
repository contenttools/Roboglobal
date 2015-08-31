bind_map = ->
  handler = Gmaps.build('Google')
  handler.buildMap {
    provider: {}
    internal: {
      id: 'basic_map'
    }
  }, ->
    markers = handler.addMarkers([ {
      'lat': 32.7933870
      'lng': -96.8046520
      'zoom': 8
    } ])
    handler.bounds.extendWith markers
    handler.fitMapToBounds()
    handler.getMap().setZoom(17);


(($) ->
  window.AboutUs || (window.AboutUs = {})

  AboutUs.init = ->
    init_controls()

  init_controls = ->
    bind_map()
).call(this)
