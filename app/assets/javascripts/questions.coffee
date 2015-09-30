$(document).trigger('_:ready', {
    callback: ->
      bindPostTextHandler()
    , selector: '#questions-new, #questions-edit, #questions-show'
  }
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
  items = [
    {
      src: e.target.src
      w: e.target.width * 3
      h: e.target.height * 3
    }
  ]
  gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, items)
  gallery.init()
