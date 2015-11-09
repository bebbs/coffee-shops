$(document).ready(function() {
  watchMapViewFields();
});

function watchMapViewFields() {
  if ($('section.results-view').length == 0) {
    return
  }

  formField = $('input[name="show_map"]')[0]

  $('a#map').click(function() {
    formField.value = true;
    formField.form.submit();
  });

  $('a#list').click(function() {
    formField.value = false;
    formField.form.submit();
  })
}