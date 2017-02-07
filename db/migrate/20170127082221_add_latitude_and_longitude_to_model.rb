class AddLatitudeAndLongitudeToModel < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :latitude, :float, precision: 8, scale: 4
    add_column :contacts, :longitude, :float,precision: 8, scale: 4
  end
end
