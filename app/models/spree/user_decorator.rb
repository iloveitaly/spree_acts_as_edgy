Spree::User.class_eval do
  acts_as_edgy :purchase, Spree::Order, Spree::LineItem, Spree::Variant, Spree::Product
end
