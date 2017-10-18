class CreateUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :urls do |t|
      t.string :full_address, null: false, default: :null
      t.integer :visit_count, default: 1

      t.timestamps
    end
  end
end
