class FeedbackEntity < Grape::Entity
  expose :name
  expose :email
  expose :restored_at
  expose :website_url
  expose :feedback_editable_copy
  expose :url
  expose :state
  expose :image_url
  expose :image_thumbnail_url
  expose :image_name
end

class FeedbackAPI < Grape::API
  helpers do
    def clean_params
      ActionController::Parameters.new(params).permit(Feedback.permitted_params)
    end
  end

  use Rack::JSONP

  resource :feedback do
    desc "Return a list of feedbacks"
    params do
      optional :limit,    type: Integer,  desc: "Limit (default = 10)"
      optional :filter,   type: String,   desc: "successful || unsuccessful"
    end
    get :list do
      limit = params[:limit] || 10

      scope = Feedback.approved

      if params[:filter] and [:successful, :unsuccessful].include?(params[:filter].to_sym)
        scope = scope.send(params[:filter])
      end

      feedbacks = scope.limit(limit)

      present feedbacks, with: FeedbackEntity
    end

    desc "Create a feedback"
    params do
      requires :is_success,         type: Boolean
      requires :feedback,           type: String
      optional :name,               type: String
      optional :url,                type: String
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