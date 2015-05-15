jQuery ->
    $('#guides_search').submit( ->
      $.get(this.action, $(this).serialize(), null, 'script');
      return false;
    )
    $("#guides_search input").keyup( ->
        $.get($("#guides_search").attr("action"), $("#guides_search").serialize(), null, 'script');
        return false;
    )
