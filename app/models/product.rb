class Product < ActiveRecord::Base
  attr_accessible :description, :price, :total

  validates :description, presence: true,
                          uniqueness: { case_sensitive: false }
  validates :price, presence: true,
                    :numericality => true
  validates :total, presence: true,
                    :numericality => { :only_integer => true }

  before_save { |product| product.description = description.downcase }
end
