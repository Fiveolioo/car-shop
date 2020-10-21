class Appointment < ApplicationRecord
    validates :date_time, presence: true
    validate :validate_appt
    validates :reason_for_visit, presence: true
    validates :shop, presence: true

    belongs_to :user
    belongs_to :shop
    belongs_to :car

    def self.reasons
        ['Repair', 'Paint', 'Installation', 'Alignment', 'Tire Change', 'Maintenance', 'Diagnostics']
    end

    private

    def validate_appt
      if date_time < Date.today
        errors.add(:date_time, 'Invalid')
      end
    end
end