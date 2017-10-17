$(function() {
  function bindAjaxSubmit() {
    $("#new_url").on("ajax:success", function(event, data) {
      $(".short-link").html(data).css("display", "block");
    }).on("ajax:error", function(event, xhr, status) {
      var errors = $.parseJSON(xhr.responseText).errors
      displayErrors(errors);
    });
  }

  function displayErrors(errors) {
    errors.map (function(error) {
      $("#error-msg").append(error);
    });
  }

  bindAjaxSubmit();
});
