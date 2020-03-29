class CreateSolutions < ActiveRecord::Migration[6.0]
  def change
    create_table :solutions do |t|
      t.text :detail, null: false
      t.timestamps
    end
  end
end
