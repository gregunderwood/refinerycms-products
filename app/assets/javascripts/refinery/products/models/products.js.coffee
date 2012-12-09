namespace "Rootwork", (exports)->

  class exports.Product extends Backbone.Model
  
    initialize: (options={})=>
      if @get('photos')?
        unless @get('photos') instanceof Rootwork.Photos
          @set
            photos: new Rootwork.Photos @get('photos')
      else
          @set
            photos: new Rootwork.Photos()
  
  class exports.Products extends Backbone.Collection
    model: Rootwork.Product