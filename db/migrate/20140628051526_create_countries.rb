class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :code
      t.integer :latitude
      t.integer :longitude

      t.timestamps
    end
  end
end
