$(document).ready(function() {
  $("form#button-to").submit(function(event) {
    event.preventDefault();
    debugger
    var url = $("form#button-to")[0].action
    var method = $("form#button-to")[0].method
    var formData = {
      "user"  : $(tracked_item_user).val(),
      "item"  : $(tracked_item_item).val()
    };

    $.ajax({
      type: method,
      url: url,
      data: formData,
      dataType: "json",
      success: function() {
        $("form#add-button").remove()
        window.alert("Successfully created")
      }
    });
  });
});
