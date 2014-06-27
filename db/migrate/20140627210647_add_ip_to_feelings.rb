class AddIpToFeelings < ActiveRecord::Migration
  def change
    add_column :feelings, :ip, :string
    add_column :feelings, :country_name, :string
    add_column :feelings, :country_code, :string
  end
end
