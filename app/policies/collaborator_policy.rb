class CollaboratorPolicy < ApplicationPolicy

  attribute_reader :user, :collaborator

  def initialize(user, collaborator)
    @user = user
    @collaborator = collaborator
  end

  def new?
    @wiki = params[:wiki_id]
    user.admin? || user.wiki_id == @wiki.id
  end

  def create?
    @wiki = params[:wiki_id]
    user.admin? || user.wiki_id == @wiki.id
  end

  def destroy?
    @wiki = params[:wiki_id]
    user.admin? || user.wiki_id == @wiki.id
  end

end
