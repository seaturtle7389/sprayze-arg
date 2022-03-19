class NftController < ApplicationController

  def index
    @sprayzecoin = CryptoCoin.first
    @value_adjustments = @sprayzecoin.value_portfolio.value_adjustments.order(created_at: :desc).page params[:page]
  end
end
