class Feedback < ActiveRecord::Base

  include ActionView::Helpers
  ActionView::Helpers::AssetTagHelper

  dragonfly_accessor :image

  validates_presence_of  :feedback
  validates_inclusion_of :is_success, in: [true, false], message: "Please choose one"

  after_initialize :set_defaults

  scope :successful, -> { where(is_success: true) }
  scope :unsuccessful, -> { where(is_success: false) }
  scope :approved, -> { where(state: :approved) }

  default_scope { order(id: :desc) }

  state_machine :state, initial: :unapproved do

    event :approve do
      transition unapproved: :approved, if: :approvable?
    end

    event :unapprove do
      transition approved: :unapproved
    end

    event :swap do
      transition unapproved: :approved, if: :approvable?
      transition approved: :unapproved
    end

  end

  def self.permitted_params
    [ :name, :email, :is_success, :restored_at, :website_url, :feedback, :feedback_editable_copy, :url, :image, :state, :feedback_type ]
  end

  def self.feedback_types
    [ :restore, :testimonial, :case_study ]
  end

  def is_success_str
    is_success? ? "yes" : "no"
  end

  def to_json(options = nil)
    super(only: [ :name, :email, :restored_at, :website_url, :feedback, :url, :state ], methods: [:image_url])
  end

  def approvable?
    name.present?
  end

  def row_class
    approved? ? "success" : "warning"
  end

  def image_url
    image.url if image_stored?
  end

  def image_thumbnail_url
    image.thumb("150x150#").url if image_stored?
  end

private

  def set_defaults
    self.feedback_type ||= Feedback.feedback_types.first
    self.feedback_editable_copy ||= self.feedback
  end

end