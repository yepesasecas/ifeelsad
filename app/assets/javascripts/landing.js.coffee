getIpAndSendFeeling = (sad)->
  $.get "http://freegeoip.net/json/", (response)-> 
    data = {feeling: {sad:sad, ip:response.ip, country_name:response.country_name, country_code:response.country_code }}
    createFeeling(data)

createFeeling = (nData)->
  $.ajax {
      type:     "POST",
      url:      "/feelings"
      data:     nData,
      success:  (response)-> alertify.success "Your sadness is now global :(",
      error:    (xhr,ajaxOptions, error)-> alertify.error "We have problems. Please Try Again! ",
      dataType: "JSON"
    }

getFeelings = ->
  $.getJSON "/feelings", (response)-> alert "TODO"

$(document).ready ->
  $("#btnSad").on "click", (e) ->
    e.preventDefault()
    getIpAndSendFeeling(true)

  $("#btnHappy").on "click", (e) ->
    e.preventDefault()
    getIpAndSendFeeling(false)

  loadData()