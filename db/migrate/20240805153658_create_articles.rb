class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :es_title
      t.string :en_title
      t.text :es_body
      t.text :en_body

      t.timestamps
    end
  end
end
