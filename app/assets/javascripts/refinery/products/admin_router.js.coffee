namespace "Rootwork.Admin", (exports)->
  
  class exports.ProductsAdminRouter extends Backbone.Router

    routes:
      '' : 'home'
      
    home: =>
      data = jQuery.parseJSON(window.product)
      product = new Rootwork.Product data if window.product?
      @photosView = new Rootwork.Admin.PhotosView 
        el: ($ '#product_photos_container')
        model: product
      @photosView.render()
