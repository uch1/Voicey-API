class CreateMemos < ActiveRecord::Migration[5.1]
  def change
    create_table :memos do |t|
      t.string :title
      t.date :date
      t.text :text_body
      t.references :user

      t.timestamps
    end
  end
end
