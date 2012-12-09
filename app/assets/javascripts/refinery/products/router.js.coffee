namespace "Rootwork", (exports)->
  
  class exports.ProductsRouter extends Backbone.Router

    routes:
      '' : 'home'
  
    initialize: (options={})=>
      
    home: =>
      $container = $('#products_container')
      if $container.length > 0
        $container.imagesLoaded ->
          $container.masonry
            itemSelector : '.product'

      view = new Rootwork.ProductView
        el: $('#product_container')
        
