class AddTeamToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :team, after: :id
  end
end
