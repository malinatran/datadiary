$(function() {

  $('.delete-link').on('click', function(event) {
    event.preventDefault();
    $('.modal-mask').css('display', 'flex');
    var href = $(this).attr('href');
    console.log(href);
    $('.modal-delete-button').attr('href', href);
  });

  $('.modal-cancel-button').on('click', function(event) {
    event.preventDefault();
    $('.modal-mask').css('display', 'none');
  });

});