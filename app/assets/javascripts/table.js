$(document).ready(function() {
  $("form.tracked").submit(function(event) {
    event.preventDefault();

    $form = $(event.currentTarget);

    var url = $form[0].action;
    var formData = {
      "user"  : $form.context[2].value,
      "item"  : $form.context[3].value
    };

    $.ajax({
      type: "POST",
      url: "/tracked_items",
      data: formData,
      dataType: "json",
      success: function(tracked_item) {
        console.log(tracked_item)
        $("#button-" + formData["item"] + " #add-button").remove();
      },
      error: function(unprocessable_entity) {
        console.log(unprocessable_entity);
      }
    });
  });
});
