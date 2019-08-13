module ApplicationHelper
  def user_avatar(u)
    if u.avatar.attached?
      image_tag u.avatar
    else
      image_tag 'default-profile-pic.png', style: "width: 100%;"
    end
  end
end
