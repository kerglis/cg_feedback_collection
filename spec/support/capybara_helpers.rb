module CapybaraHelpers

  def prepared_feedback_link(params = nil)

    params ||= {
      feedback: {
        email: "email@example.com",
        restored_at: Time.now,
        url: "www.example.com"
      }
    }

    "/?#{params.to_query}"
  end

end