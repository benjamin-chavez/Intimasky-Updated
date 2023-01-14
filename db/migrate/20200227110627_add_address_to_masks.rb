class AddAddressToMasks < ActiveRecord::Migration[5.2]
  def change
    add_column :masks, :address, :string
  end
end
