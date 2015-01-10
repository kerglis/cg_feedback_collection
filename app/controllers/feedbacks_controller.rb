class FeedbacksController < ApplicationController

  inherit_resources

  respond_to :html

  def index
    @feedback = Feedback.new
    render :new
  end

  def create
    create! do |success, failure |
      success.html do
        redirect_to resource.is_success? ? edit_resource_url : resource_url
      end
    end
  end

private

  def permitted_params
    params.permit( feedback: Feedback.permitted_params )
  end

end