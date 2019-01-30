class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer :owner_id
      t.integer :sitter_id

      t.timestamps
    end
  end
end
