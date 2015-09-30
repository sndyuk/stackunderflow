$(document).trigger('_:ready', {
    callback: ->
      bindImageChangeHandler()
      bindPostTextChangeHandler()
    , selector: '#questions-new, #questions-edit, #questions-show'
  }
)

bindImageChangeHandler = ->
  $input = $('#question_images_files')
  $input.change(handleFileSelect)

bindPostTextChangeHandler = ->
  $preview = $('.preview')
  $('#question_post_text').on('input change', (e) ->
    $preview.html(marked(e.target.value || e.target.innerText,
      highlight: (code) ->
        hljs.highlightAuto(code).value
    ))
  ).change()

openPhotoSwipe = (e) ->
  pswpElement = document.querySelectorAll('.pswp')[0]

  items = _.map($('.image-list img'), (elm) ->
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

handleFileSelect = (evt) ->
  files = evt.target.files

  makeRemoveEvent = (e) ->
    $img = $(e.target).parent()
    $img.hide(300, -> $img.remove())

  lastNum = _.chain($('.image-list img')).foldl((n, elm) ->
    Math.max($(elm).data('num'), n)
  , 0).value()

  _.chain(files).filter((f) -> f.type.match('image.*')).each((f, i) ->
    reader = new FileReader()

    reader.onload = ((file) ->
      (e) ->
        $box = $('<div>')
        $box.append($('<div>').addClass('remove-button').click(makeRemoveEvent).text('x'))
        num = lastNum + i + 1;
        $box.append($('<div>').addClass('label').text("[#{num}] : #{file.name}")
        .append($('<img>').addClass('thumb').attr('src', e.target.result, 'title', escape(file.name)).data('num',
            num)).click(openPhotoSwipe))
        $('.image-list').append($box))(f)
    reader.readAsDataURL(f)
  ).value()