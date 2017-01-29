class WikiPolicy < ApplicationPolicy

  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def edit?
    if !wiki.private
      user.present?
    else
      user.admin? || correct_user
    end

  end

  def update?
    if !wiki.private
      user.present?
    else
      user.admin? || correct_user
    end
  end

  def destroy?
    user.admin? || correct_user
  end

private

def correct_user

  user.id == wiki.user_id

end

end
