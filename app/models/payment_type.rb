class PaymentType < ActiveRecord::Base
  belongs_to :order
  def self.names
    all.collect {|pt| pt.name }
  end
end
