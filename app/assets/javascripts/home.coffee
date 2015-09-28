healthcare = [["ACCURAY INC", 37.410414, -122.001132], ["CYBERDYNE", 36.077005, 140.08168], ["INTUITIVE SURGICAL INC", 37.373269, -121.991223], ["ELEKTA", 59.346241, 18.038848], ["MAZOR ROBOTICS", 32.477805, 34.94547], ["QIAGEN NV", 51.367014, 6.169721], ["TECAN GROUP AG", 47.256595, 8.685179], ["VARIAN MEDICAL SYSTEMS INC", 37.417032, -122.142878]]

industrials = [["ABB LTD", 47.411284, 8.541605], ["AEROVIRONMENT INC", 34.14093, -118.001949], ["FANUC CORP", 35.445783, 138.841059], ["HIWIN TECH CORP", 24.147736, 120.673648], ["KEYENCE CORP", 34.727389, 135.503045], ["KRONES AG", 48.984076, 12.191563], ["KUKA AG", 48.36905, 10.934], ["LINCOLN ELECTRIC HLDGS INC", 41.588128, -81.519953], ["NABTESCO", 35.680806, 139.740295], ["ROCKWELL AUTOMATION", 43.018846, -87.912771], ["YUSHIN PRECSN EQPT", 34.947147, 135.724585], ["ADVANTECH CO", 60.164443, 24.909423], ["AIDA ENGINEERING", 35.58706, 139.351539], ["AIRTAC INTERNATIONAL GROUP", 25.054159, 121.563862], ["ARCAM AB", 57.670376, 12.0074], ["ATS AUTOMATION TOOLING SYSTEMS", 43.41024, -80.373666], ["CARGOTEC CORP", 60.164443, 24.909423], ["DAIFUKU CO", 34.717683, 135.455692], ["DAIHEN CORP", 34.720012, 135.473579], ["DEERE &amp; CO", 41.476831, -90.424373], ["HARMONIC DRIVE SYSTEMS INC", 35.592966, 139.734547], ["JOHN BEAN TECHNOLOGIES", 41.882323, -87.630142], ["JOHNSON ELEC HLDGS", 22.427025, 114.212244], ["KARDEX AG", 47.414932, 8.552296], ["KONGSBERG GRUPPEN", 59.652177, 9.65005], ["MACDONALD DETTWILER &amp; ASSOC", 49.17537, -123.070419], ["MITSUBISHI ELECTRIC CORP", 35.681183, 139.76377], ["NACHI-FUJIKOSHI CO", 36.684318, 137.233606], ["NORDSON CORP", 41.468993, -81.936681], ["NORTHROP GRUMMAN CORP", 38.867543, -77.215661], ["SCHNEIDER ELECTRIC SA", 48.891123, 2.172874], ["SIEMENS AG", 48.143861, 11.575224], ["SMC CORP", 35.700947, 139.769602], ["TECO ELEC&amp;MACHINE", 25.031235, 121.611195], ["TELEDYNE TECHNOLOGIES INC", 34.197485, -118.905459], ["THK CO LTD", 35.627076, 139.715387], ["TOSHIBA MACHINE CO", 35.113689, 138.872164]]

information_technology = [["COGNEX CORP", 42.302189, -71.355679], ["FARO TECHNOLOGIES INC", 28.738644, -81.362696], ["OMRON CORP", 34.986747, 135.754408], ["YASKAWA ELEC CORP", 33.86888, 130.765404], ["3D SYSTEMS", 34.924867, -81.025078], ["ADLINK TECHNOLOGIES", 42.586548, -71.322771], ["ATMEL CORP", 37.364516, -121.915254], ["BROOKS AUTOMATION", 42.586548, -71.322771], ["DASSAULT SYSTEMS SA", 48.786258, 2.21106], ["E2V TECHNOLOGIES", 51.731779, 0.456254], ["FLIR SYSTEMS INC", 45.320195, -122.764604], ["FMC TECHNOLOGY", 49.81857, 8.62686], ["HOLLYSYS", 39.801904, 116.505262], ["IMMERSION CORP", 37.404904, -121.944097], ["IPG PHOTONICS", 42.081183, -71.88113], ["ISRA VISION AG", 49.81857, 8.62686], ["JENOPTIK AG", 50.928097, 11.580822], ["MICROCHIP TECHNOLOGY INC", 33.30439, -111.882168], ["MOBILEYE", 51.634929, -2.380651], ["NATIONAL INSTRUMENTS CORP", 30.408382, -97.726244], ["NUANCE COMMUNICATIONS INC", 42.484051, -71.193204], ["RENISHAW", 51.634929, -2.380651], ["SFA Engineering", 37.20691, 127.108277], ["STRATASYS", 44.864977, -93.463442], ["TOPCON CORPORATION", 35.773226, 139.703638], ["TRIMBLE NAVIGATION LTD", 37.384982, -122.005501], ["YOKOGAWA ELECTRIC", 35.707305, 139.565119]]

