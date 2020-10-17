class User < ApplicationRecord
    has_many :cars
    has_many :appointments
    has_many :shops, through: :appointments
    accepts_nested_attributes_for :cars
    accepts_nested_attributes_for :appointments
end