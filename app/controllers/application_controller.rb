class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :current_order
  helper_method :admin_user

  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

  def admin_user
    @admin_user ||= User.find_by_auth_token_and_role_id(cookies[:auth_token], 1) if cookies[:auth_token]
  end

  def current_order
    @current_order = current_user.orders.find_by(order_status_id: 1)
  end

  def authorize
    redirect_to '/login' unless current_user
  end

  def authorizeAdministrator
    redirect_to '/login' unless admin_user
  end


end
