class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :current_order

  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

  def current_order
    @current_order = current_user.orders.find_by(order_status_id: 1)
  end

  def authorize
    redirect_to '/login' unless current_user
  end



end
