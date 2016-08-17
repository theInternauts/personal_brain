window.BRAIN ?= {}

BRAIN.Search ?=
	init: (formSelector='.js-search-form') ->
		$(formSelector).on 'keyup', '.js-search-input', (evt) ->
			$(this).submit()
			return