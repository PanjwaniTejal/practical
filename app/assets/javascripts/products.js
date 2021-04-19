const searchData =   $(document).ready(function() {
  $('.search-data').hide()
  
  $('.search').on('keyup', function() {
    $('.search-data').show()
  })

  $('.search-data').on('click', function() {
    $('.search-data').hide()
    $('.search').val('')
    
    value = $('.search').val()
    $.ajax({
      url: '/search',
      method: 'GET',
      dataType: 'script',
      data: { search: value }
    })
  })
})