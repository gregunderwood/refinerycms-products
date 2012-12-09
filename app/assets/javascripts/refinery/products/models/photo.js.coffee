namespace "Rootwork", (exports)->

  class exports.Photo extends Backbone.Model
  
  class exports.Photos extends Backbone.Collection
    model: Rootwork.Photo
