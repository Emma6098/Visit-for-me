class AddQuestionToCriteres < ActiveRecord::Migration[7.0]
  def change
    remove_column :criteres, :question, :text
    add_column :criteres, :question, :string
  end
end
