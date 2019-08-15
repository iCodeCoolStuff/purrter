module ApplicationHelper
  def user_avatar(u, options={})
    if u.avatar.attached?
      image_tag u.avatar, options
    else
      image_tag 'default-profile-pic.png', options
    end
  end
end
