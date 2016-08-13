$ ->
	$('.js-multi-search-input').autocomplete
    source: (request, response) ->
      $.ajax
        url: "/bookmarks_search"
        data:
        	q: request['term']
        dataType: 'json'
        success: (data) ->
          # data.push
          #   boldLabel: "Search for: '#{request['term']}'"
          #   label: request['term']
          #   value: "/search?q=#{request['term']}"
          # console.log(data)
          # window.obj0 = response
          # window.obj1 = request
          response(data)
    appendTo: ".js-multi-search-listing"
    delay: 200
    focus: (event, ui) ->
      # $(this).val(ui.item.label)
      return false
    select: (event, ui) ->
      # $(this).data("autocomplete-path", ui.item.value)
      # $(this).val(ui.item.label)
      # $("#global_nav_search_form").attr('action', ui.item.value)
      return false
