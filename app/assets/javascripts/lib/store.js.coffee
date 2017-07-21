window.Store =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
 
  initialize: ->
    # E.g. backbone.view.js.coffee
    Backbone.View::close = ->
    	@remove()
    	@onClose()
    Backbone.View::onClose = ->

    # Optional: set up a pubSub object
    # window.pubSub = _.extend({}, Backbone.Events)
    
    # An example jQuery plugin that triggers events on pubSub
    # $(document).publishHotkeys(pubSub) 
    
    # Keep a reference to your router so you can release it later
    @router = new Store.Routers.Router()
    Backbone.history.start(pushState: true)
  
  teardown: ->
    
    # Stop jQuery plugin from publishing to pubSub
    # $(document).stopPublishingHotkeys()
    
    # Clear the pubSub variable (optional)
    # window.pubSub = undefined 
    
    # Close the router, closing all its views and their subviews
    @router.close()
    
    # Nullify the router variable
    @router = undefined

# Called during the page change lifecycle, before the current page is changed
$(document).on 'turbolinks:before-visit', ->
  
  # If backbone is running and the browser supports Turbolinks
  if Backbone.History.started and Turbolinks?.supported
    
    # Replace the current state with one of Turbolinks format
    locHref = window.location.href
    title = window.title
    window.history.replaceState {turbolinks: true, url: locHref}, title, locHref

# Called during the page change lifecycle, after the page has changed
$(document).on 'turbolinks:load', ->
  
  # If the router is available the app needs to be torn down
  if Store.router?
    Backbone.history.stop()
    Store.teardown()
  
  # Initialize the app from scratch if the page requires it
  Store.initialize()