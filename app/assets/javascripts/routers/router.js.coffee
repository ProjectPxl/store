class Store.Routers.Products extends Backbone.Router

  routes: 
    "products/new" 			:	"new"
    "products/:id" 			: "show"
    "products/:id/edit" : "edit"

  show: (id) ->
    console.log 'show'
    new Store.Views.ProductsPage
      el : '.product-page'
      productId: id

  edit: (id) ->
    console.log 'edit'
    new Store.Views.ProductsPage
      el : '.product-page'
      productId: id
      children: [Store.Views.EditProductPage]

  new: () -> 
    console.log 'new'
    new Store.Views.ProductsPage
      el : '.product-page'
      children: [Store.Views.NewProductPage]