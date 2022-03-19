class ValuePortfolio < ApplicationRecord
  belongs_to :investment, polymorphic: true
  has_many :value_adjustments
end
