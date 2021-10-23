class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :story_id
      t.integer :mentor_id

      t.timestamps
    end
  end
end
