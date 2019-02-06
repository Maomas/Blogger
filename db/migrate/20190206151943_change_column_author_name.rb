class ChangeColumnAuthorName < ActiveRecord::Migration
  def change
	  rename_column :comments, :autohr_name, :author_name
  end
end
