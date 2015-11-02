class CreateBillingRulles < ActiveRecord::Migration
  def change
    create_table :billing_rulles do |t|
      t.text :name
      t.boolean :default
      t.float :price
      t.float :big_size_price
      t.string :giff_price

      t.timestamps null: false
    end
  end
end
