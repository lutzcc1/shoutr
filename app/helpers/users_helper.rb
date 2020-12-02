module UsersHelper
  
    def follow_button(user)
      if current_user.following?(user)
        button_to "unfollow", unfollow_user_path, method: :delete
    else
        button_to "follow", follow_user_path
      end
    end
end
