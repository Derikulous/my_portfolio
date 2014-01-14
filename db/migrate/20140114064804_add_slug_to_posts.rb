class AddSlugToPosts < ActiveRecord::Migration
  def create
    add_column :posts, :slug, :string
    add_index :posts, :slug
  end
end
