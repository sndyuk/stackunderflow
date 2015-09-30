$(document).trigger('_:ready', {
    callback: ->
      bindPostTextChangeHandler()
    , selector: '#questions-new, #questions-edit'
  }
)

bindPostTextChangeHandler = ->
  $preview = $('.preview')
  $('#question_post_text').on('input change', (e) ->
    $preview.html(marked(e.target.value,
      highlight: (code) ->
        hljs.highlightAuto(code).value
    ))
  ).change()