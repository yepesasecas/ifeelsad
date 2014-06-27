class CreateFeelings < ActiveRecord::Migration
  def change
    create_table :feelings do |t|
      t.boolean :sad

      t.timestamps
    end
  end
end
