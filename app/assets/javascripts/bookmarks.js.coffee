window.BRAIN ?= {}

BRAIN.Bookmarks ?=
	initInlineForm: (linkSelector ='.inline-bookmark-form-link', formSelector='') ->
		$(document).on 'click', linkSelector, (evt) ->
      evt.preventDefault()
      $.ajax
      	url: "/bookmarks/new"
      	context: this
      	dataType: 'script'
      	complete: (data, textStatus, jqXHR) ->
      		window.obj1 = this
      		window.obj2 = data
      		$(this).replaceWith(data.responseText)
      		return
    		done: () ->
      		alert('done')
      		return
    		error: () ->
      		alert('error')
      		return
    		fail: (jqXHR, textStatus, errorThrown)->
      		alert('fail')
    			# window.location.href = "/bookmarks/new"
      		return
      return
	 	return