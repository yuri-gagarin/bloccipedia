module WikisHelper

  def higher_level_user?
    current_user.admin? || current_user.premium?
  end

  
end
