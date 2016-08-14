$ ->
	a = $('.js-multi-search-input').autocomplete
    source: (request, response) ->
      $.ajax
        url: "/bookmarks_search"
        data:
        	q: request['term']
        dataType: 'json'
        success: (data) ->
          data.unshift
            title: "Search for: '#{request['term']}'"
            url: ""
            value: request['term']
          response(data)
    appendTo: ".js-multi-search-listing"
    delay: 200
    focus: (event, ui) ->
      $(this).val(ui.item.title)
      return false
    select: (event, ui) ->
      $(this).val(ui.item.title)
      $(".js-search-results-container").html("<div>" + ui.item.title + "<br>" + ui.item.url + "</div>")
      return false

  a.autocomplete("instance")._renderItem = (ul, item) ->
    $("<li>").append("<div>" + item.title + "<br>" + item.url + "</div>").appendTo(ul);

