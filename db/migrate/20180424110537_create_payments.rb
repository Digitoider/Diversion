class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|

      t.datetime :starts_at
      t.datetime :ends_at

      t.integer :user_id

      t.timestamps
    end
  end
end
