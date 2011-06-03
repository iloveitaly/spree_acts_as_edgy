Product.class_eval do
  def is_active?
    available_on && available_on < Time.now && !deleted?
  end
end
