class AddDescriptionToArticle < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :description, :text, first: true
  end
end
