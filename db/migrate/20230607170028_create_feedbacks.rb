class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.boolean :like
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
