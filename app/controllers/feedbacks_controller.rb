class FeedbacksController < ApplicationController

  inherit_resources

  def index
    render :new
  end

end
