class CryptoCoin < ApplicationRecord
  has_one :value_portfolio, as: :investment

  def value
    self.value_portfolio.try(:amount)
  end

  def growth_rate
    self.value_portfolio.try(:growth_rate)
  end
end
