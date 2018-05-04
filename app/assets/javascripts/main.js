$(document).on("turbolinks:load", () => {
  // Fix labels overlapping prefilled text inputs.
  M.updateTextFields();
  // Initialize our FAB.
  $(".fixed-action-btn").floatingActionButton({direction: 'left'});
});
