class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user
    can :read, Post, public: true

    return unless user.present?

    can :read, Post, user_id: user.id
    can :destroy, Post, author_id: user.id
    can :destroy, Comment, author_id: user.id
    can :destroy, Post, id: user.posts.pluck(:id)

    return unless user.admin?

    can :manage, Post
    can :manage, Comment
  end
end
