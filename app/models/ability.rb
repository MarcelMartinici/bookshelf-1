class Ability
  include CanCan::Ability



  def initialize(user)
    # Define abilities for the passed in user here. For example:

   alias_action :read, :update, :destroy, :to => :crud

   user ||= User.new # guest user (not logged in)

       # can :manage, Book, :active => true, :user_id => user.id # Manage only users books

     if user.is?('admin')
       can :manage, :all
       can :create, Book
     elsif user.is?("default")
       can :read, Book
       can :create, Book
       can :manage, Book, :user_id => user.id
      else
       can :read, :all
     end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end

  private


end