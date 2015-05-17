jQuery ->
  $('#show_trip_requests').submit( ->
    $.get(this.action, $(this).serialize(), null, 'script');
    return false;
  )
