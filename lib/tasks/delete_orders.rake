task delete: :environment do
	Order.delete_all
	OrderItem.delete_all
	ShippingAddress.delete_all
	BillingAddress.delete_all
end