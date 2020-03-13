class CreateArticleCatgories < ActiveRecord::Migration[6.0]
  def change
    create_table :article_catgories do |t|
    t.string :name
    end
  end
end
