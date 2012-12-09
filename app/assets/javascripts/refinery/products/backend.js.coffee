#= require handlebars
#= require underscore
#= require backbone
#= require ./utils
#= require_tree ../../../templates
#= require_tree ./models
#= require_tree ./views
#= require ./admin_router
#= require_self

($ document).ready ->
  app = new Rootwork.Admin.ProductsAdminRouter()
  Backbone.history.start()
