class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :place
      t.date :date
      t.time :hour
      t.integer :minimum_people
      t.string :photo
      t.text :comment
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
