# == Schema Information
#
# Table name: suppliers
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  city       :string(255)
#  address    :string(255)
#  phone      :integer
#  cellphone  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string(255)
#

class Supplier < ActiveRecord::Base
  attr_accessible :address, :cellphone, :city, :email, :name, :phone
  has_many :buys
  has_many :products, through: :buys

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true
  # validates :email, uniqueness: { case_sensitive: false },
  #                   format: { with: VALID_EMAIL_REGEX }
  # validates :phone, numericality: true
  # validates :cellphone, numericality: true

  before_save { |customer| customer.email = email.downcase unless email.nil?}
end
