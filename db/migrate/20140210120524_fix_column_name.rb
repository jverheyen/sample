class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :posts, :type, :typeOfPost
  end
end
