menu_button = ->
  $(".navbar-toggle").click (e) ->
    $(".nav_lines").toggle();
    $(".nav_x").toggle();

$ ->
  menu_button()
