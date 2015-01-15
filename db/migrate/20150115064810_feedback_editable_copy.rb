class FeedbackEditableCopy < ActiveRecord::Migration
  def change
    add_column :feedbacks, :feedback_editable_copy, :text, after: :feedback
  end
end
