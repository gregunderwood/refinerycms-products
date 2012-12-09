namespace "Rootwork.Admin", (exports)->
  
  class exports.PhotoForm extends Backbone.View
  
    template: JST['refinery/products/html/photos/edit']
    className: 'photo_editor'
    
    events: 
      'click .delete_photo': 'remove'
      'click .add_picture': 'addPicture'
    
    initialize: (options={})=>
      @$('.photo_name').value = @model.get('title')
      @$('.photo_description').value = @model.get('description')
      @model.on "change:picture", @showPicture
      
    renderImage:=>
      @$('.add_picture').text('Change picture')
      @$('.picture_container').html "<img src='#{@model.get('image').url}' />"
      @$('.photo_picture_id').val @model.get('image').id
      
    showPicture: =>
      @$('.add_picture').text('Change picture')
      @$('.picture_container').html "<img src='#{@model.get('picture')}' />"
      @$('.photo_picture_id').val @model.get('picture_id')
    
    addPicture: (event)=>
      event.stopPropagation()
      event.preventDefault()
      selector = new Rootwork.Admin.ImageSelector
        model: @model
      @$el.after selector.render().el
    
    render: =>
      json = @model.toJSON()
      if @model.isNew()
        json.id = @model.cid
      @$el.html @template(json)
      @renderImage() if @model.get('image')?
      @
      
