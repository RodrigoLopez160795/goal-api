class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.string :name, null: false
      t.text :description
      t.boolean :finish, default: false
      t.string :finish_at, default: nil
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
