getIpAndSendFeeling = (sad)->
  $.get "http://freegeoip.net/json/", (response)-> 
    data = {feeling: {sad:sad, ip:response.ip, country_name:response.country_name, country_code:response.country_code }}
    createFeeling(data)

createFeeling = (nData)->
  $.ajax {
      type:     "POST",
      url:      "/feelings"
      data:     nData,
      success:  console.log "feeling posted",
      dataType: "JSON"
    }

$(document).ready ->
  $("#btnSad").on "click", (e) ->
    e.preventDefault()
    getIpAndSendFeeling(true)

  $("#btnHappy").on "click", (e) ->
    e.preventDefault()
    getIpAndSendFeeling(false)