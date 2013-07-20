
mark_valid = (element) ->
  cgroup = element.parents('.control-group')
  cgroup.find(".unvalid").addClass('hide')
  cgroup.removeClass('error')

mark_invalid = (element) ->
  cgroup = element.parents('.control-group')
  # Todo: lookup and set per-validator message round here
  cgroup.find(".unvalid").removeClass('hide')
  cgroup.addClass('error')

validators =
  presence: (element) ->
    if element.attr('type') == 'radio' || element.attr('type') == 'checkbox'
      $('[name="'+element.attr('name')+'"]:checked').size() != 0
    else
      element.val() != ""
  confirm: (element) ->
    sibling = /confirm_(.+)/.exec(element.attr('name'))[1]
    element.val() == $('[name="'+sibling+'"]').val()

window.add_validator = (name,method) ->
  validators[name] = method

# Todo: replace window with better
window.humidor = (on_valid,un_valid) ->
  page_valid = true
  $('[validate]').each( (k,v) ->
    element = $(v)
    # Todo: multi condition please
    condition = element.attr('validate')
    if validators[condition](element)
      mark_valid(element)
    else
      mark_invalid(element)
      page_valid = false
      # jquery each halts on false
      true
  )
  if page_valid
    on_valid()
  else
    un_valid()


