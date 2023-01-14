class AddCoordinatesToMasks < ActiveRecord::Migration[5.2]
  def change
    add_column :masks, :latitude, :float
    add_column :masks, :longitude, :float
  end
end
