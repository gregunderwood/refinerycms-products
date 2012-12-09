namespace "Rootwork.Admin", (exports)->
  
  class exports.PhotosView extends Backbone.View
  
    events:
      'click #add_photo': 'addPhoto'
  
    initialize: (options={})=>
      @model = new Rootwork.Product() unless @model?
    
    addPhoto: (event)=>
      event.stopPropagation()
      event.preventDefault()
      photoForm = new Rootwork.Admin.PhotoForm
        model: new Rootwork.Photo()
      @$('#photo_editors').prepend photoForm.render().el
      
    render: =>
      @model.get('photos').each (photo)=>
        form = new Rootwork.Admin.PhotoForm
          model: photo
        @$('#photo_editors').append form.render().el
      @
      