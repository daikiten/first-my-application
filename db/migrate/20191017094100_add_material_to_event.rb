class AddMaterialToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :material, :string
  end
end
