class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author
      t.string :title
      t.string :body
      t.references :post
      t.timestamps
    end
  end
end
