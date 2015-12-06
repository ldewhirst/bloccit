class CreateRateables < ActiveRecord::Migration
  def change
    create_table :rateables do |t|
      t.references :rating, index: true
      t.references :rate, polymorphic: true, index: true
      t. timestamps null: false
    end
    add_foreign_key :rateables, :ratings
  end
end
