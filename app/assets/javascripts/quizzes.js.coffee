jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()
    if $('#quiz_scoreable').is(":checked")
      $('.weight_select').show()

  $('#quiz_scoreable').click ->
    $('.weight_select').toggle()
    $('#image_result_uploader').hide(150)
    $('#quiz_image_result').prop('checked', false)
    $('.weight_radio_button').prop('checked', false)
  if $('#quiz_scoreable').is(":checked")
    $('.weight_select').show()
    $('#image_result_box').show()
  else
    $('.weight_select').hide()
    $('#image_result_box').hide()

  $('#quiz_image_result').click ->
    $('#image_result_uploader').toggle(150)
    $('.break_lines').toggle(150)
  if $('#quiz_image_result').is(":checked") and $('#quiz_scoreable').is(":checked")
    $('#image_result_uploader').show()
    $('.break_lines').show()
  else
    $('#image_result_uploader').hide()
    $('.break_lines').hide()

  $("#remove_image_box").bind "change keyup mousemove", ->
    if $('#remove_image_box').is(":checked")
      $('#quiz_image_result').prop('checked', false)
    else
      $('#quiz_image_result').prop('checked', true)

  countUnchecked = ->
    n = $(":radio:checked").length
    q = $('.questions > li').length
    if n == q
      $("#submit_button").removeClass("button_disabled").attr "disabled", false
  $("#new_quiz_result").bind "change keyup", ->
    countUnchecked()

  $('#header_image_uploader_radio').click ->
    $('#header_url_input').hide()
    $('#header_image_uploader_input').show()
  $('#header_url_radio').click ->
    $('#header_url_input').show()
    $('#header_image_uploader_input').hide()