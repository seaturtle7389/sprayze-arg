class CreateCryptoCoin < ActiveRecord::Migration[7.0]
  def change
    create_table :crypto_coins do |t|
      t.string :name

      t.timestamps
    end
  end
end
