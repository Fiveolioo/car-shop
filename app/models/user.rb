class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    has_many :cars
    has_many :appointments
    has_many :shops, through: :appointments
    accepts_nested_attributes_for :cars
    accepts_nested_attributes_for :appointments

    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
    
    devise :omniauthable, omniauth_providers: [:facebook]

    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          user.email = auth.info.email
          user.password = Devise.friendly_token[0, 20]
        end
    end

    def has_cars
        !cars.empty?
    end

    def has_appointments
        !appointments.empty?
    end
end