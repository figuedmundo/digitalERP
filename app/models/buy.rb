# == Schema Information
#
# Table name: buys
#
#  id          :integer          not null, primary key
#  supplier_id :integer
#  product_id  :integer
#  amount      :integer
#  price       :float
#  total       :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Buy < ActiveRecord::Base
  attr_accessible :amount, :price, :product_id, :supplier_id
  belongs_to :product
  belongs_to :supplier

  validates :supplier, presence: true
  validates :product, presence: true

  validates :amount, presence: true,
                    numericality: { greater_than: 0 }
  validates :price, presence: true,
                    numericality: { greater_than: 0 }

  before_save :set_total

  def set_total
    self.total = amount * price
  end
    

end
