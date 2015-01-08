class FeedbackExtraFields < ActiveRecord::Migration
  def change
    add_column :feedbacks, :state, :string, limit: 20
    add_column :feedbacks, :feedback_type, :string

    add_index :feedbacks, :state
  end
end
