getIpAndSendFeeling = (sad)->
  $.get "http://freegeoip.net/json/", (response)-> 
    data    = {feeling: {sad:sad, ip:response.ip, country_name:response.country_name, country_code:response.country_code }}
    message = $("input#sad-message").val()
    if message != ""
      data["feeling"]["message"] = message
    createFeeling(data)

createFeeling = (nData)->
  $.ajax {
      type:       "POST",
      url:        "/feelings"
      data:       nData,
      beforeSend: -> 
      success:    (response)-> alertify.success "Your sadness is now global :(",
      error:      (xhr,ajaxOptions, error)-> alertify.error "We have problems. Please Try Again! ",
      dataType:   "JSON"
    }

$(document).ready ->
  $("#btnSad").on "click", (e) ->
    e.preventDefault()
    getIpAndSendFeeling(true)

  $("#btnHappy").on "click", (e) ->
    e.preventDefault()
    getIpAndSendFeeling(false)

  $("input#sad-message").on "keypress", (e)->
    if e.which == 13
      e.preventDefault()
      getIpAndSendFeeling(true)
  loadData()