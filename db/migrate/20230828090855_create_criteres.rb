class CreateCriteres < ActiveRecord::Migration[7.0]
  def change
    create_table :criteres do |t|
      t.text :content
      t.references :visit_form, null: false, foreign_key: true
      t.timestamps
    end
  end
end
