class AddFullAddressIndexToUrls < ActiveRecord::Migration[5.0]
  def change
    add_index :urls, :full_address, :unique => true
  end
end
