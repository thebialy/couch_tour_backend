class CreateLivestreams < ActiveRecord::Migration[6.0]
  def change
    create_table :livestreams do |t|
      t.string :band
      t.date :show_day
      t.string :show_link
      t.string :img
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
