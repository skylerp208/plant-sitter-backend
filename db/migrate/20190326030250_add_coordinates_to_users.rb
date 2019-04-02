class AddCoordinatesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :coordinates, :string
  end
end
