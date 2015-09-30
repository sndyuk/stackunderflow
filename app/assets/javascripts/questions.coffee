$(document).trigger('_:ready', {
    callback: ->
      bindImageUploadHandler()
      bindPostTextHandler()
    , selector: '#questions-new, #questions-edit, #questions-show'
  }
)

bindImageUploadHandler = ->
  $input = $('#question_images_files')
  return if $input.length == 0

  insertImgTagToPostText = (refId) ->
    $textarea = $('#question_post_text')
    text = $textarea.val()
    cursorPos = $textarea.prop('selectionStart')
    textBefore = text.substring(0, cursorPos)
    textAfter = text.substring(cursorPos)
    $textarea.val("#{textBefore}![enter image description here](#{refId})#{textAfter}")
    $textarea.change()

  $(document).on('upload:start', 'form', (e) ->
    $(this).find('input[type=submit]').attr('disabled', true)
  )
  $(document).on('upload:complete', 'form', (e) ->
    if(!$(this).find('input.uploading').length)
      $(this).find('input[type=submit]').removeAttr('disabled')
      $input = $('form input[name="question[images_files][]"]')

      data = JSON.parse($input.val())
      ajaxs = _.map(data, (f) ->
        $.ajax(
          url: "/image/cached_image_url?ref=#{f.id}&filename=#{f.filename}"
          type: 'get'
        )
      )
      $.when.apply(undefined, ajaxs).done(->
        if (_.isArray(arguments[0]))
          refs = _.map(arguments, (d) -> d[0])
        else
          refs = [arguments[0]]

        _.each(refs, (ref) -> insertImgTagToPostText(ref))
        newdata = _.map(data, (d, i) ->
          d.ref = refs[i]
          d
        )
        $input.val(JSON.stringify(newdata))
      )
  )

bindPostTextHandler = ->
  $preview = $('.preview')
  $('#question_post_text').on('input change', (e) ->
    $preview.html(marked(this.value || this.innerText,

      highlight: (code) ->
        hljs.highlightAuto(code).value
    ))
    $('.preview img').click(openPhotoSwipe)
  ).change()

openPhotoSwipe = (e) ->
  pswpElement = document.querySelectorAll('.pswp')[0]

  items = _.map($('.preview img'), (elm) ->
    $elm = $(elm)
    {
    num: $elm.data('num')
    src: elm.src
    w: elm.width * 3
    h: elm.height * 3
    }
  )
  currNum = $(e.target, 'img').data('num')
  currIndex = _.findIndex(items, (item) -> item.num == currNum)
  options =
    history: false
    focus: false
    showAnimationDuration: 0
    hideAnimationDuration: 0

  gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, items, options)
  gallery.init()
  gallery.goTo(currIndex || 0)
