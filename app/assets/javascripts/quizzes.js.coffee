jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('.row').slideUp(300)
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).closest('#add_field_here').before($(this).data('fields').replace(regexp, time))
    #//$(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  #// Scoreable checkbox onclick
  $('#quiz_scoreable_label').click ->
    $('.weight_select').slideToggle(300)
    $('#image_result_box').slideToggle(300)
    $('#image_result_uploader').slideUp(1300)
    $('#quiz_image_result').prop('checked', false) #does the work behind the scenes
    $('#quiz_image_result').next('span').removeClass('checked') #does the work visually to remove the check
    $('#quiz_remove_image').prop('checked', false)
    $('#quiz_remove_image').next('span').removeClass('checked')

  #// Image Result checkbox onclick
  $('#quiz_image_result_label').click ->
    $('#quiz_remove_image').prop('checked', false)
    $('#quiz_remove_image').next('span').removeClass('checked')
    if !$('#quiz_image_result').next('span').hasClass('checked') and $('#image_result_uploader').is(':visible')
      $('#quiz_remove_image').next('span').removeClass('checked')
    else      
      $('#image_result_uploader').slideToggle(300)

  #// Remove Image checkbox onclick
  $("#remove_image_label").click -> 
    if $('#quiz_image_result').is(':checked')
      $('#quiz_image_result').prop('checked', false)
      $('#quiz_image_result').next('span').removeClass('checked')
    else
      $('#quiz_image_result').next('span').addClass('checked')
      $('#quiz_image_result').prop('checked', true)

  $('#header_image_uploader_label').click ->
    $('#header_url_input').slideUp()
    $('#header_image_uploader_input').slideDown()
    $('#current_header_image').slideDown(300)
    $('#current_header_url').slideUp(300)

  $('#header_url_label').click ->
    $('#header_url_input').slideDown()
    $('#header_image_uploader_input').slideUp()
    $('#current_header_image').slideUp(300)
    $('#current_header_url').slideDown(300)

  #// Onload if "Scoreable" is checked
  if $('#quiz_scoreable').is(":checked")
    $('.weight_select').slideDown(0)
    $('#image_result_box').slideDown(0)
  else
    $('.weight_select').slideUp(0)
    $('#image_result_box').slideUp(0)

  #// Onload if "Scoreable" AND "Image Result" are checked
  if $('#quiz_scoreable').is(':checked') and $('#quiz_image_result').is(':checked')
    $('#image_result_uploader').slideDown(0)
  else
    $('#image_result_uploader').slideUp(0)

  if $('#quiz_header_type_image').is(":checked")
    $('#header_url_input').slideUp(0)
    $('#header_image_uploader_input').slideDown(0)
    $('#current_header_image').slideDown(0)
    $('#current_header_url').slideUp(0)
  else    
    $('#header_url_input').slideDown(0)
    $('#header_image_uploader_input').slideUp(0)
    $('#current_header_image').slideUp(0)
    $('#current_header_url').slideDown(0)

  countUnchecked = ->
    n = $(":radio:checked").length
    q = $('.questions > div').length
    if n == q
      $("#submit_button").removeClass("button_disabled").attr "disabled", false
  $("#new_quiz_result").bind "change keyup", ->
    countUnchecked()

