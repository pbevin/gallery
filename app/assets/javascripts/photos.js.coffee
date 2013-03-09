jQuery ->
  $('#new_photo').fileupload
    dropZone: $('#dropzone')
    dataType: "script"
    add: (e, data) ->
      data.context = $(tmpl("template-upload", data.files[0]).trim())
      $('#new_photo').append(data.context)
      data.submit()
    progress: (e, data) ->
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10)
        data.context.find('.bar').css('width', progress + '%')

$(document).bind 'dragover', (e) ->
    dropZone = $('#dropzone')
    timeout = window.dropZoneTimeout
    if !timeout
      dropZone.addClass('in')
    else
      clearTimeout(timeout)

    if e.target == dropZone[0]
      dropZone.addClass('hover')
    else
      dropZone.removeClass('hover')

    window.dropZoneTimeout = setTimeout ( ->
        window.dropZoneTimeout = null
        dropZone.removeClass('in hover')
    ), 100

