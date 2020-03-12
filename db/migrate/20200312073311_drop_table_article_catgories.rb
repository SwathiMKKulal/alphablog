class DropTableArticleCatgories < ActiveRecord::Migration[6.0]
  def change
  	drop_table :article_catgories
  end
end
