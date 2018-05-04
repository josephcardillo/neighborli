$(document).on("turbolinks:load", () => {
  // Fix labels overlapping prefilled text inputs.
  M.updateTextFields();
  // Initialize our FAB.
  $(".fixed-action-btn").floatingActionButton({ direction: "left" });
  // Initialize DatePickers.
  $(".datepicker input").datepicker();
  // Initialize our Selects.
  $(".input-field select").formSelect();
});