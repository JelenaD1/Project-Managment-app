class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :status
      t.string :project_id
      t.integer :category_id

      t.timestamps
    end
  end
end
