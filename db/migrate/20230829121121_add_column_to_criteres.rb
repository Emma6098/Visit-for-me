class AddColumnToCriteres < ActiveRecord::Migration[7.0]
  def change
    rename_column :criteres, :content, :question
    add_column :criteres, :answer, :text
  end
end
