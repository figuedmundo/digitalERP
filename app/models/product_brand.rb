# == Schema Information
#
# Table name: product_brands
#
#  id          :integer          not null, primary key
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ProductBrand < ActiveRecord::Base
  attr_accessible :description
  has_many :products

  validates :description, uniqueness: { case_sensitive: false },
                          presence: true


  before_save { |productbrand| productbrand.description = description.downcase }

end
