module ApplicationHelper
  def login_helper
    unless current_user.is_a?(GuestUser) 
       link_to "Logout", destroy_user_session_path, method: :delete 
    else 
       (link_to "Register", new_user_registration_path) +
       (link_to "Login", new_user_session_path)
    end 
  end  

  def sample_helper
    content_tag(:div, "My content", class: "my-class")
  end
  
end
