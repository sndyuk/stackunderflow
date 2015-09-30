# Turbolinks
Turbolinks.enableTransitionCache()

$(document).on('_:ready', (_, { callback, selector }) ->
  $(document).on('page:change', ->
    callback.apply(arguments) if !selector || $(selector).is(':visible')
  )
)
