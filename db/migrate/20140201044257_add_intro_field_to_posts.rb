class AddIntroFieldToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :intro, :text
    add_column :posts, :intro_html, :text
  end
end