consumer_discretionary = [["IROBOT CORP", 42.504495, -71.244294], ["DENSO CORP", 34.996688, 137.006406], ["LEONI AG", 49.44916, 11.08574]]

energy = [["OCEANEERING INTERNATIONAL", 29.879327, -95.588662], ["HELIX ENERGY", 29.825061, -95.564818]]

other = [["PARROT SA", 48.879072, 2.367493], ["SLM SOLUTIONS", 53.86444, 10.61371], ["TERADYNE", 42.556121, -71.135033], ["TRANSENTERIX", 35.868457, -78.860792]]

bind_scroll_bar = ->
  window.addEventListener 'scroll', (e) ->
    distanceY = window.pageYOffset || document.documentElement.scrollTop
    if distanceY > 0
      $('.navbar-fixed-top').addClass('white-header')
    else
      $('.navbar-fixed-top').removeClass('white-header')

bind_enable_scroll = ->
  $('.map-img').click ->
    map.scrollWheelZoom.enable()

bind_disable_scroll = ->
  $('.map-img').mouseleave ->
    map.scrollWheelZoom.disable()

bind_map_box = ->
  L.mapbox.accessToken = 'pk.eyJ1IjoiY29udGVudHRvb2xzIiwiYSI6ImRjNzE0OTlkYjk2NGJkZWEwMTZmY2QwMTJlYjdjMGI1In0.qKp5IAUQySQHQoT8JBd3ew';
  @map = L.mapbox.map('map', 'examples.map-y7l23tes').setView([
    47.256595
    65.685179
  ], 2)

  map.scrollWheelZoom.disable()
  layers = document.getElementById('menu-ui')

  addLayer = (layer, name, zIndex) ->
    layer.setZIndex(zIndex).addTo map
    link = document.createElement('a')
    link.href = '#'
    link.className = 'active'
    link.innerHTML = name

    link.onclick = (e) ->
      e.preventDefault()
      e.stopPropagation()
      if map.hasLayer(layer)
        map.removeLayer layer
        @className = ''
      else
        map.addLayer layer
        @className = 'active'
      return

    layers.appendChild link
    return

  addfeatures = (feature_array, name, color) ->
    myLayer = L.mapbox.featureLayer()
    features = []
    for val in feature_array
      features.push
        type: 'Feature'
        geometry:
          type: 'Point'
          coordinates: [
            val[2]
            val[1]
          ]
        properties:
          'marker-color': color
          title: [
            val[0]
            name
          ].join(', ')

    myLayer.setGeoJSON
      type: 'FeatureCollection'
      features: features
    return myLayer

  healthcare_layer = addfeatures healthcare, 'Healthcare', '#3B5576'
  industry_layer = addfeatures industrials, 'Industrials', '#4C5D3B'
  information_technology_layer = addfeatures information_technology, 'Information Technology', '#5D4521'
  consumer_discretionary_layer = addfeatures consumer_discretionary, 'Consumer Discretionary', '#2B4C81'
  energy_layer = addfeatures energy, 'Energy', '#3B7F32'
  other_layer = addfeatures other, 'Other', '#3C5679'

  addLayer healthcare_layer, 'Healthcare', 1
  addLayer industry_layer, 'Industrials', 2
  addLayer information_technology_layer, 'Information Technology', 3
  addLayer consumer_discretionary_layer, 'Consumer Discretionary', 4
  addLayer energy_layer, 'Energy', 5
  addLayer other_layer, 'Other', 6

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

(($) ->
  window.Home || (window.Home = {})

  Home.init = ->
    init_controls()

  init_controls = ->
    bind_scroll_bar()
    bind_our_sector_content()
    bind_our_sector_hover()
    bind_map_box()
    bind_enable_scroll()
    bind_disable_scroll()
).call(this)
