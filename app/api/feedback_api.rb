class FeedbackAPI < Grape::API

  helpers do
    def clean_params
      ActionController::Parameters.new(params).permit(Feedback.permitted_params)
    end
  end

  resource :feedback do
    desc "Return a list of feedbacks"
    params do
      optional :limit,    type: Integer,  desc: "Limit (default = 20)"
      optional :filter,   type: String,   desc: "successful || unsuccessful"
    end
    get :list do
      limit = params[:limit] || 20

      scope = Feedback

      if params[:filter] and [:successful, :unsuccessful].include?(params[:filter].to_sym)
        scope = scope.send(params[:filter])
      end

      scope.limit(limit)
    end

    desc "Create a feedback"
    params do
      requires :is_success,         type: Boolean
      requires :feedback,           type: String
      optional :name,               type: String
      optional :email,              type: String
      optional :restored_at,        type: Date
      optional :image,              type: String
      optional :website_url,        type: String
    end
    post do
      Feedback.create!(clean_params)
    end
  end

end