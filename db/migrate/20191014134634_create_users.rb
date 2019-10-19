class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :gender
      t.timestamp :birthdate
      t.string :phone_number
      t.string :password_digest
      t.string :email
      t.string :photo

      t.timestamps
    end
  end
end
