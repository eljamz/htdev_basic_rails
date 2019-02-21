class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birthdate, :date, after: :last_name
    add_column :users, :gamertag, :string, after: :birthdate
  end
end
