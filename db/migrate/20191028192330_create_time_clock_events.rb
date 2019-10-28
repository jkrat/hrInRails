class CreateTimeClockEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :time_clock_events do |t|
      t.references :time_card, foreign_key: true
      t.datetime :time, null: false
      t.string :type, null: false
      t.timestamps
    end
  end
end

