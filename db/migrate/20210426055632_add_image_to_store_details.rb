class AddImageToStoreDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :store_details, :image, :string
  end
end
