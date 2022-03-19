class AddHistoricalValueToValueAdjustment < ActiveRecord::Migration[7.0]
  def change
    add_column :value_adjustments, :historical_value, :float
  end
end
