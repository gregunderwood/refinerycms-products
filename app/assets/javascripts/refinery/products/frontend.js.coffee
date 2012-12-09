#= require handlebars
#= require underscore
#= require backbone
#= require masonry/jquery.masonry
#= require ./utils
#= require_tree ../../../templates
#= require_tree ./models
#= require_tree ./views
#= require ./router
#= require_self

($ document).ready ->
  app = new Rootwork.ProductsRouter()
  Backbone.history.start()
  