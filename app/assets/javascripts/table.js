$(document).ready(function() {
  $(".button-to").submit(function(event) {
    $form = $(event.currentTarget);

    var formData = {
      "user"  : $("input[tracked_item_user]").val(),
      "item"  : $("input[tracked_item_item]").val()
    };

    $.ajax({
      type: $form.attr("method"),
      url: $form.attr("action"),
      data: formData,
      dataType: "json",
      success: function() {
        $form.remove()
      }
    });
    event.preventDefault();
  });
});
