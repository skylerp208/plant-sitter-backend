class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer :owner_id
      t.integer :sitter_id
      t.date :start_date
      t.date :end_date
      t.string :message
      t.string :status

      t.timestamps
    end
  end
end
