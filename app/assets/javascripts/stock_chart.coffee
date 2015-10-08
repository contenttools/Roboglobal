bind_stock_chart = ->
    $(document).ready ->
      $.ajax "/index_records/stock_chart_data?type=#{get_type()}",
        type: 'GET'
        contentType: "application/json; charset=utf-8"
        success: (data, textStatus, jqXHR) ->
          $("##{get_type()}_stock_chart").highcharts "StockChart",
            rangeSelector:
              selected: 5

            title:
              text: ""
            plotOptions:
              line:
                turboThreshold: 0
            series: [
              name: "Robo"
              data: data
              tooltip:
                valueDecimals: 2,
                pointFormat: '{series.name}: <b>{point.y}</b><br/> <b>{point.percentage}%</b><br/>',
            ]

set_type = (type) ->
  this.type = type

get_type = (type) ->
  this.type

(($) ->
  window.StockChart || (window.StockChart = {})

  StockChart.init = (type) ->
    set_type(type)
    init_controls()

  init_controls = ->
    bind_stock_chart()
).call(this)
