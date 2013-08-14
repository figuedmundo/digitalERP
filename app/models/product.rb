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
  attr_accessible :description, :total, :product_brand_id, :code
  belongs_to :product_brand
  has_many :buys
  has_many :suppliers, through: :buys
  has_many :sells
  has_many :customers, through: :sells




  validates :description, presence: true,
                          uniqueness: { case_sensitive: false }
  validates :total, presence: true,
                    :numericality => { :only_integer => true }
  validates :code, presence: true


  before_save { |product| product.description = description.downcase }
  before_save { |product| product.code = code.downcase }
end
