class Store.Views.NewProductPage extends Backbone.View

  initialize: (options) ->
  	$('.js-clickEdit').clickEdit()
  	$(".image-picker").imagepicker ({
  		changed: ->
  	})
