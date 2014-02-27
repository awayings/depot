class CombineItemsInCart < ActiveRecord::Migration
  def up
    
    Cart.all.each do |cart|    
      
      sums = cart.line_items.group(:product_id).sum(:quantity)

      sums.each do |product_id, quantity|
        
        cart.line_items.where(product_id: product_id).delete_all

        item = cart.line_items.build(product_id: product_id)
        item.quantity = quantity
        item.save!

      end # end of sum

    end # end of all.each

  end # end of up

  def down
  
    Cart.all.each do |cart|
      
      cart.line_items.where("quantity > 1").each do |item|
      
        item.quantity.times do
          #cart.line_items.build(product_id: item.product_id)
          LineItem.create cart_id: item.cart_id, 
                          product_id: item.product_id,
                          quantity: 1

        end

        item.destroy
      end

    end

  end # end of down

end
