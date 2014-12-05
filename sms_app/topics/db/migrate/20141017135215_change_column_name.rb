class ChangeColumnName < ActiveRecord::Migration
  def up
  	rename_column :comments, :imageable_id, :commentable_id
  	rename_column :comments, :imageable_type, :commentable_type
  end

  def down
  	rename_column :comments, :imageable_id, :commentable_id
  	rename_column :comments, :imageable_type, :commentable_type
  end
end
