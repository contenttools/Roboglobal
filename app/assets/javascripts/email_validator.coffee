bind_email_validator = ->
  $("input[type='email']").on 'input', (e) ->
    emailPattern = /^([\w.-]+)@([\w.-]+)\.([a-zA-Z.]{2,6})$/i
    email = $(this).val()
    unless email.match emailPattern
      e.target.setCustomValidity 'Please enter a valid email like name@provider.com'
    else
      e.target.setCustomValidity ''

(($) ->
  window.EmailValidator || (window.EmailValidator = {})

  EmailValidator.init = ->
    bind_email_validator()

).call(this)
