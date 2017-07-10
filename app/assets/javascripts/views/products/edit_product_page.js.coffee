class Store.Views.EditProductPage extends Backbone.View

  initialize: (options) ->
  	$('.js-clickEdit').clickEdit()
  	$(".image-picker").imagepicker ({
  		changed: ->
  	})
