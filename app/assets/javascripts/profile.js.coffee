$ ->
  $('#pins').imagesLoaded ->
    $('#pins').masonry
      itemSelector: '.box'
      isFitWidth: true

$ ->
  $('#drips').imagesLoaded ->
    $('#drips').masonry
      itemSelector: '.vox'
      isFitWidth: true