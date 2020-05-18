class CreateThoughts < ActiveRecord::Migration[6.0]
  def change
    create_table :thoughts do |t|
      t.integer :author_id
      t.text :text

      t.timestamps
    end
    add_index :thoughts, [:author_id, :created_at]
  end
end
