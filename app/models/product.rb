# == Schema Information
#
# Table name: products
#
#  id               :integer          not null, primary key
#  description      :string(255)
#  total            :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  product_brand_id :integer
#  code             :string(255)
#

class Product < ActiveRecord::Base
  attr_accessible :description, :product_brand_id, :code
  belongs_to :product_brand
  has_many :buys
  has_many :suppliers, through: :buys
  has_many :sells
  has_many :customers, through: :sells




  validates :description, presence: true,
                          uniqueness: { case_sensitive: false }

  validates :code, presence: true


  before_save { |product| product.description = description.downcase }
  before_save { |product| product.code = code.downcase }
  before_save { |product| product.total = 0 if total.nil? }

  def code_description
    "#{self.code} - #{self.description}"
  end


end
