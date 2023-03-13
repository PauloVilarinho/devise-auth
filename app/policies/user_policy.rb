class UserPolicy
  attr_reader :user

  def initialize(user, _record)
    @user = user
  end

  def edit_role?
    user.present? && user.admin?
  end

  def permitted_attributes
    if edit_role?
      [:role]
    else
      []
    end
  end
end
