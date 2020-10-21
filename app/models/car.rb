class Car < ApplicationRecord
    validates :make, presence: true
    validates :model, presence: true
    validates :color, presence: true
    validates :nickname, presence: true, uniqueness: true

    belongs_to :user
    has_many :appointments, through: :user
end