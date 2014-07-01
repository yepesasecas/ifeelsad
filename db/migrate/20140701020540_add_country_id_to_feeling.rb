class AddCountryIdToFeeling < ActiveRecord::Migration
  def change
    add_column :feelings, :country_id, :integer
  end
end
