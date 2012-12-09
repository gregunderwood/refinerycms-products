namespace "Rootwork", (exports)->
  
  class exports.ProductView extends Backbone.View
  
    events:
      'click a.photo_thumb': 'imageSelected'
    
    initialize: (options={})=>
      @$('img#product_photo').before("<img id='loader' src='/assets/refinery/products/spinner.gif'>").load (event, status)=>
        if @selected?
          @$('#loader').hide()
          @$('img#product_photo').show()
      @$('#loader').hide()
      
    imageSelected: (event, status)=>
      event.stopPropagation()
      event.preventDefault()
      @selected = $(event.target).parent('a')
      @$('ul.photo_thumbs li').removeClass('selected')
      @selected.parents('li').addClass('selected')
      photo = @$('img#product_photo')#
      photo.attr('src', @selected.attr('href'))
      @$('#loader').show()
      @$('img#product_photo').hide()
