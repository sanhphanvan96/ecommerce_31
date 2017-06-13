module UsersHelper
  def get_user_by_id user_id
    User.find_by id: user_id
  end
end
