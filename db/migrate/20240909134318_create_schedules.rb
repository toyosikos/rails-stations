class CreateSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :schedules do |t|
      t.integer :movie_id                  # 映画の外部キーID
      t.time :start_time, null: false, comment: '上映開始時刻'  # TIME型、コメント付き
      t.time :end_time, null: false, comment: '上映終了時刻'    # TIME型、コメント付き


      t.timestamps
      t.index [:movie_id, :start_time, :end_time], unique: true, name: 'index_schedules_on_unique_combination'
    end
        # インデックスの追加
    
  end
end

