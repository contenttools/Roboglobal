healthcare = [['Accuray Inc', 37.410414, -122.001132], ['CYBERDYNE Inc', 36.077005, 140.08168], ['Elekta AB', 59.346241, 18.038848], ['Intuitive Surgical Inc', 37.373269, -121.991223], ['Mazor Robotics Ltd', 32.477805, 34.94547], ['QIAGEN NV', 51.367014, 6.169721], ['Tecan Group AG', 47.256595, 8.685179], ['Varian Medical Systems Inc', 37.417032, -122.142878]]

agriculture = [["Deere & Co", 41.476831, -90.424373]]

integrations = [["ABB Ltd", 47.411284, 8.541605], ["Rockwell Automation Inc", 43.018846, -87.912771], ["Schneider Electric SE", 48.891123, 2.172874], ["Siemens AG", 48.143861, 11.575224]]

surveillance_security = [['Aerovironment Inc', 34.14093, -118.001949], ['MacDonald Dettwiler & Associates Ltd', 49.17537, -123.070419], ['Northrop Grumman Corp', 38.867543, -77.215661], ['Elbit Systems Limited', 32.789281, 34.958475]]

processing = [['Cognex Corp', 42.302189, -71.355679], ['Dassault Systemes', 48.786258, 2.21106], ['e2v technologies PLC', 51.731779, 0.456254], ['FARO Technologies Inc', 28.738644, -81.362696], ['FLIR Systems Inc', 45.320195, -122.764604], ['Isra Vision AG', 49.81857, 8.62686], ['Ambarella Inc.', 37.379131, -121.961327], ['Mobileye NV', 31.803376, 35.213166], ['National Instruments Corp', 30.408382, -97.726244], ['Nuance Communications Inc', 42.484051, -71.193204], ['Trimble Navigation Ltd', 37.384982, -122.005501]]

manufacturing_industrial_automation =  [["Aida Engineering Ltd", 35.58706, 139.351539], ["ATS Automation Tooling Systems Inc", 43.41024, -80.373666], ["Brooks Automation Inc", 42.586548, -71.322771], ["Daihen Corp", 34.720012, 135.473579], ["Denso Corp", 34.996688, 137.006406], ["FANUC Corp", 35.445783, 138.841059], ["Krones AG", 48.984076, 12.191563], ["KUKA AG", 48.36905, 10.934], ["Nachi-Fujikoshi Corp", 36.684318, 137.233606], ["Nordson Corp", 41.468993, -81.936681], ["Teradyne Inc", 34.20247, -118.874143], ["Toshiba Machine Co Ltd", 35.113689, 138.872164], ["Yaskawa Electric Corp", 33.86888, 130.765404], ["Yushin Precision Equipment Co Ltd", 34.947147, 135.724585]]

actuation = [['Airtac International Group', 25.054159, 121.563862], ['Harmonic Drive Systems Inc', 35.592966, 139.734547], ['Hiwin Technologies Corp', 24.147736, 120.673648], ['IPG Photonics Corp', 42.081183, -71.88113], ['Jenoptik AG', 50.928097, 11.580822], ['Lincoln Electric Holdings Inc', 41.588128, -81.519953], ['Nabtesco Corp', 35.680806, 139.740295], ['SMC Corp/Japan', 35.700947, 139.769602], ['Teco Electric and Machinery Co Ltd', 25.031235, 121.611195], ['THK Co Ltd', 35.627076, 139.715387], ['Delta Electronics Inc.', 24.9852237, 121.32377910000002]]

consumer_products = [["iRobot Corp", 42.504495, -71.244294], ["Parrot SA", 48.879072, 2.367493]]

sensing = [["Immersion Corp", 37.404904, -121.944097], ["Keyence Corp", 34.727389, 135.503045], ["Omron Corp", 34.986747, 135.754408], ["Renishaw PLC", 51.634929, -2.380651], ["Teledyne Technologies Inc", 34.197485, -118.905459]]

energy = [["FMC Technologies Inc", 29.93588, -95.51281], ["Helix Energy Solutions Group Inc", 29.825061, -95.564818], ["Kongsberg Gruppen ASA", 59.652177, 9.65005], ["Oceaneering International Inc", 29.879327, -95.588662]]

printing = [["3D Systems Corp", 34.924867, -81.025078], ["Arcam AB", 57.670376, 12.0074], ["SLM Solutions Group AG", 53.86444, 10.61371], ["Stratasys Ltd", 44.864977, -93.463442]]

