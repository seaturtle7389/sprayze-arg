class AdminController < ApplicationController 
  layout 'admin'
  before_action :require_admin
  before_action :require_main_routes

  def index
    @sprayzecoin = CryptoCoin.first
    @value_adjustments = @sprayzecoin.value_portfolio.value_adjustments.order(created_at: :desc).page params[:page]
  end

  def require_admin
    puts current_user
    puts current_user.admin
    unless current_user && current_user.admin
      redirect_to root_path
    end
  end
end
