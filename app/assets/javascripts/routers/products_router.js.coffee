class Store.Routers.Products extends Backbone.Router

  routes: 
    "products/:id"            : "show"
    "admin/products/new" 			:	"new"
    "admin/products/:id/edit" : "edit"

  show: (id) ->
    new Store.Views.ProductsPage
      el        : '.product-page'
      productId : id

  edit: (id) ->
    new Store.Views.ProductsPage
      el         : '.product-page'
      productId  : id

  new: () -> 
    new Store.Views.ProductsPage
      el : '.product-page'