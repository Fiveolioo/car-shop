class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :cars
    has_many :appointments
    has_many :shops, through: :appointments
    accepts_nested_attributes_for :cars
    accepts_nested_attributes_for :appointments
end