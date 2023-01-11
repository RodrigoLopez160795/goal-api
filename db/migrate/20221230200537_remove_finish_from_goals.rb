class RemoveFinishFromGoals < ActiveRecord::Migration[7.0]
  def change
    remove_column :goals, :finish, :boolean
  end
end
