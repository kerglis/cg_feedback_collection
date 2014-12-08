class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.string :email
      t.boolean :is_success
      t.datetime :restored_at
      t.string :website_url
      t.text :feedback
      t.string :url
      t.string :image_uid
      t.string :image_name

      t.timestamps
    end
  end
end
