class CreateSheets < ActiveRecord::Migration[7.1]
  def change
    create_table :sheets do |t|  # デフォルトのid設定が自動的に適用される
      t.integer :column, limit: 5, null: false
      t.string :row, limit: 1, null: false

      t.timestamps
    end
  end
end
