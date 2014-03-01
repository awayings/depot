class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_product(product_id)
    lineItem = line_items.find_by(product_id: product_id)
    if lineItem 
      lineItem.quantity +=1
    else
      lineItem = line_items.build(product_id: product_id)
    end

    # update to use new price
    prod = Product.find_by(id: product_id)
    lineItem.price = prod.price if prod

    lineItem
  end

  def total_price
    line_items.to_a.sum {|item| item.total_price }
  end

end
