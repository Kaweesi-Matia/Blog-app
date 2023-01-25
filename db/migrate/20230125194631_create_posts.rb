class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :Title
      t.text :Text
      t.string :comments_counter
      t.string :likes_counter

      t.timestamps
    end
  end
end
