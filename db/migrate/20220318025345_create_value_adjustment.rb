class CreateValueAdjustment < ActiveRecord::Migration[7.0]
  def change
    create_table :value_adjustments do |t|
      t.belongs_to :value_portfolio
      t.float :amount

      t.timestamps
    end
  end
end
