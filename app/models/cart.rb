class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_product(product_id)
    #prod = Product.find_by(product_id: product_id)
    prod = line_items.find_by(product_id: product_id)
    if prod 
      prod.quantity +=1
    else
      prod = line_items.build(product_id: product_id)
    end
    prod
  end

  def total_price
    line_items.to_a.sum {|item| item.total_price }
  end

end
