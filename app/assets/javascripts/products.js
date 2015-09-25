$(document).on('ready page:load', function(){
  if ($('html').height() < $(window).height()) {
    $('.pagination').text("Fetching more products...");
    $.getScript($('.pagination span.next').children().attr('href'));
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
    if ($(window).scrollTop() > $(document).height() - $(window).height() - 50) {
      //console.log($('.pagination span.next').children().attr('href'));
      //$.getScript($('.pagination span.next').children().attr('href'));
      return $.getScript(url);
    }
  })
});