class AddSprayzeMemberToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin, :boolean, default: false, null: false
    add_column :users, :sprayze_member, :boolean, default: false, null: false
  end
end
