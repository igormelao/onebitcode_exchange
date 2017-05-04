postForm = ->
  if $('form').attr('action') == '/exchange'
    $.ajax '/exchange',
        type: 'POST'
        dataType: 'json'
        data: {
                currency: $("#currency").val(),
                currency_destination: $("#currency_destination").val(),
                quantity: $("#quantity").val()
              }
        error: (jqXHR, textStatus, errorThrown) ->
          alert textStatus
        success: (data, text, jqXHR) ->
          $('#result').text($("#quantity").val() + " " + $("#currency").val() + " = " + data.value + " " + $("#currency_destination").val())
      return false;

changeCurrenciesValues = ->
  currency = $("#currency").val()
  currency_destination = $("#currency_destination").val()
  $("#currency").val(currency_destination)
  $("#currency_destination").val(currency)

isQuantityValid = ->
  if $('#quantity').val() > 0
    return true;
  else
    $('#result').text("Simule sua conversão!");
    return false;

$(document).ready ->
  $('#quantity').change  ->
    if isQuantityValid()
      postForm();

    return false;

  $('#change-values').click () ->
    changeCurrenciesValues();
    if isQuantityValid()
      postForm();

    return false;