logistics_automation = [["Cargotec Oyj", 60.164443, 24.909423], ["Daifuku Co Ltd", 34.716295, 135.457769], ["John Bean Technologies Corp", 41.882323, -87.630142], ["Kardex AG", 47.414932, 8.552296], ['Amano Corp', 35.513131, 139.629494], ['Zebra Technologies', 42.187720, -87.933466]]

computing = [['Adlink Technology Inc', 24.994446, 121.497029], ['NVdia Corp.', 37.370823, -121.964025], ['Hollysys Automation Technologies Ltd', 39.801904, 116.505262], ['Microchip Technology Inc', 33.30439, -111.882168], ['Mitsubishi Electric Corp', 35.681183, 139.76377], ['Topcon Corp', 35.773226, 139.703638], ['Yokogawa Electric Corp', 35.707305, 139.565119], ['Advantech Co. LTD', 25.072468, 121.577289]]

bind_enable_scroll = ->
  $('.map-img').click ->
    map.scrollWheelZoom.enable()

window.tabletcheck = ->
  check = false
  ((a) ->
    if /(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino|android|ipad|playbook|silk/i.test(a) or /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0, 4))
      check = true
    return
  ) navigator.userAgent or navigator.vendor or window.opera
  check

window.mobilecheck = ->
  check = false
  ((a) ->
    if /(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a) or /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0, 4))
      check = true
    return
  ) navigator.userAgent or navigator.vendor or window.opera
  check


initialize_mapbox = ->
  if window.mobilecheck()
    return L.mapbox.map('map', 'examples.map-y7l23tes').setView([47.256595, 135.685179], 1)
  else if window.tabletcheck()
    return L.mapbox.map('map', 'examples.map-y7l23tes').setView([47.256595, 135.685179], 2)
  else
    return L.mapbox.map('map', 'examples.map-y7l23tes').setView([47.256595, 65.685179], 2)

bind_disable_drag_for_mobile = ->
  if window.mobilecheck()
    if (map.tap)
      map.tap.disable()
    map.dragging.disable()
    map.scrollWheelZoom.enable()

bind_disable_scroll = ->
  $('.map-img').mouseleave ->
    map.scrollWheelZoom.disable()

bind_map_box = ->
  L.mapbox.accessToken = 'pk.eyJ1IjoiY29udGVudHRvb2xzIiwiYSI6ImRjNzE0OTlkYjk2NGJkZWEwMTZmY2QwMTJlYjdjMGI1In0.qKp5IAUQySQHQoT8JBd3ew';
  @map = initialize_mapbox()
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

  healthcare_layer = addfeatures healthcare, 'Healthcare', '#FFFFFF'
  agriculture_layer = addfeatures agriculture, 'Agriculture', '#3B5577'
  integrations_technology_layer = addfeatures integrations, 'Integrations', '#4C5D3B'
  surveillance_security_layer = addfeatures surveillance_security, 'Surveillance/Security', '#5D4422'
  processing_layer = addfeatures processing, 'Processing', '#2A4C80'
  manufacturing_industrial_automation_layer = addfeatures manufacturing_industrial_automation, 'Manufacturing & Industrial Automation', '#33446E'
  actuation_layer = addfeatures actuation, 'Actuation', '#3B7F33'
  consumer_products_layer = addfeatures consumer_products, 'Consumer Products', '#442255'
  sensing_layer = addfeatures sensing, 'Sensing', '#44557F'
  energy_layer = addfeatures energy, 'Energy', '#5B1638'
  printing_layer = addfeatures printing, '3D Printing', '#AE9833'
  logistics_automation_layer = addfeatures logistics_automation, 'Logistics Automation', '#44ACCA'
  computing_layer = addfeatures computing, 'Computing', '#CA4447'

  addLayer healthcare_layer, 'Healthcare', 1
  addLayer agriculture_layer, 'Agriculture', 2
  addLayer integrations_technology_layer, 'Integrations', 3
  addLayer surveillance_security_layer, 'Surveillance/Security', 4
  addLayer processing_layer, 'Processing', 5
  addLayer manufacturing_industrial_automation_layer, 'Manufacturing & Industrial Automation', 6
  addLayer actuation_layer, 'Actuation', 7
  addLayer consumer_products_layer, 'Consumer Products', 8
  addLayer sensing_layer, 'Sensing', 9
  addLayer energy_layer, 'Energy', 10
  addLayer printing_layer, '3D Printing', 11
  addLayer logistics_automation_layer, 'Logistics Automation', 12
  addLayer computing_layer, 'Computing', 13

(($) ->
  window.MapLoad || (window.MapLoad = {})

  MapLoad.init = ->
    bind_map_box()
    bind_enable_scroll()
    bind_disable_scroll()
    bind_disable_drag_for_mobile()
).call(this)
