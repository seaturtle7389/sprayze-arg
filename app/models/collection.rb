class Collection < ApplicationRecord
  has_one :value_portfolio, as: :investment
  has_many :tokens
end
