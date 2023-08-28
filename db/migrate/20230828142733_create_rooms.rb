class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.text :description
      t.string :name
      t.references :visit_form, null: false, foreign_key: true

      t.timestamps
    end
  end
end
