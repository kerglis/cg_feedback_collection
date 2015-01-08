module ApplicationHelper

  def state_switch(feedback)
    if feedback.approved?
      action = :unapprove
      cl = "green"
    else
      action = :approve
      cl = "gray"
    end

    link_to fa_icon("check-circle #{cl}"), "#", class: "btn btn-mini", title: feedback.state
  end

end
