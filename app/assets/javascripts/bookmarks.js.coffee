window.BRAIN ?= {}

BRAIN.Bookmarks ?=
	initInlineForm: (linkSelector ='.inline-bookmark-form-link') ->
		$(document).on 'click', linkSelector, (evt) ->
      evt.preventDefault()
      $.ajax
      	url: "/bookmarks/new"
      	context: this
      	dataType: 'script'
      	complete: (data, textStatus, jqXHR) ->
      		$(this).replaceWith(data.responseText)
      		return
    		error: (jqXHR, textStatus, errorThrown) ->
          alert(errorThrown)
          window.location.href = "/bookmarks/new"
      		return
      return
	 	return