class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, Bicycle, user_id: user.id
    can :manage, Suggestion, bicycle: { user_id: user.id }
    can [:use, :read], Bicycle
    can :create, Suggestion
  end
end
