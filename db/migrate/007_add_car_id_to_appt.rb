class AddCarIdToAppt < ActiveRecord::Migration[5.2]
    def change
      add_column :appointments, :car_id, :integer
    end
end
  