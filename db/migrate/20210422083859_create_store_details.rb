class CreateStoreDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :store_details do |t|
      t.string :name
      t.string :type
      t.text :address
      t.string :owner_name
      t.string :owner_number
      t.datetime :timing
      t.string :remark
      t.string :status
      t.string :total_ratings

      t.timestamps
    end
  end
end
