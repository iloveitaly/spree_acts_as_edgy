User.class_eval do
  acts_as_edgy :purchase, Order, LineItem, Variant, Product
end
