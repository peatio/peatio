module Admin
  class Ability
    include CanCan::Ability

    def initialize(user)
      return unless user.admin?

      can :read, Order
      can :read, Trade
      can :read, Member
      can :read, Proof
      can :update, Member
      can :toggle, Member
      can :update, Proof
      can :manage, Document
      can :manage, Ticket

      can :menu, Deposit
      can :manage, ::Deposits::Bank
      can :manage, ::Deposits::Satoshi
      can :manage, ::Deposits::Protoshare
      can :manage, ::Deposits::Dogecoin

      can :menu, Withdraw
      can :manage, ::Withdraws::Bank
      can :manage, ::Withdraws::Satoshi
      can :manage, ::Withdraws::Protoshare
      can :manage, ::Withdraws::Dogecoin

      can :stat, ::Member
    end
  end
end
