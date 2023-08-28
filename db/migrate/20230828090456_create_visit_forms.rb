class CreateVisitForms < ActiveRecord::Migration[7.0]
  def change
    create_table :visit_forms do |t|
      t.string :title
      t.string :adress
      t.float :longitude
      t.float :latitude
      t.text :description
      t.string :url
      t.datetime :date
      t.integer :rooms_number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
