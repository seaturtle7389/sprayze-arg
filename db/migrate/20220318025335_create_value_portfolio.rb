class CreateValuePortfolio < ActiveRecord::Migration[7.0]
  def change
    create_table :value_portfolios do |t|
      t.float :amount
      t.string :growth_rate
      t.bigint :investment_id
      t.string :investment_type

      t.timestamps
    end

    add_index :value_portfolios, [:investment_type, :investment_id]
  end
end
