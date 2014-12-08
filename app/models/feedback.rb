class Feedback < ActiveRecord::Base

  include ActionView::Helpers
  ActionView::Helpers::AssetTagHelper

  dragonfly_accessor :image

  validates_presence_of :is_success, :feedback

  def self.permitted_params
    [ :name, :email, :is_success, :restored_at, :website_url, :feedback, :url, :image ]
  end

  def is_success_str
    is_success? ? "yes" : "no"
  end

  def image_str(size = nil)
    if image_stored?
      size  ? image_tag(image.thumb(size).path)
            : image_tag(image.path)
    end
  end

end