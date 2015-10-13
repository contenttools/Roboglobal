menu_button = ->
  $(".navbar-toggle").click (e) ->
    $(".nav_lines").toggle();
    $(".nav_x").toggle();

hide_notification = ->
  setTimeout (->
    $(".alert, .alert-success, alert-danger").fadeOut(500)
  ), 4000

$ ->
  menu_button()
  hide_notification()
