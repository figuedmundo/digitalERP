class ProductBrand < ActiveRecord::Base
  attr_accessible :description
  has_many :products

  validates :description, uniqueness: { case_sensitive: false },
                          presence: true


  before_save { |productbrand| productbrand.description = description.downcase }

end
