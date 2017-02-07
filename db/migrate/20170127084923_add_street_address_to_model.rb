class AddStreetAddressToModel < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :street_address, :string
  end
end
