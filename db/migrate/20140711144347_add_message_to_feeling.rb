class AddMessageToFeeling < ActiveRecord::Migration
  def change
    add_column :feelings, :message, :string
  end
end
