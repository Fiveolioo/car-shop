class Appointment < ApplicationRecord
    belongs_to :user
    belongs_to :shop
    belongs_to :car

    def self.reasons
        ['Repair', 'Paint', 'Installation', 'Alignment', 'Tire Change', 'Maintenance', 'Diagnostics']
    end
end