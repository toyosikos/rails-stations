class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      
      t.date :date, null: false
      t.references :schedule, null: false, foreign_key: true
      t.references :sheet , null: false, foreign_key: true
      t.references :screen, null: false, foreign_key: true
      t.references :theater, null: false, foreign_key: true  # theater_idの定義
      t.string :email, limit: 255, null: false,comment: "予約者メールアドレス"
      t.string :name ,limit: 50, null: false,comment: "予約者名"
      t.timestamps
    end
    add_index :reservations, %i[date schedule_id sheet_id screen_id theater_id], unique: true, name: 'index_reservations_on_date_and_ids'  end
end
