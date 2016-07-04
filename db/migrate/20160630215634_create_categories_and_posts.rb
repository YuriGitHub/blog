class CreateCategoriesAndPosts < ActiveRecord::Migration
  def change
    create_table :categories_and_posts do |t|
      t.belongs_to :category
      t.belongs_to :post
    end
  end
end
