class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.date :date, null: false
      t.references :movie,foreign_key: true
      t.references :schedule, null: false, foreign_key: true
      t.references :sheet , null: false, foreign_key: true
      t.string :email, limit: 255, null: false,comment: "予約者メールアドレス"
      t.string :name ,limit: 50, null: false,comment: "予約者名"
      t.timestamps
    end
    add_index :reservations, [:schedule_id, :sheet_id], unique: true, name: 'index_res_on_sched_sheet'
  end
end
