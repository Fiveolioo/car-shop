class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string :reason_for_visit
      t.datetime :date_time
  
      t.timestamps
    end
  end
end