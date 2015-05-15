jQuery ->
    $('#trips_search').submit( ->
      $.get(this.action, $(this).serialize(), null, 'script');
      return false;
    )
    $("#trips_search input").keyup( ->
        $.get($("#trips_search").attr("action"), $("#trips_search").serialize(), null, 'script');
        return false;
    )
