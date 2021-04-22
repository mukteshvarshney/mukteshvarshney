class RenameTypeToStoreType < ActiveRecord::Migration[5.1]
  def change
  	rename_column :store_details, :type, :store_type
   end
end
