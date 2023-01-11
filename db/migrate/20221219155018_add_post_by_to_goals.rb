class AddPostByToGoals < ActiveRecord::Migration[7.0]
  def change
    add_column :goals, :post_by, :string
  end
end
