class CreateRealtors < ActiveRecord::Migration[6.1]
  def change
    create_table :realtors do |t|
      t.string :name
      t.string :city
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
