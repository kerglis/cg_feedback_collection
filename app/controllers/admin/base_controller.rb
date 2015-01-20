class Admin::BaseController < ApplicationController

  before_filter :authenticate

protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      if ENV['cg_feedback_app_admin_user'] and ENV['cg_feedback_app_admin_password']
        username == ENV['cg_feedback_app_admin_user'] and password == ENV['cg_feedback_app_admin_password']
      else
        false
      end
    end
  end

end
