module CollaboratorsHelper
  def available_users(wiki)
    all_users = User.all
    available_users = []
    all_users.each do |user|
      next if user.id == wiki.user_id
      if !wiki.users.include?(user)
        available_users << user
      end
    end
    available_users
  end
end
