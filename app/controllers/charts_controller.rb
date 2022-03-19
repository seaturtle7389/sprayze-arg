class ChartsController < ApplicationController
  def sprayzecoin
    sprayzecoin = CryptoCoin.first
    value_portfolio = sprayzecoin.value_portfolio
    value_adjustments = value_portfolio.value_adjustments
    render json: value_adjustments.pluck(:created_at, :historical_value).map { |v| [ v[0].strftime("%-m/%-d/%y %I:%M %p %Z"), v[1] ] } 
  end
end
