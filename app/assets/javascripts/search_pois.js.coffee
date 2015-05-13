jQuery ->
    $('#pois_search').submit( ->
      $.get(this.action, $(this).serialize(), null, 'script');
      return false
    )
    $("#pois_search input").keyup( ->
        $.get($("#pois_search").attr("action"), $("#pois_search").serialize(), null, 'script');
        return false;
    )
