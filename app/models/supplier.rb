class Supplier < ActiveRecord::Base
  attr_accessible :address, :cellphone, :city, :email, :first_name, :last_name, :phone

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :email, uniqueness: { case_sensitive: false },
  #                   format: { with: VALID_EMAIL_REGEX }
  # validates :phone, numericality: true
  # validates :cellphone, numericality: true

  before_save { |customer| customer.email = email.downcase unless email.nil?}
end
