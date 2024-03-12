class CreateHabits < ActiveRecord::Migration[6.1]
  def change
    create_table :habits do |t|
      t.time :m_time
      t.time :n_time
      t.text :about
      t.integer :user_id
      t.string :task

      t.timestamps
    end
  end
end
