$(document).on('ready page:load', function(){

  var url = $('.pagination span.next').children().attr('href');
  if (url && $('html').height() < $(window).height()) {
    $('.pagination').text("Fetching more products...");
    $.getScript(url);
  }

  $('#search-form').submit(function(event) {
    event.preventDefault();
    var searchValue = $('#search').val();
     $.getScript('/products?search=' + searchValue);

    // $.ajax({
    //   url: 'products?search=' + searchValue,
    //   type: 'GET',
    //   dataType: 'html'
    // }).done(function(data) {
    //   $('#products').html(data);
    // });

    // $.get('/products?search=' + searchValue)
    //   .done(function(data){
    //     console.log(data);
    //     $('#products').html(data);
    //   });
  });

  $(window).scroll(function() {
    var url = $('.pagination span.next').children().attr('href');
    if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
      return $.getScript(url);
    }
  })
});