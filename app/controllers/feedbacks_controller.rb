class FeedbacksController < ApplicationController

  inherit_resources

  def index
    render :new
  end

  def create
    create! do |success, failure |
      success.html { redirect_to edit_resource_url }
    end
  end

private

  def permitted_params
    params.permit( feedback: Feedback.permitted_params )
  end

end
