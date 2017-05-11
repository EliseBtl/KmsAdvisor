#class Ability
#  include CanCan::Ability


#  def initialize(user)
#       if user.admin?

#            can :update, Man do |man|
#                man.user == user 
#            end  

#            can :destroy, Man do |man|
#                man.user == user 
#            end 

#            can :create, Man

#           else
#            can :read, Man

#       end
#  end
#end
