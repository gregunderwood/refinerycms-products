namespace "Rootwork.Admin", (exports)->
  
  class exports.ImageSelector extends Backbone.View
  
    template: JST['refinery/products/html/image_selector']
    
    events:
      'load iframe': 'initializeIframe'
      'click #submit_button': 'addPicture'
      'click #cancel_button': 'remove'
      
    initialize: (options={})=>
      
    
    initializeIframe: =>
      @$frame = ($ 'iframe').contents()
      @$frame.find('#submit_button').click @addPicture
      @$frame.find('#cancel_button').click @remove    
    
    remove: =>
      super()
    
    addPicture: (event)=>
      event.stopPropagation()
      event.preventDefault()
      $image = @$frame.find('#existing_image_area_content li.selected img')
      @model.set
        picture_id: $image.data('id')
        picture: $image.data('medium')
      @remove()
    
    render: =>
      @$el.html @template(@model.toJSON())
      frame = @$('iframe')
      frame.load @initializeIframe
      @