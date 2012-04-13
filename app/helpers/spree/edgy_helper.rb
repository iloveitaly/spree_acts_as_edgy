module EdgyHelper
  def edgy_related(options = {})
    @edgy_related ||=
      if @order
        Spree::Product.edgy_related(Set.new(@order.line_items.map { |i| i.product }), options)
      elsif @product
        @product.edgy_related(options)
      elsif current_user
        current_user.edgy_recommended(options)
      else
        []
      end.select{|p| p.is_active?}
  end

  alias :edgy_recommended :edgy_related

  def edgy_related_table(orientation = :horizontal, options = {})
    render 'spree/shared/edgy_related_table', :orientation => orientation, :options => options
  end

  def edgy_message
    if @product || (@order && @order.line_items.size == 1)
      t('recommendation.product') 
    elsif @order
      t('recommendation.products') 
    elsif current_user
      address = current_user.bill_address
      "#{t(:welcome_back)}#{address ? (', ' + address.firstname) : ''}. " + t('recommendation.personal') 
    else
      t('recommendation.general') 
    end
  end
end
