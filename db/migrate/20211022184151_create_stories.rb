class CreateStories < ActiveRecord::Migration[6.1]
  def change
    create_table :stories do |t|
      t.string :name
      t.string :description
      t.integer :user_id
      t.string :link
      t.date :start_date

      t.timestamps
    end
  end
end
     