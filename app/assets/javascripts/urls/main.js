$(function() {
  function bindAjaxSubmit() {
    $("#new_url").on("ajax:success", function(event, data) {
      $("#error-msg").hide();
      $(".short-link").html(data.url).css("display", "block");
    }).on("ajax:error", function(event, xhr, status) {
      var error = $.parseJSON(xhr.responseText).error
      displayErrors(error);
    });
  }

  function displayErrors(error) {
    $(".short-link").css("display", "none")
    $("#error-msg").html(error);
  }

  bindAjaxSubmit();
});
