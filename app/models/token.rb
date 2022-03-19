class Token < ApplicationRecord
  has_one :value_portfolio, as: :investment
  belongs_to :collection
end
