class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def index?
    true
  end

  def create?
    user.present? && user.publisher?
  end

  def new?
    create?
  end

  def update?
    user.present? && user.publisher? && post.user_id == user.id
  end

  def edit?
    update?
  end

  def destroy?
    user.present? && user.admin?
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.nil? || user.admin?
        scope.all
      else
        user.posts
      end
    end

    private

    attr_reader :user, :scope
  end
end
