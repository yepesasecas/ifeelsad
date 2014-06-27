getIP = ->
  $.get "http://freegeoip.net/json/", (response)->
    console.log response

createFeeling = (sadBoolean)->
  $.ajax {
      type:     "POST",
      url:      "/feelings"
      data:     { feeling:{ sad: sadBoolean }},
      success:  console.log "feeling posted",
      dataType: "JSON"
    }

$(document).ready ->
  getIP()

  $("#btnSad").on "click", (e) ->
    e.preventDefault()
    createFeeling(true)

  $("#btnHappy").on "click", (e) ->
    e.preventDefault()
    createFeeling(false)
