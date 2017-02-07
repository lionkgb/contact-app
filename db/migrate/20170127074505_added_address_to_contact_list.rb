class AddedAddressToContactList < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :streetaddress, :float, precision:8, scale:4
  end
end
 