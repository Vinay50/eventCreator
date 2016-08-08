class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :event_start_date
      t.datetime :event_finish_date
      t.string :avatar

      t.timestamps null: false
    end
  end
end
