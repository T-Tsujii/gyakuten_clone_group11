class CreateAwsTexts < ActiveRecord::Migration[6.0]
  def change
    create_table :aws_texts do |t|
      t.string :title, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
