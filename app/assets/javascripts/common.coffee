menu_button = ->
  $(".navbar-toggle").click (e) ->
    $(".nav_lines").toggle();
    $(".nav_x").toggle();

hide_notification = ->
  $(".alert, .alert-success, alert-danger").fadeOut(5000)

$ ->
  menu_button()
  hide_notification()
