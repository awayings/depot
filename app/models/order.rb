class Order < ActiveRecord::Base
  PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]

  has_many :line_items, dependent: :destroy

  validates :name, :address, :email, presence: true

  validates :pay_type_id, presence: true

  #before_validation :normalize_credit_card_number

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
    
  end

  private
  def normalize_credit_card_number
    if self.name > "J"
      self.errors.add("name should not greater than J")
    end
  end

end
