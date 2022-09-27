# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    
  #   if user.role.code == "admin"
  #     can :manage, :all
  #   elsif user.role.code == "employee"
  #       # can :read, Schedule
  #       # can :read, Flight
  #       # can :read, Booking
  #       can :update, Booking, user_id: user.id
  #       can :read, Ticket
  #     end
   end
end
