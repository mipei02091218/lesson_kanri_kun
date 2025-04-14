class CreateLessons < ActiveRecord::Migration[7.1]
  def change
    create_table :lessons do |t|
      t.datetime :start_time, null: false
      t.timestamps
    end
  end
end
