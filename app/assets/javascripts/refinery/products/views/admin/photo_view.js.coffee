namespace "Rootwork.Admin", (exports)->
  
  class exports.PhotoView extends Backbone.View
  
    template: JST['refinery/products/html/products/show']
  
    initialize: (options={})=>
      
    render: =>
      @$el.html @template(@model.toJSON())
      @
