$(document).ready(function() {
  $('.tag-cloud').find('li').each(function() {
    var size = parseInt($(this).attr('data-size')) * .75;

    console.log(size)
    $(this).css('font-size', size + 'em')
  });
});
