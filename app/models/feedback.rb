class Feedback < ActiveRecord::Base

  dragonfly_accessor :image

  validates_presence_of :is_success, :feedback

  def self.permitted_params
    [ :name, :email, :is_success, :restored_at, :website_url, :feedback, :url, :image ]
  end

end