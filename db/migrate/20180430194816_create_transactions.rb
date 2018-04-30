class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :borrower_id
      t.integer :lender_id
      t.string :status
      t.datetime :expires_at
      t.datetime :starts_at
      t.string :action
      t.boolean :has_borrower_feedback
      t.boolean :has_lender_feedback
      t.string :category
      t.string :title
      t.text :body
      t.string :item_location
      t.integer :loan_duration
      t.decimal :day_rate

      t.timestamps
    end
  end
end
