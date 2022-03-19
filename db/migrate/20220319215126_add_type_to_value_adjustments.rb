class AddTypeToValueAdjustments < ActiveRecord::Migration[7.0]
  def change
    add_reference :value_adjustments, :user, index: true
  end
end
