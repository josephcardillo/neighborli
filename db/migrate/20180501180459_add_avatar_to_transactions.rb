class AddAvatarToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :avatar, :string
  end
end
