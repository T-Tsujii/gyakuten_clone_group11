class CreatePhps < ActiveRecord::Migration[6.0]
  def change
    create_table :phps do |t|
      t.string :title
      t.string :url
      t.timestamps
    end
  end
end
