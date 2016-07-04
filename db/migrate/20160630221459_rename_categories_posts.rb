class RenameCategoriesPosts < ActiveRecord::Migration
  def change
    rename_table :categories_and_posts, :categories_posts
  end
end
