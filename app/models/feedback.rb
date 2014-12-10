class Feedback < ActiveRecord::Base

  include ActionView::Helpers
  ActionView::Helpers::AssetTagHelper

  dragonfly_accessor :image

  validates_presence_of  :feedback
  validates_inclusion_of :is_success, in: [true, false], message: "Please choose one"

  scope :successful, -> { where(is_success: true) }
  scope :unsuccessful, -> { where(is_success: false) }

  default_scope { order(id: :desc) }

  def self.permitted_params
    [ :name, :email, :is_success, :restored_at, :website_url, :feedback, :url, :image ]
  end

  def is_success_str
    is_success? ? "yes" : "no"
  end

  def to_json(options = nil)
    super(only: [ :name, :email, :restored_at, :website_url, :feedback, :url ], methods: [:image_url])
  end

  def image_url
    image.url if image_stored?
  end

end