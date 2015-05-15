jQuery ->
    $('#pois_search_add').submit( ->
      $('#loading_selection').show();
      $.get(this.action, $(this).serialize(), null, 'script');
      return false;
    )
