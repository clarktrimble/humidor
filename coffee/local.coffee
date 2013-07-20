
on_valid = ->
  $('.alert-error').hide()
  $(':input').prop('disabled',true)
  true

un_valid = ->
  $('.alert-error').show()
  scroll(0,0)
  false

sixchar = (element) ->
  pw = element.val()
  /[A-Z]/.test(pw) and /[a-z]/.test(pw) and /\d/.test(pw) and /.{7}/.test(pw)
  /[A-Z]/.test(pw) and /[a-z]/.test(pw) and /\d/.test(pw)
  # Todo: reenable teeth (also in server)
  true

mailp = (element) ->
  /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(element.val())

$ ->
  add_validator('sixchar', sixchar)
  add_validator('mailp', mailp)
  $('form.dalibor').submit ->
    humidor(on_valid, un_valid)

