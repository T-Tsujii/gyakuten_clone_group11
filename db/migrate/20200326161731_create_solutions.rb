class CreateSolutions < ActiveRecord::Migration[6.0]
  def change
    create_table :solutions do |t|
      t.text :s_answer
      t.timestamps
    end
  end
end
