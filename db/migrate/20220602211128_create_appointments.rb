class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.string :address
      t.float :longitude
      t.float :latitude
      t.references :realtor, null: false, foreign_key: true
      t.references :seller, null: false, foreign_key: true
      t.string :timeslot
      t.date :date

      t.timestamps
    end
  end
end
