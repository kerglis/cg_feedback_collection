module ApplicationHelper

  def state_switch(obj)
    if obj.approved?
      action = :unapprove
      cl = "green"
    else
      action = :approve
      cl = "gray"
    end

    link_to fa_icon("check-circle #{cl}"), url_for([:swap, :admin, obj]), title: obj.state, remote: true
  end

end
