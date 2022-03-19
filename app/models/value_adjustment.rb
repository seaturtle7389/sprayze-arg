class ValueAdjustment < ApplicationRecord
  paginates_per 10
  belongs_to :value_portfolio
  belongs_to :user, optional: true
  before_create :adjust_value

  def adjust_value
    value_portfolio = self.value_portfolio
    value_portfolio.amount += self.amount
    value_portfolio.save!

    write_attribute :historical_value, value_portfolio.amount
  end
end
