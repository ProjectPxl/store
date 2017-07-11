class Store.Routers.Products extends Backbone.Router

  routes: 
    "products/new" 			:	"new"
    "products/:id" 			: "show"
    "products/:id/edit" : "edit"

  show: (id) ->
    new Store.Views.ProductsPage
      el : '.product-page'
      productId: id

  edit: (id) ->
    new Store.Views.ProductsPage
      el : '.product-page'
      productId: id

  new: () -> 
    new Store.Views.ProductsPage
      el : '.product-page'