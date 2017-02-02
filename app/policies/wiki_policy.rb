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

  class Scope

    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      wikis = []

      if user.admin?
        wikis = scope.all
      elsif user.premium?
        all_wikis = scope.all
        all_wikis.each do |wiki|
          if !wiki.private || wiki.user_id == user.id
            wikis << wiki
          end
        end
      else
        all_wikis = scope.all
        all_wikis.each do |wiki|
          if !wiki.private
            wikis << wiki
          end
        end
      end
      return wikis 
    end
  end

private

  def correct_user
    user.id == wiki.user_id
  end
end
