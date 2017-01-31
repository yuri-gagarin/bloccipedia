class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  private
  def not_authorized
    self.response_body = nil

    flash[:notice] = 'You are not authorized to perform this action'
    redirect_to request.headers['Referer'] || root_path
  end


end
