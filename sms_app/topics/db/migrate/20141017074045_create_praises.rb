class CreatePraises < ActiveRecord::Migration
  def change
    create_table :praises do |t|
      t.string :title
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
