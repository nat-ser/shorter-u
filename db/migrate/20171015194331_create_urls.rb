class CreateUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :urls do |t|
      t.string :full_address, null: false
      t.integer :visit_count, default: 0

      t.timestamps
    end
  end
end
