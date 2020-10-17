class Appointment < ApplicationRecord
    has_many :users, through: :appointments
end