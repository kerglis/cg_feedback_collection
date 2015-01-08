class Admin::FeedbacksController < Admin::BaseController

  inherit_resources

  respond_to :html

  def update
    update! { collection_url }
  end

private

  def collection
    @q = Feedback.search(params[:q])
    @feedbacks = @q.result(distinct: true).paginate(page: params[:page], per_page: 20)
  end

  def permitted_params
    params.permit( feedback: Feedback.permitted_params )
  end

end