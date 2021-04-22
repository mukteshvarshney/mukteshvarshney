class CreateStoreRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :store_ratings do |t|
      t.text :store_rating_with_comments
      t.string :given_by
      t.references :store_detail, foreign_key: true

      t.timestamps
    end
  end
end
