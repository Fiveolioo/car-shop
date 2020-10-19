class Shop < ApplicationRecord
    has_many :users, through: :appointments
end