class UserList
  def initialize(list)
    @list = list
    @user = list.user
  end

  def user_name
    @user.name
  end

  def list_id
    @list.id
  end
end
