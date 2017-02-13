class CollaboratorPolicy < ApplicationPolicy

  # attr_reader :user, :collaborator
  #
  # def initialize(user, collaborator)
  #   @user = user
  #   @collaborator = collaborator
  # end

  def new?
    user.admin? || @wiki.user_id == user_id
  end

  def create?
    user.admin? || @wiki.user_id == user_id
  end

  def destroy?
    user.admin? || @wiki.user_id == user_id
  end

end
