bind_email_validator = ->
  $("input[type='email']").on 'input', (e) ->
    emailPattern = /^([\w.-]+)@([\w.-]+)\.([a-zA-Z.]{2,6})$/i
    email = $(this).val()
    unless email.match emailPattern
      e.target.setCustomValidity 'Please enter a valid email like name@provider.com'
    else
      e.target.setCustomValidity ''

bind_form_validator = ->
  $('#contact-submit').click (event) ->
    if !!navigator.userAgent.match(/Version\/[\d\.]+.*Safari/)
      $('div.validation').remove()
      if $('#contact_name').val().length == 0
        $('#contact_name').parent().before '<div class=\'validation\' style=\'color:red;margin-bottom: 10px;\'>Please enter name</div>'
        return false
      emailPattern = /^([\w.-]+)@([\w.-]+)\.([a-zA-Z.]{2,6})$/i;
      if $('#contact_email').val().length == 0 or not $('#contact_email').val().match(emailPattern)
        $('#contact_email').parent().before '<div class=\'validation\' style=\'color:red;margin-bottom: 10px;\'>Please enter a valid emaila address</div>'
        return false
      if $('#contact_phone').val().length == 0
        $('#contact_phone').parent().before '<div class=\'validation\' style=\'color:red;margin-bottom: 10px;\'>Please enter phone number</div>'
        return false
      if $('#contact_message').val().length == 0
        $('#contact_message').before '<div class=\'validation\' style=\'color:red;margin-bottom: 10px;\'>Please type a message</div>'
        return false
    return true

(($) ->
  window.EmailValidator || (window.EmailValidator = {})

  EmailValidator.init = ->
    bind_email_validator()
    bind_form_validator()
).call(this)
