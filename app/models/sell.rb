# == Schema Information
#
# Table name: sells
#
#  id          :integer          not null, primary key
#  customer_id :integer
#  product_id  :integer
#  amount      :integer
#  price       :float
#  total       :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sell < ActiveRecord::Base
  attr_accessible :amount, :customer_id, :price, :product_id
  belongs_to :product
  belongs_to :customer


  validates :customer, presence: true
  validates :product, presence: true

  validates :amount, presence: true,
                    numericality: true
  validates :price, presence: true,
                    numericality: true

  before_save :set_total

  def set_total
    self.total = amount * price
  end
    
end
