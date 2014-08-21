class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.references :tag
      t.references :post
      t.timestamps
    end
  end
end
