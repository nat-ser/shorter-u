$(function() {
  function bindAjaxSubmit() {
    $("#new_url").on("ajax:success", function(event, data) {
      $("#error-msg").css("display", "none")
      $(".short-link").html(data.url).slideDown();
    }).on("ajax:error", function(event, xhr, status) {
      var error = $.parseJSON(xhr.responseText).error
      displayErrors(error);
    });
  }

  function displayErrors(error) {
    $(".short-link").fadeOut();
    $("#error-msg").html(error).css("display", "block")
  }

  bindAjaxSubmit();
});
