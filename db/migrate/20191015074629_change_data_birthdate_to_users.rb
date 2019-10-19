class ChangeDataBirthdateToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :birthdate, :datetime
  end
end
