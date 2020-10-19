class AddUserIdAndShopIdAppt < ActiveRecord::Migration[5.2]
    def change
        add_reference :appointments, :user, foreign_key: true
        add_reference :appointments, :shop, foreign_key: true
    end
end
  