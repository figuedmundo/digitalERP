# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  nit        :integer
#  city       :string(255)
#  address    :string(255)
#  phone      :integer
#  cellphone  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  email      :string(255)
#

class Customer < ActiveRecord::Base
  attr_accessible :address, :cellphone, :city, :first_name, :last_name, :nit, :phone, :email

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :nit, uniqueness: { case_sensitive: false },
  #                 numericality: true
  # validates :email, uniqueness: { case_sensitive: false },
  #                   format: { with: VALID_EMAIL_REGEX }
  # validates :phone, numericality: true
  # validates :cellphone, numericality: true

  before_save { |customer| customer.email = email.downcase unless email.nil?}

end
